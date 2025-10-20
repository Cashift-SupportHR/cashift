import 'package:app_links/app_links.dart';

class LinkHandler {
  final _appLinks = AppLinks();

  Future<void> init() async {
    // App launched by a link
    final initialUri = await _appLinks.getInitialAppLink();
    if (initialUri != null) _handleUri(initialUri);

    // Links while app is running/resumed
    _appLinks.uriLinkStream.listen(_handleUri, onError: (err) {
      // handle errors
    });
  }

  void _handleUri(Uri uri) {
    if (uri.scheme == 'geo') {
      final coords = uri.path; // e.g. "25.2524546,55.4165958"
      final q = uri.queryParameters['q']; // e.g. "Lootah Technical Centre"
      print('Coordinates: $coords | Query: $q');
      // Show map screen
    }
  }
}
