import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';

import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../locationservice/locationservice.dart';
import '../bloc/map_picker_state.dart';
import '../widgets/map_picker_item.dart';
import '../widgets/map_prediction.dart';
import '../widgets/map_widget_picker.dart';

class MapPickerScreen extends BaseStatelessWidget {
  final LatLng? initialLatLng;
  final MapPickerState state;

  MapPickerScreen({Key? key, required this.state, this.initialLatLng})
    : super(key: key);

  GoogleMapController? mapController;

  MapPickerItem locationData = MapPickerItem();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        MapWidgetPicker(
          predictionsSearchStream: state.predictionsSearchStream,
          placeDetailsStream: state.placeDetailsStream,
          initialLatLng: initialLatLng,
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

        StreamBuilder<MapPickerItem?>(
          stream: state.placeDetailsStream.stream,
          builder: (context, snapshot) {
            locationData = snapshot.data ?? MapPickerItem();
            return snapshot.data == null
                ? SizedBox.shrink()
                : Container(
                  height:
                      (snapshot.data!.formattedAddress!.isEmpty) ? 100 : 200,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(
                    vertical:
                        (snapshot.data!.formattedAddress!.isEmpty) ? 0 : 25,
                    horizontal: 16,
                  ),
                  decoration: Decorations.decorationTabsOnlyTop(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        snapshot.data?.formattedAddress ?? '',
                        style: kTextMedium.copyWith(
                          fontSize: 16,
                          color: kPrimary,
                        ),
                      ),
                      //  Spacer(),
                      AppCupertinoButton(
                        text: strings.save_button,
                        radius: BorderRadius.circular(4),
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical:
                              (snapshot.data!.formattedAddress!.isEmpty)
                                  ? 10
                                  : 16,
                        ),
                        onPressed: () {
                          print('onPressed ${locationData.toJson()}');
                          Navigator.pop(context, locationData);
                        },
                      ),
                    ],
                  ),
                );
          },
        ),
      ],
    );
  }

  onTapPicker(LatLng latLng) async {
    state.placeDetailsStream.setData(
      MapPickerItem(
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
      ),
    );
  }
}
