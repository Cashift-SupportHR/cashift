import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shiftapp/common/components/outlint_button.dart';

import '../../../../core/services/routes.dart';
import '../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../common/domain/entities/workerWorkPlaces/index.dart';
import '../../../../utils/app_icons.dart';
import '../../../adminFeatures/focusPoints/presentations/trackingFocusPoints/widgets/point_image.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../../../common/components/texts/icon_double_text.dart';
import '../../deliveryAndReceipt/pages/delivery_and_receipt_page.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import 'attendance_fingerprint_dialog.dart';
import 'my_focus_point_status.dart';
import 'point_name_and_status.dart';

///  Created by harbey on 5/7/2023.
class MyFocusPointItem extends BaseStatelessWidget {
  final WorkerWorkPlace gate;
  final Function(bool) onActionPerform;

  MyFocusPointItem({Key? key, required this.gate, required this.onActionPerform})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color pointColor = kColorFromHex(gate.statusColor ?? '000000');
    return InkWell(
      onTap: () {
       Navigator.pushNamed(context, Routes.deliveryAndReceiptPage,
            arguments: gate.id);
      },
      child: Container(
        decoration: Decorations.decorationWithGradientNotSpreadRadius(shadowColor: pointColor),
        margin: const EdgeInsetsDirectional.only(start: 4, end: 10, top: 8, bottom: 8),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 10, start: 10, end: 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PointImage(
                        image: gate.images ?? '',
                        margin: EdgeInsets.zero,
                        color: pointColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FocusPointNameAndStatus(
                        name: (gate.isBreak ?? false) ? strings.rest_time : gate.focusPointName ?? '',
                        status: gate.statusName ?? '',
                        styleName: kTextSemiBold.copyWith(fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _BodyMyGate(gate: gate),
                ],
              ),
            ),
            const Spacer(),
            _MyGateFooter(
              gate: gate,
              onPressed: (value) {
                onActionPerform(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BodyMyGate extends BaseStatelessWidget {
  final WorkerWorkPlace gate;

  _BodyMyGate({Key? key, required this.gate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconDoubleText(
          icon: AppIcons.typeGate,
          name: strings.gate_type,
          value: gate.focusPointTypeName ?? '',
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 3),
          child: IconDoubleText(
            icon: AppIcons.phoneOld,
            name: '\t\t\t${strings.connect_code}',
            value: gate.deviceName ?? '',
          ),
        ),

        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: IconDoubleText(
                isSizedBox: false,
                icon: AppIcons.startTime,
                name: strings.time_start,
                value: DateFormatter.repairApiTimeUI(
                    gate.startShift ?? ''),
              ),
            ),
            Expanded(
              child: IconDoubleText(
                isSizedBox: false,
                icon: AppIcons.endTime,
                name: strings.time_end,
                value: DateFormatter.repairApiTimeUI(
                    gate.endShift ?? ''),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MyGateFooter extends BaseStatelessWidget {
  final WorkerWorkPlace gate;
  final Function(bool) onPressed;

  _MyGateFooter({
    Key? key,
    required this.gate,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isActive = (gate.status == MyFocusPointStatus.active);
    bool isWithdrawn = (gate.status == MyFocusPointStatus.withdrawn);
    bool isCheckedIn = (gate.status == MyFocusPointStatus.checkedIn);
    bool isWaitingCheckedIn = (gate.status == MyFocusPointStatus.waitingCheckedIn);
    bool isRecordDeparture = (isDateExpired() && gate.status == MyFocusPointStatus.active);
    bool isSubmit = (gate.isBreak == false) && (isWaitingCheckedIn || isRecordDeparture);
    print('gate.isBreak ${gate.isBreak}');
    print('isWaitingCheckedIn ${isWaitingCheckedIn}');
    print('isRecordDeparture ${isRecordDeparture}');
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: kGrey_D0,
                height: 0,
              ),
              const SizedBox(
                height: 14,
              ),
              CountdownTimer(
                endTime: DateFormatter.convertDateToMilliSeconds(gate.endShiftDateTime ?? ''),
                widgetBuilder: (_, CurrentRemainingTime? time) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(time != null && isActive)
                      RichText(
                        text: TextSpan(
                          text: strings.remaining_time_to_rest,
                          style: kTextMedium.copyWith(
                              color: kBlack_3C, fontSize: 10),
                          children: [
                            TextSpan(
                              text: '\t\t${time.hours ?? '0.0'}:${time.min ?? '0.0'}:${time.sec}\t\t',
                              style: kTextMedium.copyWith(color: kYellow_00, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: LinearProgressIndicator(
                          value: isActive ? getPercentageTimer() : (isCheckedIn ? 1.0 : 0.0) ,
                          color: kYellow_00,
                          backgroundColor: kGrey_D9,
                          minHeight: 7,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              isCheckedIn ? Text(
                strings.successfully_done,
                style: kTextBold.copyWith(
                  color: kPrimary,
                  fontSize: 18,
                ),
              ) :
              AppOutlineButton(
                text: (isActive || isWithdrawn) ? strings.record_departure : strings.record_attendance,
                textStyle: kTextSemiBold.copyWith(color: isSubmit ? kPrimary : kGrey_94, fontSize: 24),
                padding: const EdgeInsets.symmetric(vertical: 10),
                strokeColor: isSubmit ? null : Colors.transparent,
                width: double.infinity,
                backgroundColor: isSubmit ? null : kGrey_EB,
                onClick: isSubmit ? (){
                 return showDialog(
                   context: context,
                   builder: (context) => AttendanceFingerprintDialog(
                     id: gate.id ?? 0,
                     onPressed: (){
                      onPressed((isActive || isWithdrawn) ? true : false);
                     },
                 ));
                } : null,
              ),
            ],
          ),
    );
  }

  double differenceNowBySecond() {
    try {
      double seconds = DateFormatter.differenceNowBySecond(DateTime.parse(gate.startShiftDateTime ?? '')).toDouble().abs();
      if(seconds < 0) {
        return 1.0;
      }
      return seconds;
    } on Exception catch (e) {
      print('convertDate $e');
      return 1.0;
    }
  }

  double differenceTwoDatesBySeconds() {
    print('gate name ${gate.focusPointName}');
    print('getPercentageTimer ${ gate.startShiftDateTime} ${ gate.endShiftDateTime}' );
    try {
         return DateFormatter.differenceTwoDatesBySeconds( DateTime.parse(gate.startShiftDateTime ?? ''),
         DateTime.parse(gate.endShiftDateTime ?? '')).toDouble();
    } on Exception catch (e) {
      print('getPercentageTimer $e');
      return 1.0;
    }
 }
  double getPercentageTimer() {
    try {
      double secondsFromNow = differenceNowBySecond();
      double totalSeconds = differenceTwoDatesBySeconds();
      print('secondsFromNow $secondsFromNow');
      print('totalSeconds $totalSeconds');
      print('getPercentageTimer ${(secondsFromNow / totalSeconds)}');
      return ((secondsFromNow / totalSeconds)).abs();
    } on Exception catch (e) {
      print('getPercentageTimer $e');
      return 1.0;
    }
  }

 bool isDateExpired() {
    try {
      final isNegative = DateFormatter.differenceStartDateNowBySecond(DateTime.parse(gate.endShiftDateTime ?? '')).isNegative;
      print('isDateExpired $isNegative');
      return isNegative;
    } on Exception catch (e) {
      print('isDateExpired $e');
      return false;
    }
  }
}
