import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/decorations/decorations.dart';
import '../../locationservice/locationservice.dart';
import '../../resources/constants.dart';
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
  LatLng? currentLocation;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
      future: _getCurrentLocation(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final userLatLng = snapshot.data!;
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            MapWidgetPicker(
              predictionsSearchStream: state.predictionsSearchStream,
              placeDetailsStream: state.placeDetailsStream,
              initialLatLng: userLatLng, // نبدأ بالموقع الحالي
              // نعرض الماركر
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              mapController: mapController,
              onTap: (LatLng latLng) {
                onTapPicker(latLng);
              },
              onCreatedLocation: (LatLng latLng) {
                onTapPicker(userLatLng);
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
                    ? const SizedBox.shrink()
                    : Container(
                  height:
                  (snapshot.data!.formattedAddress!.isEmpty) ? 100 : 200,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(
                    vertical: (snapshot.data!.formattedAddress!.isEmpty)
                        ? 0
                        : 25,
                    horizontal: 16,
                  ),
                  decoration: Decorations.shapeDecorationShadow(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          snapshot.data?.formattedAddress ?? '',
                          style: kTextRegular.copyWith(fontSize: 14),
                        ),
                        AppCupertinoButton(
                          text: strings.save_button,
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: (snapshot.data!.formattedAddress!.isEmpty)
                                ? 10
                                : 16,
                          ),
                          onPressed: () {
                            Navigator.pop(context, locationData);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  /// 🔹 إحضار الموقع الحالي وعرض الماركر عليه
  Future<LatLng> _getCurrentLocation(context) async {
    final position = await LocationService.determinePosition(context);
    final latLng = LatLng(position.latitude??0, position?.longitude??0);

    // أضف الماركر في موقعي الحالي
    markers = {
      Marker(
        markerId: const MarkerId("current_location"),
        position: latLng,
        infoWindow: const InfoWindow(title: "موقعي الحالي"),
      ),
    };

    // جهز بيانات الموقع لتظهر في الأسفل
    final address = await LocationService.getAddressFromLatLng(
      latLng.latitude,
      latLng.longitude,
    );

    state.placeDetailsStream.setData(
      MapPickerItem(
        formattedAddress: address,
        geometry: MapPickerGeometry(
          location: MapPickerLocation(
            lat: latLng.latitude,
            lng: latLng.longitude,
          ),
        ),
      ),
    );

    return latLng;
  }

  /// 🔹 عند الضغط على الخريطة نغيّر الماركر والموقع
  onTapPicker(LatLng latLng) async {
    final address = await LocationService.getAddressFromLatLng(
      latLng.latitude,
      latLng.longitude,
    );

    markers = {
      Marker(
        markerId: const MarkerId("selected_location"),
        position: latLng,
        infoWindow: const InfoWindow(title: "الموقع المحدد"),
      ),
    };

    mapController?.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );

    state.placeDetailsStream.setData(
      MapPickerItem(
        formattedAddress: address,
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
