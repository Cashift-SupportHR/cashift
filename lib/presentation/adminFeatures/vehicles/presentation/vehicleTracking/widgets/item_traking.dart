import 'package:shiftapp/presentation/adminFeatures/vehicles/presentation/vehicleTracking/widgets/violation_widget.dart';

import '../../../../../../utils/app_icons.dart';
import '../../../../../../common/components/index.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../domain/entities/vehicleTraking.dart';
import 'driver_widget.dart';

class ItemTracking extends BaseStatelessWidget {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  bool isShow = false;

  VehicleTrackingEntity? vehicleTrackingDetailsEntity;

  ItemTracking({
    required this.vehicleTrackingDetailsEntity,

  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration:
        Decorations.decorationOnlyRadius(color: kWhite, radius: 5),
        child: Column(
          children: [
            ListRowTextsIconsV2(
                iconColor: kPrimary,
                items: [
              ListRowTextItem(
                  title: strings.violations_num,
                  value:"${ vehicleTrackingDetailsEntity?.vehicleEventsCount??"0"}",
                  icon: AppIcons.violation_name),
                  ListRowTextItem(
                  title: strings.maximum_speed,
                  value:"${ vehicleTrackingDetailsEntity?.vehicleGPSDetails?.maxSpeed??"0"} كم/س ",
                  icon: AppIcons.speed),
            ]),
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(

                      height: 35,
                      child: AppOutlineButton(
                        onClick: () {
                          return showAppModalBottomSheet(
                              topMargin: 100,
                              title: strings.violations,
                              isScrollControlled: true,
                              context: context,
                              child: ItemViolationTracking(
                                  vehicleEvents:
                                  vehicleTrackingDetailsEntity?.vehicleEvents ??
                                      []));
                        },
                        text: strings.violations,
                        backgroundColor: Colors.white,
                        strokeColor: kOrange00,
                        textStyle: kTextBold.copyWith(
                          fontSize: 12,
                          color: kOrange00,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(

                      height: 35,
                      child: AppOutlineButton(
                        onClick: () {
                          return showAppModalBottomSheet(
                              topMargin: 100,
                              title: strings.drivers,
                              isScrollControlled: true,
                              context: context,
                              child: ItemDriverTracking(
                                  drivers:
                                  vehicleTrackingDetailsEntity?.drivers ?? []));
                        },
                        text: strings.drivers,
                        backgroundColor: Colors.white,
                        strokeColor: kPrimary,
                        textStyle: kTextBold.copyWith(
                          fontSize: 12,
                          color: kPrimary,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      );
    });
  }
}
