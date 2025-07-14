import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/icons/icon_text.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/map/map_widget.dart';

///  Created by harbey on 5/15/2023.
class CurrentLocation extends BaseStatelessWidget {
  final String? text;
  final Widget? title;
  final TextStyle? textStyle;
  final double heightLocation;
  final LocationData? initialLocation;
  final Function(LocationData) onGetLocation;

  CurrentLocation({Key? key, this.text, this.title, this.textStyle, this.heightLocation = 150, required this.onGetLocation, this.initialLocation})
      : super(key: key);

  StreamStateInitial<LocationData?> locationStream =
      StreamStateInitial<LocationData?>();

  @override
  Widget build(BuildContext context) {
    if (initialLocation == null) {
      fetchCurrentLocation();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title == null)
        IconText(
          text: text ?? strings.work_point_location,
          textStyle: textStyle ?? kTextMedium.copyWith(fontSize: 14, color: kPrimary),
          icon: AppIcons.location,
        )
        else title!,
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: heightLocation,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: StreamBuilder<LocationData?>(
                  stream: locationStream.stream,
                  initialData: initialLocation,
                  builder: (context, snapshot) {
                    print('snapshot.data LocationData ${snapshot.data}');
                    return (snapshot.data == null && initialLocation == null)
                        ? Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator())
                        : StaticMapWidget(
                            location: LatLng(snapshot.data?.latitude ?? 0.0,
                                snapshot.data?.longitude ?? 0.0),
                            title: '',
                          );
                  })),
        ),
        const SizedBox(
          height: 10,
        ),
        if (initialLocation != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                strings.navigate_to_current_location_des,
                style: kTextRegular.copyWith(fontSize: 12, color: kPrimary),
              ),
              AppCupertinoButton(
                onPressed: () {
                  fetchCurrentLocation();
                },
                text: strings.edit,
                textStyle: kTextRegular.copyWith(fontSize: 10, color: kWhite),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                radius: BorderRadius.circular(4),
              ),
            ],
          ),
      ],
    );
  }

  Future<void> fetchCurrentLocation() async {
    Location location = Location();
    try {
      LocationData currentLocation = await location.getLocation();
      locationStream.setData(currentLocation);
      onGetLocation(currentLocation);
    } catch (e) {
      print('Error: $e');
    }
  }
}
