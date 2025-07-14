import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

class StaticMapWidget extends StatefulWidget {
  final LatLng location;
  final String title;
  final bool isNormalIcon;
  final double zoom;
  final bool enableMyLocation;


  const StaticMapWidget({
    Key? key,
    required this.location,
    this.enableMyLocation = false,
    required this.title,
    this.isNormalIcon = false,
    this.zoom = 15.0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StaticMapWidgetState();
}

class _StaticMapWidgetState extends State<StaticMapWidget> {
  late BitmapDescriptor icon;
  Set<Marker> _markers = {};
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    _loadIcon();
  }

  @override
  void didUpdateWidget(covariant StaticMapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if updatedLocation is provided and different from the currentLocation
      moveToLocation();
  }

  Future<void> _loadIcon() async {
    try {
      icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(100, 100)),
        'images/location.png',
      );
    } catch (e) {
      debugPrint('Error loading icon: $e');
      icon = BitmapDescriptor.defaultMarker;
    }

    setState(() {
      _markers.add(buildMarker(widget.location!, icon: widget.isNormalIcon ? null : icon));
    });
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Set<Circle> circles = {
      Circle(
        circleId: const CircleId('120'),
        center: widget.location,
        fillColor: kPrimary.withOpacity(0.15),
        radius: 100,
        strokeColor: kPrimary,
        strokeWidth: 2,
      ),
    };
    return GoogleMap(
      compassEnabled: false,
      mapToolbarEnabled: true,
      myLocationEnabled: widget.enableMyLocation,
      myLocationButtonEnabled: widget.enableMyLocation,
      zoomGesturesEnabled: false,
      zoomControlsEnabled: false,
      scrollGesturesEnabled: false,
      markers: _markers,
      onMapCreated: (controller) {
        mapController = controller;
       moveToLocation();
      },
      circles: circles,
      initialCameraPosition: CameraPosition(
        target: widget.location,
        zoom: widget.zoom,
      ),
    );
  }

  Marker buildMarker(LatLng location, {BitmapDescriptor? icon}) {
    return Marker(
      markerId: const MarkerId('120'),
      position: location,
      icon: icon ?? BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: widget.title),
    );
  }

  void moveToLocation() {
    if (mapController != null) {
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: widget.location, zoom: widget.zoom),
        ),
      );
      setState(() {
        _markers.add(buildMarker(widget.location, icon: widget.isNormalIcon ? null : icon));
      });
    }
  }
}
