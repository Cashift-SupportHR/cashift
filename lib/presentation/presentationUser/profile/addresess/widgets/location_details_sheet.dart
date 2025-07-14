import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/material_text_field.dart';
import '../../../common/common_state.dart';
import '../../../map_picker/widgets/map_picker_item.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class LocationDetailsSheet extends BaseStatelessWidget {
  final StreamState<MapPickerItem?> placeDetailsStream;
  Function(MapPickerItem) addAddressDetails;
  final TextEditingController controller;

  LocationDetailsSheet(
      {Key? key,
      required this.addAddressDetails,
      required this.controller,
      required this.placeDetailsStream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MapPickerItem?>(
      stream: placeDetailsStream.stream,
      builder: (context, snapshot) {
        return PositionedDirectional(
          bottom: 0,
          end: 0,
          start: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: kPrimary.withOpacity(0.15),
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: kCoolTeal.withOpacity(0.30),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(Icons.location_on),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(strings.home_address, style: kTextMedium),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(strings.your_current_location,
                            style: kTextRegular.copyWith(fontSize: 12)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(snapshot.data?.formattedAddress ?? '',
                    style: kTextRegular.copyWith(fontSize: 12)),
                const SizedBox(
                  height: 10,
                ),
                Text(strings.address, style: kTextMedium),
                const SizedBox(
                  height: 5,
                ),
                MaterialTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<MapPickerItem?>(
                  stream: placeDetailsStream.stream,
                  builder: (context, snapshot) {
                    return AppCupertinoButton(
                      text: strings.save_button,
                      onPressed: snapshot.data == null
                          ? null
                          : () {
                              addAddressDetails(snapshot.data!);
                            },
                    );
                  },
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
