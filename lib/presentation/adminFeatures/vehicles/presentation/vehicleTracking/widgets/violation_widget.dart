import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/presentation/vehicleTracking/widgets/show_image_violation_build.dart';
import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';

import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/index.dart';
import '../../../../../shared/components/text_field/date_time_text_field_picker.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../data/models/vehicle_traking_details_prams.dart';
import '../../../domain/entities/vehicleTraking.dart';
import 'animationCarRouteWidget.dart';

class ItemViolationTracking extends BaseStatelessWidget {
  List<VehicleEventEntity> vehicleEvents;
  ItemViolationTracking({required this.vehicleEvents});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          itemBuilder: (context, index) => Container(
                decoration: Decorations.decorationTabs,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ListRowTextsIconsV2(iconColor: kPrimary, items: [
                      ListRowTextItem(
                          title: strings.violation_type,
                          value: vehicleEvents[index].eventType ?? "",
                          icon: AppIcons.violation_type),
                      ListRowTextItem(
                          title: strings.company_name,
                          value: vehicleEvents[index].companyName ?? "",
                          icon: AppIcons.projectName),
                      ListRowTextItem(
                          title: strings.street_name,
                          value: vehicleEvents[index].address ?? "",
                          icon: AppIcons.location),
                      ListRowTextItem(
                          title: strings.date,
                          value: vehicleEvents[index].time ?? "",
                          icon: AppIcons.calendar),

                      ListRowTextItem(
                          title: strings.speed,
                          value: vehicleEvents[index].speed.toString() ,
                          icon: AppIcons.speed),
                    ]),
                    if (vehicleEvents[index].isAllowPicture == true) ...[
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 35,
                        width: 100,
                        child: AppOutlineButton(
                          onClick: () {

                            showAppModalBottomSheet(

                                title: vehicleEvents[index].eventType ?? "",
                                isScrollControlled: true,
                                context: context, child: VehicleEventPicturePage(
                                data: vehicleEvents[index]));

                          },
                          text: strings.attachments,
                          backgroundColor: Colors.white,
                          strokeColor: kOrange00,
                          textStyle: kTextBold.copyWith(
                            fontSize: 12,
                            color: kOrange00,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: vehicleEvents.length),
    );
  }
}
