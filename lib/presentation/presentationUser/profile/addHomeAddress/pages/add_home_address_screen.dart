import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../common/domain/entities/resume/index.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/map/map_constants.dart';
import '../../../common/common_state.dart';
import '../../../common/stream_data_state.dart';
import '../../../locationservice/locationservice.dart';
import '../../../map_picker/widgets/map_picker_item.dart';
import '../../../map_picker/widgets/map_prediction.dart';
import '../../../map_picker/widgets/map_search.dart';
import '../../addresess/widgets/detect_my_location_button.dart';
import '../../../resources/colors.dart';
import '../../../../../common/data/models/add-address/add_home_location_params.dart';
import '../bloc/add_home_address_state.dart';
import '../widgets/house_identification_sheet.dart';

class AddHomeAddressScreen extends BaseStatelessWidget {
  final AddHomeAddressState data;
  final StreamDataStateInitial<List<DistrictItem>> districtsStream;
  final Function(AddHomeLocationParams) onAddressAdded;
  final Function(int) onFetchDistricts;
  final StreamStateInitial<List<MapPrediction>?> predictionsSearchStream;
  final StreamStateInitial<MapPickerItem?> placeDetailsStream;
  final Function(String) onFetchSearchLocations;
  final Function(String) onFetchPlaceDetails;

  AddHomeAddressScreen({
    Key? key,
    required this.data,
    required this.districtsStream,
    required this.onAddressAdded,
    required this.onFetchDistricts,
    required this.predictionsSearchStream,
    required this.onFetchSearchLocations,
    required this.placeDetailsStream,
    required this.onFetchPlaceDetails
  }) : super(key: key);

  StreamStateInitial<bool> isSearchController = StreamStateInitial();
  AddHomeLocationParams params = AddHomeLocationParams( );

  @override
  Widget build(BuildContext context) {
    LatLng? myLocation = data.myLocation;

    return Stack(
      alignment: Alignment.center,
      children: [
        MapWidgetV2(
          myLocation: myLocation,
          predictionsSearchStream: predictionsSearchStream,
          onFetchAutoComplete: (value) {
            if (value.isNotEmpty) {
              isSearchController.setData(false);
            } else {
              isSearchController.setData(true);
            }
            onFetchSearchLocations(value);
          },
          placeDetailsStream: placeDetailsStream,
          onFetchPlaceDetails: onFetchPlaceDetails,
          onTapTextFieldSearch: (){
            isSearchController.setData(false);
          },
          onClearTextFieldSearch: (){
            isSearchController.setData(true);
          },
          onSetLocation: (latLng) {
            print('onSetLocation $latLng');
            isSearchController.setData(true);
            myLocation = latLng;
          },
        ),

        StreamBuilder<bool>(
          stream: isSearchController.stream,
          builder: (context, snapshot) {
            print('snapshot ${snapshot.data}');
            return snapshot.data == false
                ? SizedBox.shrink() :
              HouseIdentificationSheet(
                params: params,
              cities: data.cities,
              districtsStream: districtsStream,
              onFetchDistricts: onFetchDistricts,
              onAddressAdded: (paramsData) {
               onAddressAdded(AddHomeLocationParams(
                  cityId: paramsData.cityId,
                  districtid: paramsData.districtid,
                  lng: myLocation?.longitude ?? 0.0,
                  lat: myLocation?.latitude ?? 0.0,
                ));
              },
            );
          }
        ),
      ],
    );
  }

}


class MapWidgetV2 extends StatefulWidget {
  final LatLng? myLocation;
  final GestureTapCallback? onTapTextFieldSearch;
  final GestureTapCallback? onClearTextFieldSearch;
  final StreamStateInitial<List<MapPrediction>?> predictionsSearchStream;
  final StreamStateInitial<MapPickerItem?> placeDetailsStream;
  final Function(String) onFetchAutoComplete;
  final Function(String) onFetchPlaceDetails;
  final Function(LatLng) onSetLocation;

