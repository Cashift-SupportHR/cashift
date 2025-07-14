import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/locationservice/locationservice.dart';
import '../../../../../presentationUser/map_picker/widgets/map_picker_item.dart';
import '../../../../../presentationUser/map_picker/widgets/map_prediction.dart';
import '../../../../../presentationUser/map_picker/widgets/map_search.dart';
import '../../../../../presentationUser/profile/addresess/widgets/detect_my_location_button.dart';
import '../../../data/models/DrawPolygonWithMarkersArgs.dart';

class DrawPolygonWithMarkersScreen extends StatefulWidget {
  final StreamStateInitial<LatLng?> myLocationStream;
  final StreamStateInitial<List<MapPrediction>?> predictionsSearchStream;
  final StreamStateInitial<MapPickerItem?> placeDetailsStream;
  final Function(String) onFetchAutoComplete;
  final Function(String) onFetchPlaceDetails;

  DrawPolygonWithMarkersScreen({
    Key? key,
    required this.myLocationStream,
    required this.predictionsSearchStream,
    required this.onFetchAutoComplete,
    required this.placeDetailsStream,
    required this.onFetchPlaceDetails,
  }) : super(key: key);

  @override
  _DrawPolygonWithMarkersScreenState createState() =>
      _DrawPolygonWithMarkersScreenState();
}

class _DrawPolygonWithMarkersScreenState
    extends State<DrawPolygonWithMarkersScreen> {
  late GoogleMapController mapController;
  List<LatLng> polygonPoints = [];
  Set<Polygon> polygons = Set<Polygon>();
  Set<Marker> markers = Set<Marker>();
  bool readOnly = false;
  bool isFirstTap = true;
  TextEditingController searchController = TextEditingController();

  DrawPolygonWithMarkersArgs? args;
  StreamStateInitial<bool> isSaveData = StreamStateInitial<bool>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    initialData();
  }

  void _onTap(LatLng latLng) {
    if(isFirstTap) {
      isFirstTap = false;
      _clearPolygon();
    }
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    final strings = Get.context!.getStrings();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (args?.latlngs == null || readOnly)
              ? strings.mark_box_map
              : strings.edit_select_map,
          style: kTextBold,
        ),
        actions:
            readOnly
                ? null
                : [
                  TextButton(
                    onPressed: _clearPolygon,
                    child: Text(strings.clear),
                  ),
                ],
      ),
      bottomSheet:
          (args != null && args!.isOnlyView == true)
              ? null
              : saveButton(context),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.7749, -122.4194), // Set the initial location
              zoom: 16, // Set the initial zoom level
            ),
            polygons: polygons,
            markers: markers,
            // Display markers on the map
            onTap: readOnly ? null : _onTap, // Register tap events
          ),
          if (args?.isOnlyView != true) searchWidget(),
          _detectMyLocationButton(),
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

  StreamBuilder<bool> saveButton(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSaveData.stream,
      builder: (context, snapshot) {
        return AppCupertinoButton(
          text: context.getStrings().save_selection,
          margin: EdgeInsets.all(16),
          onPressed:
              snapshot.data == true
                  ? () {
                    // Save the polygon points
                    print(polygonPoints);
                    Navigator.pop(context, polygonPoints);
                  }
                  : null,
        );
      },
    );
  }

  searchWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MapSearch(
        onSearch: (value) {
          widget.onFetchAutoComplete(value);
        },
        searchController: searchController,
        predictionsSearchStream: widget.predictionsSearchStream,
        onSelectPlace: (item) {
          widget.onFetchPlaceDetails(item.placeId ?? '');
          placeDetailsStream();
        },
      ),
    );
  }

  _detectMyLocationButton() {
    return DetectMyLocationButton(
      bottom: 100,
      onPressed: () async {
        await _location(context);
      },
    );
  }

  Future<LocationData> _location(BuildContext context) async {
    try {
      LocationPermission status =
          await GeolocatorPlatform.instance.requestPermission();
      if (status == LocationPermission.denied) {
        return Future.error('Permission denied');
      }
      final position = await LocationService.determinePosition(context);
      LatLng latLng = LatLng(position.latitude!, position.longitude!);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 16),
        ),
      );
      return position;
    } catch (e) {
      return Future.error(e);
    }
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
    if (args != null) {
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          _calculatePolygonBounds(args?.latlngs ?? []),
          50,
        ), // 50 is padding
      );
    } else {
      streamLocation();
    }
  }

  placeDetailsStream() {
    // polygonPoints.clear();
    //markers.clear();
    widget.placeDetailsStream.stream.listen((event) {
      print('onStreamBuilder ${event?.toJson()}');
      if (event != null) {
        onZoom(event);
      }
    });
  }

  onZoom(MapPickerItem? item) {
    if (item == null) return;
    print('onZoom ${item.toJson()}');
    LatLng latLng = LatLng(
      double.parse(item.geometry?.location?.lat?.toString() ?? '0.0'),
      double.parse(item.geometry?.location?.lng?.toString() ?? '0.0'),
    );
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 18)),
    );
    _onTap(latLng);
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

  void streamLocation() {
    widget.myLocationStream.stream.listen((event) {
      if (event != null) {
        mapController.animateCamera(CameraUpdate.newLatLng(event));
      }
    });
  }

  void _initData() {
    args =
        MyModalRoute.of(context)?.settings.arguments
            as DrawPolygonWithMarkersArgs?;
    if (args != null) {
      readOnly = args!.isOnlyView ?? false;
      polygons = mapPolygons(args?.latlngs ?? []);
      markers = mapPointsMarkers(args?.latlngs ?? []);
    }
  }
}
