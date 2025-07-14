import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/trackingFocusPoints/widgets/tracking_employees_list_empty.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../presentationUser/workerWorkPlaces/widgets/focus_point_freelance_name_and_type.dart';
import '../../../../../presentationUser/workerWorkPlaces/widgets/point_name_and_status.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/icons/icon_text.dart';
import '../../../data/models/focus_points_types_dto.dart';

class TrackingPointWidget extends BaseStatelessWidget {
  final FreelanceApply freelanceApply;

  TrackingPointWidget({Key? key, required this.freelanceApply})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = kColorFromHex(freelanceApply.statusColor ?? '000000');
    return Container(
      decoration: Decorations.decorationWithGradientNotSpreadRadius(
          shadowColor: primaryColor),
      padding: const EdgeInsetsDirectional.only(top: 3, start: 15, end: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 40),
              child: FocusPointNameAndStatus(
                name: freelanceApply.pointName ?? '',
                status: freelanceApply.statusName ?? '',
                styleName: kTextBold.copyWith(fontSize: 12),
                styleStatus:
                    kTextMedium.copyWith(fontSize: 10, color: primaryColor),
              ),
            ),
          ),
          if (freelanceApply.freelanceName == null ||
              freelanceApply.freelanceName!.isEmpty)
            TrackingEmployeesListEmpty(),
          if (freelanceApply.freelanceName != null &&
              freelanceApply.freelanceName!.isNotEmpty) ...[
            FittedBox(
              child: FocusPointFreelanceNameAndType(
                freelanceName: freelanceApply.freelanceName ?? '',
                type: freelanceApply.freelanceType ?? '',
                styleName: kTextSemiBold.copyWith(fontSize: 16),
                styleType: kTextMedium.copyWith(fontSize: 12),
              ),
            ),
            IconText(
              icon: AppIcons.hours,
              iconSize: 15,
              text: '${strings.from}${DateFormatter.repairApiTimeStamp(
                freelanceApply.startDateTime ?? '',
              )}\t\t${strings.to} ${DateFormatter.repairApiTimeStamp(freelanceApply.endDateTime ?? '')}',
              textStyle: kTextMedium.copyWith(
                  fontSize: 12, color: kBlack.withOpacity(0.7)),
            ),
            FittedBox(
                child: GateFooter(
              freelanceApply: freelanceApply,
            )),
          ]
        ],
      ),
    );
  }
}

//  footer
class GateFooter extends BaseStatelessWidget {
  final FreelanceApply freelanceApply;

  GateFooter({
    Key? key,
    required this.freelanceApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 200,
      child: Row(
        children: [
          if(freelanceApply.deviceNumber != null && freelanceApply.deviceNumber!.isNotEmpty)
         ...[ kLoadSvgInCirclePath(AppIcons.phoneOld, height: 30, width: 30),
          const SizedBox(width: 8),
          Text(freelanceApply.deviceNumber ?? '',
              style: kTextSemiBold.copyWith(
                  fontSize: 25, color: kBlack.withOpacity(0.7))),],
          const Spacer(),

          if((freelanceApply.isBreak  == false))
          ...[
            kLoadSvgInCirclePath(AppIcons.afterTime, height: 30, width: 30),
            const SizedBox(width: 2),
            Text(strings.finish_tracking,
                style: kTextMedium.copyWith(fontSize: 16, color: kPrimary)),
            CountdownTimer(
              endTime: DateTime.parse(freelanceApply.endDateTime ?? '')
                  .millisecondsSinceEpoch,
              widgetBuilder: (_, CurrentRemainingTime? time) {
                if (time == null || freelanceApply.isStart == false) {
                  return Text(
                      DateFormatter.repairApiDateTime(
                          freelanceApply.endDateTime ?? '',
                          pattern: DateFormatter.HOUR_MINUT_12) + '\t\t',
                      style: kTextMedium.copyWith(
                          fontSize: 16, color: kBlack.withOpacity(0.7)));
                }
                return Text(
                    '\t\t${time.hours ?? '0.0'}:${time.min ?? '0.0'}:${time.sec}\t\t',
                    style: kTextMedium.copyWith(
                        fontSize: 16, color: kBlack.withOpacity(0.7)));
              },
            ),
          ]
        ],
      ),
    );
  }
}
