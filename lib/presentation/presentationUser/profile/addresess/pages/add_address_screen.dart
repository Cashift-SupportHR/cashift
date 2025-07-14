
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../common/data/models/add-address/address.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../common/common_state.dart';
import '../../../locationservice/locationservice.dart';
import '../../../map_picker/bloc/map_picker_state.dart' show MapPickerState;
import '../../../map_picker/widgets/map_picker_item.dart';
import '../../../map_picker/widgets/map_prediction.dart';
import '../../../map_picker/widgets/map_widget_picker.dart';
import '../widgets/location_details_sheet.dart';

class AddAddressScreen extends BaseStatelessWidget {
  final AddressDto? address;
  final MapPickerState state;
  final Function(AddressDto) onAddressAdded;
  AddAddressScreen({Key? key,  required this.onAddressAdded, this.address, required this.state}) : super(key: key);


  TextEditingController controller = TextEditingController();
  GoogleMapController? mapController;
  MapPickerItem locationData = MapPickerItem();
  StreamStateInitial<LatLng?> latLngSearchStream = StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    controller.text = address?.name ?? '';
    return Stack(
      alignment: Alignment.center,
      children: [
        MapWidgetPicker(
          predictionsSearchStream: state.predictionsSearchStream,
          placeDetailsStream: state.placeDetailsStream,
          initialLatLng: address?.getLatLng(),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          mapController: mapController,
          onTap: (LatLng latLng) {
            onTapPicker(latLng);
          },
          onCreatedLocation: (LatLng latLng) {
            onTapPicker(latLng);
          },
          onSearch: (String value) {
            state.onFetchPlaces(value);
          },
          onSelectPlace: (MapPrediction prediction) {
            state.onFetchPlaceDetails(prediction.placeId ?? '');
          },
        ),
        LocationDetailsSheet(
          controller: controller,
          placeDetailsStream: state.placeDetailsStream,
          addAddressDetails: (MapPickerItem item) {
            onAddressAdded(
                AddressDto(
                    id: address?.id,
                    name: controller.text.isEmpty
                        ? item.formattedAddress
                        : controller.text,
                    details: item.formattedAddress,
                    latitude: item.geometry?.location?.lat.toString(),
                    langitude: item.geometry?.location?.lng.toString(),
                )
            );
          },
        ),
      ],
    );
  }


  onTapPicker(LatLng latLng) async {
    MapPickerItem item =  MapPickerItem(
      formattedAddress: await LocationService.getAddressFromLatLng(
        latLng.latitude,
        latLng.longitude,
      ),
      geometry: MapPickerGeometry(
        location: MapPickerLocation(
          lat: latLng.latitude,
          lng: latLng.longitude,
        ),
      ),
    );
    state.placeDetailsStream.setData(item);
  }

  onZoom(MapPickerItem? item) {
    if (item == null) return;
    print('onZoom ${item.toJson()}');
    LatLng latLng = LatLng(
      double.parse(item.geometry?.location?.lat?.toString() ?? '0.0'),
      double.parse(item.geometry?.location?.lng?.toString() ?? '0.0'),
    );
    latLngSearchStream.setData(latLng);
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 18)),
    );
  }
}



