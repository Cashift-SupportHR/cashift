import 'package:app_links/app_links.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'dart:io' as io;

class LinkHandler {
  final _appLinks = AppLinks();

  Future<void> init() async {
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) _handleUri(initialUri);

    _appLinks.uriLinkStream.listen(_handleUri, onError: (err) {});
  }

  void _handleUri(Uri uri) {
    () async {
      LatLng? pos = _extractLatLng(uri);

      // If nothing extracted, try to resolve short links then geocode text
      if (pos == null && _isShortMapHost(uri)) {
        final resolved = await _resolveShortLink(uri);
        if (resolved != null) {
          pos = _extractLatLng(resolved) ?? await _geocodeFromUri(resolved);
        }
      }

      pos ??= await _geocodeFromUri(uri);
      if (pos == null) return;

      void navigate() {
        final context = Get.context!;
        Navigator.pushNamed(context, Routes.searchEmployeeMapPage, arguments: pos);
      }

      if (Get.context == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) => navigate());
      } else {
        navigate();
      }
    }();
  }

  // ---- Coordinate extractors ----
  LatLng? _extractLatLng(Uri uri) {
    try {
      switch (uri.scheme) {
        case 'geo':
          return _parseGeoUri(uri);
        case 'http':
        case 'https':
          return _parseHttpMapUri(uri);
        case 'comgooglemaps':
          return _parseComGoogleMapsUri(uri);
        case 'maps':
          return _parseAppleMapsUri(uri);
        default:
          return _parseFromQueryOrPath(uri);
      }
    } catch (_) {
      return null;
    }
  }

  LatLng? _parseGeoUri(Uri uri) {
    final path = uri.path;
    String? coords;

    if (path.isNotEmpty && path != '0,0') {
      coords = path;
    } else {
      final q = uri.queryParameters['q'];
      if (q != null && q.isNotEmpty) {
        coords = _stripLabel(q);
      }
    }

    return _latLngFromCsv(coords);
  }

  LatLng? _parseHttpMapUri(Uri uri) {
    final host = uri.host.toLowerCase();

    // 1) First try generic query/path extraction
    final generic = _parseFromQueryOrPath(uri);
    if (generic != null) return generic;

    // 2) Google Maps specific: /@lat,lng,zoom or /maps/@lat,lng,zoom
    final atIndex = uri.path.indexOf('/@');
    if (atIndex != -1) {
      final afterAt = uri.path.substring(atIndex + 2);
      final parts = afterAt.split(',');
      if (parts.length >= 2) {
        final lat = double.tryParse(parts[0]);
        final lng = double.tryParse(parts[1]);
        if (lat != null && lng != null) return LatLng(lat, lng);
      }
    }

    // 3) OpenStreetMap hash format: .../#map=zoom/lat/lon
    if (host.contains('openstreetmap.org') && uri.fragment.isNotEmpty) {
      final frag = uri.fragment; // e.g. map=15/25.1/55.2
      final segs = frag.split('/');
      if (segs.length >= 3) {
        final lat = double.tryParse(segs[1]);
        final lng = double.tryParse(segs[2]);
        if (lat != null && lng != null) return LatLng(lat, lng);
      }
    }

    return null;
  }

  LatLng? _parseComGoogleMapsUri(Uri uri) {
    final q = uri.queryParameters['q'];
    if (q != null) {
      final res = _latLngFromString(_stripLabel(q));
      if (res != null) return res;
    }
    final center = uri.queryParameters['center'] ?? uri.queryParameters['ll'];
    if (center != null) {
      return _latLngFromCsv(center);
    }
    return null;
  }

  LatLng? _parseAppleMapsUri(Uri uri) {
    final ll = uri.queryParameters['ll'] ?? uri.queryParameters['sll'];
    if (ll != null) return _latLngFromCsv(ll);

    final q = uri.queryParameters['q'];
    if (q != null) return _latLngFromString(_stripLabel(q));

    return null;
  }

  LatLng? _parseFromQueryOrPath(Uri uri) {
    final qp = uri.queryParameters;

    LatLng? fromPair(String a, String b) {
      final la = double.tryParse(qp[a] ?? '');
      final lo = double.tryParse(qp[b] ?? '');
      if (la != null && lo != null) return LatLng(la, lo);
      return null;
    }

    final candidates = <LatLng?>[
      fromPair('lat', 'lng'),
      fromPair('lat', 'lon'),
      fromPair('lat', 'long'),
      fromPair('latitude', 'longitude'),
      fromPair('mlat', 'mlon'),
    ];
    for (final c in candidates) {
      if (c != null) return c;
    }

    // Single parameter containing both coords
    final ll = qp['ll'] ?? qp['sll'] ?? qp['coords'] ?? qp['coordinate'];
    final llParsed = _latLngFromCsv(ll);
    if (llParsed != null) return llParsed;

    // Common Google params: query, destination, origin, daddr, saddr can contain "lat,lng" or "loc:lat,lng"
    for (final key in const ['query', 'destination', 'origin', 'daddr', 'saddr', 'q']) {
      final v = qp[key];
      if (v == null) continue;
      final parsed = _latLngFromString(v);
      if (parsed != null) return parsed;
    }

    // Path sometimes contains ".../place/Some+Address" -> no coords, handled by geocoding later.
    // Still, try raw lat,lng in path if present
    final match = RegExp(r'(\-?\d+\.?\d*),(\-?\d+\.?\d*)').firstMatch(uri.path);
    if (match != null) {
      final lat = double.tryParse(match.group(1)!);
      final lng = double.tryParse(match.group(2)!);
      if (lat != null && lng != null) return LatLng(lat, lng);
    }

    return null;
  }

  // ---- Fallbacks ----
  bool _isShortMapHost(Uri uri) {
    final h = uri.host.toLowerCase();
    return h == 'maps.app.goo.gl' || h == 'goo.gl' || h == 'goo.gle' || h == 'g.page' || h == 'g.page.link';
  }

  Future<Uri?> _resolveShortLink(Uri uri) async {
    try {
      final client = io.HttpClient();
      final req = await client.getUrl(uri);
      req.followRedirects = false; // set on request, not client
      final res = await req.close();
      if (res.isRedirect) {
        final loc = res.headers.value('location');
        if (loc != null) return Uri.parse(loc);
      }
      // Try HEAD if GET didn't redirect
      final headReq = await client.openUrl('HEAD', uri);
      headReq.followRedirects = false; // set on request
      final headRes = await headReq.close();
      if (headRes.isRedirect) {
        final loc = headRes.headers.value('location');
        if (loc != null) return Uri.parse(loc);
      }
    } catch (_) {}
    return null;
  }

  Future<LatLng?> _geocodeFromUri(Uri uri) async {
    // Extract a human-readable address or plus code from the URL
    final text = _extractAddressText(uri);
    if (text == null || text.isEmpty) return null;
    try {
      final results = await geocoding.locationFromAddress(text);
      if (results.isNotEmpty) {
        final loc = results.first;
        return LatLng(loc.latitude, loc.longitude);
      }
    } catch (_) {}
    return null;
  }

  String? _extractAddressText(Uri uri) {
    final qp = uri.queryParameters;

    // Prefer query text if present and not obviously coords
    for (final key in const ['query', 'q', 'destination', 'origin']) {
      final v = qp[key];
      if (v == null) continue;
      if (_latLngFromString(v) != null) continue; // it's coords; handled elsewhere
      final s = Uri.decodeComponent(v).replaceAll('+', ' ').trim();
      if (s.isNotEmpty) return s;
    }

    // Google Maps place URLs: /maps/place/<name and/or plus code>/...
    final path = uri.path;
    final placeIdx = path.toLowerCase().indexOf('/place/');
    if (placeIdx != -1) {
      var after = path.substring(placeIdx + '/place/'.length);
      // Cut off trailing segments like /data=...
      final cut = after.indexOf('/data=');
      if (cut != -1) after = after.substring(0, cut);
      final decoded = Uri.decodeComponent(after).replaceAll('+', ' ').trim();
      if (decoded.isNotEmpty) return decoded;
    }

    return null;
  }

  // ---- Helpers ----
  String _stripLabel(String value) {
    final beforeParen = value.split('(').first;
    return beforeParen.trim();
  }

  LatLng? _latLngFromCsv(String? csv) {
    if (csv == null || csv.isEmpty) return null;
    final s = csv.replaceAll('%2C', ',');
    final parts = s.split(',');
    if (parts.length != 2) return null;
    final lat = double.tryParse(parts[0].trim());
    final lng = double.tryParse(parts[1].trim());
    if (lat == null || lng == null) return null;
    return LatLng(lat, lng);
  }

  LatLng? _latLngFromString(String value) {
    final s = Uri.decodeComponent(value);
    // Recognize patterns: "lat,lng" optionally prefixed by "loc:" and with spaces
    final re = RegExp(r'(?:loc:)?\s*(\-?\d+(?:\.\d+)?)[ ,]+(\-?\d+(?:\.\d+)?)');
    final m = re.firstMatch(s);
    if (m != null) {
      final lat = double.tryParse(m.group(1)!.trim());
      final lng = double.tryParse(m.group(2)!.trim());
      if (lat != null && lng != null) return LatLng(lat, lng);
    }
    return null;
  }
}
