import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../generated/assets.dart';


class PointsMapScreen extends StatefulWidget {
  final List<LatLng> points;
  final bool isShowBackButton;
  const PointsMapScreen({Key? key, required this.points, required this.isShowBackButton}) : super(key: key);


  static show(BuildContext context, List<LatLng> points, {bool isShowBackButton = true}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PointsMapScreen(points: points, isShowBackButton: isShowBackButton),
      ),
    );
  }

  @override
  State<PointsMapScreen> createState() => _PointsMapScreenState();
}

class _PointsMapScreenState extends State<PointsMapScreen> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  // Future<void> _createMarkers() async {
  //   if (widget.points.isEmpty) return;
  //
  //   // Load the custom icon once (or fall back to the default marker).
  //   final BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
  //       const ImageConfiguration(size: Size(1, 1)), Assets.pinIcon);
  //
  //   _markers = widget.points.asMap().entries.map((e) {
  //     return Marker(
  //       markerId: MarkerId('marker_${e.key}'),
  //       position: e.value,
  //       icon: icon,
  //     );
  //   }).toSet();
  //
  //   if (mounted) setState(() {});
  // }

  Future<void> _createMarkers() async {
    if (widget.points.isEmpty) return;

    // Load icons
    final BitmapDescriptor defaultIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)), Assets.pinIcon);

    final BitmapDescriptor firstIcon = await BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen); // Replace with your asset path

    final BitmapDescriptor lastIcon = await BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed); // Replace with your asset path

    _markers = widget.points.asMap().entries.map((e) {
      final index = e.key;
      final point = e.value;

      BitmapDescriptor icon;
      if (index == 0) {
        icon = firstIcon; // First point
      } else if (index == widget.points.length - 1) {
        icon = lastIcon; // Last point
      } else {
        icon = defaultIcon;
      }

      return Marker(
        markerId: MarkerId('marker_$index'),
        position: point,
        icon: icon,
      );
    }).toSet();

    if (mounted) setState(() {});
  }




  // Move camera so that **all** points are visible.
  void _fitCameraToPoints() {
    if (_mapController == null || widget.points.isEmpty) return;

    if (widget.points.length == 1) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: widget.points.first, zoom: 14),
        ),
      );
      return;
    }

    final bounds = _computeBounds(widget.points);
    _mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 60), // 60 px padding
    );
  }

  LatLngBounds _computeBounds(List<LatLng> pts) {
    double north = pts.first.latitude;
    double south = pts.first.latitude;
    double east = pts.first.longitude;
    double west = pts.first.longitude;

    for (final p in pts) {
      if (p.latitude > north) north = p.latitude;
      if (p.latitude < south) south = p.latitude;
      if (p.longitude > east) east = p.longitude;
      if (p.longitude < west) west = p.longitude;
    }

    return LatLngBounds(
      northeast: LatLng(north, east),
      southwest: LatLng(south, west),
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (c) {
              _mapController = c;
              _fitCameraToPoints();
            },
            initialCameraPosition: CameraPosition(
              target: widget.points.first,
              zoom: 2, // wide enough until we animate to bounds
            ),
            markers: _markers,
            myLocationButtonEnabled: false,
          ),
          if (widget.isShowBackButton)
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            child: Material(
              color: Colors.white,
              shape: const CircleBorder(),
              elevation: 2,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