  MapWidgetV2({
    Key? key,
    this.myLocation,
    this.onTapTextFieldSearch,
    this.onClearTextFieldSearch,
    required this.predictionsSearchStream,
    required this.onFetchAutoComplete,
    required this.placeDetailsStream,
    required this.onFetchPlaceDetails,
    required this.onSetLocation,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MapWidgetV2State();
  }
}

class MapWidgetV2State extends State<MapWidgetV2> {
  Set<Marker> _markers = Set();
  GoogleMapController? mapController;

  var locationFeched = false;
  double initZoom = 14;
  String address = '';
  StreamState<LatLng> myLocationController = StreamStateInitial();

  TextEditingController addressDetailsController = TextEditingController();
  LatLng? myLocation;

  StreamState<bool> streamController = StreamStateInitial();
  MapType _currentMapType = MapType.satellite;

  @override
  Widget build(BuildContext context) {
    myLocation = widget.myLocation ?? const LatLng(24.78878, 46.6989);
    return Stack(
      children: [
        GoogleMap(
          compassEnabled: true,
          mapToolbarEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          mapType: _currentMapType,
          onMapCreated: (controller) async {
            mapController = controller;
            mapController!.setMapStyle(getMapStyle());
            _location(context);
          },
          onTap: (latLng) async {
            _markers.clear();
            _markers.add(buildMarker(latLng));
            widget.onSetLocation(latLng);
            setState(() {});
          },
          markers: Set<Marker>.of(_markers),
          initialCameraPosition: CameraPosition(
            target: _markers.isNotEmpty
                ? _markers.first.position
                : myLocation ?? const LatLng(24.78878, 46.6989),
            zoom: 5.0,
          ),

        ),
        _detectMyLocationButton(),
        searchWidget(),
        mapTypeActionButton(),
      ],
    );
  }
  DetectMyLocationButton _detectMyLocationButton() {
    return DetectMyLocationButton(
      top: 100,
      onPressed: () async {
        await _location(context);
      },
    );
  }

  PositionedDirectional mapTypeActionButton() {
    return PositionedDirectional(
      top: 200,
      start: 10,
      child: FloatingActionButton.small(
        onPressed: () {
          setState(() {
            _currentMapType =
            _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
          });
        },
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: kWhite,
        elevation: 2,
        child: const Icon(
          Icons.map,
          color: kPrimaryDark,
        ),
      ),
    );
  }
  buildMarker(LatLng location, {BitmapDescriptor? icon}) {
    print('location $location');
    return icon != null
        ? Marker(
            markerId: const MarkerId('120'),
            position: location,
            icon: icon,
            infoWindow: InfoWindow(title: location.toString()))
        : Marker(
            markerId: const MarkerId('120'),
            position: location,
            infoWindow: InfoWindow(title: location.toString()));
  }

  Future<void> _location(BuildContext context) async {
    try {
      final position = await LocationService.determinePosition(context);
      onZoom(MapPickerItem(
        geometry: MapPickerGeometry(
          location: MapPickerLocation(
            lat: position.latitude,
            lng: position.longitude,
          ),
        ),
      ));
    } catch (e) {
      return Future.error(e);
    }
  }


  MapSearch searchWidget() {
    return MapSearch(
      onSearch: (value) {
        widget.onFetchAutoComplete(value);
      },
      onTapTextFieldSearch: widget.onTapTextFieldSearch,
      onClearTextFieldSearch: widget.onClearTextFieldSearch,
      predictionsSearchStream: widget.predictionsSearchStream,
      onSelectPlace: (item) {
        print('onSelectPlace ${item.toJson()}');
        //onZoom(item);
        widget.onFetchPlaceDetails(item.placeId ?? '');
        placeDetailsStream();
      },
    );
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
    _markers.clear();
    _markers.add(buildMarker(latLng));
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 18,
        ),
      ),
    );
    setState(() {});
    widget.onSetLocation(latLng);
  }
}
