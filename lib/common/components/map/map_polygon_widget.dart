import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../presentation/presentationUser/common/common_state.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

class MapPolygonWidget extends StatefulWidget {
  final String? title;
  final List<LatLng> latlngs;

  MapPolygonWidget(
      {Key? key,
      this.title,
      required this.latlngs})
      : super(key: key);
  @override
  _MapPolygonWidgetState createState() =>
      _MapPolygonWidgetState();
}

class _MapPolygonWidgetState
    extends State<MapPolygonWidget> {
  late GoogleMapController mapController;
  List<LatLng> polygonPoints = [];
  Set<Polygon> polygons = Set<Polygon>();
  Set<Marker> markers = Set<Marker>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    initialData();
  }

  void _onTap(LatLng latLng) {
    setState(() {
      polygonPoints.add(latLng);

      // Add a new polygon with the updated points
      polygons.add(
        Polygon(
          polygonId: PolygonId('polygon_1'),
          points: polygonPoints,
          strokeWidth: 2,
          strokeColor: Colors.blue,
          fillColor: Colors.blue.withOpacity(0.2),
        ),
      );

      // Add a marker for the tapped point
      markers.add(
        Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
          infoWindow: InfoWindow(
            title: 'Point ${polygonPoints.length}',
            snippet: latLng.toString(),
          ),
        ),
      );
    });
    if (polygonPoints.length > 2) {
      isSaveData.setData(true);
    }
  }

  void _clearPolygon() {
    setState(() {
      polygonPoints.clear();
      polygons.clear();
      markers.clear(); // Clear the markers as well
    });
  }

  StreamStateInitial<bool> isSaveData = StreamStateInitial<bool>();

  @override
  Widget build(BuildContext context) {
    final initPolygons = mapPolygons(widget.latlngs);
    final initMarkers = mapPointsMarkers(widget.latlngs);
    return  SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null && widget.title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.title ?? '',
              style:
              kTextSemiBold.copyWith(color: kGray_88, fontSize: 18),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194), // Set the initial location
                zoom: 16, // Set the initial zoom level
              ),
              polygons: initPolygons,
              markers: initMarkers, // Display markers on the map
              onTap: _onTap, // Register tap events
            ),
          ),
        ],
      ),
    );
  }

  LatLngBounds _calculatePolygonBounds(List<LatLng> polygonCoordinates) {
    double north = polygonCoordinates.first.latitude;
    double south = polygonCoordinates.first.latitude;
    double east = polygonCoordinates.first.longitude;
    double west = polygonCoordinates.first.longitude;

    for (var coord in polygonCoordinates) {
      if (coord.latitude > north) north = coord.latitude;
      if (coord.latitude < south) south = coord.latitude;
      if (coord.longitude > east) east = coord.longitude;
      if (coord.longitude < west) west = coord.longitude;
    }
    if (polygonCoordinates.isNotEmpty) {
      print('polygonCoordinates.isNotEmpty');
      isSaveData.setData(true);
    }
    return LatLngBounds(
      northeast: LatLng(north, east),
      southwest: LatLng(south, west),
    );
  }

  Set<Marker> mapPointsMarkers(List<LatLng> latlng) {
    if (latlng.isEmpty) {
      return Set();
    }
    return latlng.asMap().entries.map((entry) {
      int index = entry.key;
      LatLng position = entry.value;
      return Marker(
        markerId: MarkerId('marker_$index'),
        position: position,
        infoWindow: InfoWindow(
          title: 'Marker $index',
          snippet: 'Position: ${position.latitude}, ${position.longitude}',
        ),
      );
    }).toSet();
  }

  void initialData() {
    if (widget.latlngs.isNotEmpty) {
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
            _calculatePolygonBounds(widget.latlngs), 50), // 50 is padding
      );
    }
  }

  Set<Polygon> mapPolygons(List<LatLng> polygonPoints) {
    if (polygonPoints.isEmpty) {
      return Set();
    }
    return Set<Polygon>.of([
      Polygon(
        polygonId: PolygonId('polygon_1'),
        points: polygonPoints,
        strokeWidth: 2,
        strokeColor: kPrimary,
        fillColor: kPrimary.withOpacity(0.2),
      ),
    ]);
  }
}
