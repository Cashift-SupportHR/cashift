import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/widgets/shift_base_widget.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/material_text.dart';

import '../../../../../core/services/routes.dart';

class CurrentShiftWidget extends BaseStatelessWidget {
  final AppliedOffer currentShift;
  final Function onRefresh;
  final bool isStarted;
  CurrentShiftWidget(this.currentShift, {required this.onRefresh ,  this.isStarted =true});

  @override
  Widget build(BuildContext context) {
    return currentShift.isExpireTime()
        ? FinishedShiftWidget(
            currentShift,
            onClickCheckout: () {
              toCurrentShift(context);
            },
          )
        : ShiftTimerWidget(currentShift, onClickCheckout: () {
          toCurrentShift(context);
          });
  }

  toCurrentShift(BuildContext context){
    final result =  Navigator.pushNamed(
        context, Routes.currentShift);
  }
}

class ShiftTimerWidget extends BaseStatelessWidget {
  final AppliedOffer currentShift;
  final Function onClickCheckout;
  ShiftTimerWidget(this.currentShift, {required this.onClickCheckout});
  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: currentShift.finishedDateTime()!.millisecondsSinceEpoch,
      widgetBuilder: (c, time) {
        final hour = time != null && time.hours != null ? time.hours! : 0;
        if (time != null) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: getCurrentShiftBackgroundColor(hour)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    MaterialText(
                      strings.remaining_time,
                      style: kTextLabelFontDark.copyWith(
                          fontSize: 12, color: getHourColor(hour)),
                      startIcon: SvgPicture.asset(
                        'images/clock.svg',
                        color: kPrimary,
                        height: 15,
                      ),
                      startIconPadding:
                          const EdgeInsetsDirectional.only(end: 8),
                      padding: const EdgeInsetsDirectional.only(end: 8),
                    ),
                    Text(
                      ' ${time.hours ?? 0} ${strings.hour}: ${time.min ?? 0} ${strings.minute} : ${time.sec.toString()} ${strings.second}',
                      style: kTextBold.copyWith(
                          fontSize: 12, color: getHourColor(hour)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    '${currentShift.jobName} , ${currentShift.projectName}',
                    style: kTextRegular.copyWith(fontSize: 12),
                  ),
                )
              ],
            ),
          );
        }
        return FinishedShiftWidget(
          currentShift,
          onClickCheckout: () {
            onClickCheckout();
          },
        );
      },
    );
  }

}

class FinishedShiftWidget extends BaseStatelessWidget {
  final AppliedOffer currentShift;
  final Function onClickCheckout;

  FinishedShiftWidget(this.currentShift, {required this.onClickCheckout});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsetsDirectional.only(start: 20, bottom: 12, top: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: getCurrentShiftBackgroundColor(0)),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    MaterialText(
                      strings.finish_shift_label,
                      style: kTextLabelFontDark.copyWith(
                          fontSize: 12, color: getHourColor(0)),
                      startIcon: SvgPicture.asset(
                        'images/clock.svg',
                        color: getHourColor(0),
                        height: 15,
                      ),
                      startIconPadding:
                          const EdgeInsetsDirectional.only(end: 8),
                      padding: const EdgeInsetsDirectional.only(end: 8),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    '${currentShift.jobName} , ${currentShift.projectName}',
                    style: kTextRegular.copyWith(fontSize: 12),
                  ),
                )
              ],
            )),
            SizedBox(
              width: 80,
              height: 36,
              child: AppCupertinoButton(
                text: strings.checkout,
                backgroundColor: kLipStick,
                padding: EdgeInsets.zero,
                radius: BorderRadius.circular(10),
                textStyle:
                    kTextRegular.copyWith(fontSize: 10, color: Colors.white),
                onPressed: () {
                  onClickCheckout();
                },
              ),
            ),
            const SizedBox(
              width: 8,
            )
          ],
        ));
  }
}

Color getHourColor(int hour) {
  return hour < 1 ? Colors.red : kPrimary;
}

Color getCurrentShiftBackgroundColor(int hour) {
  return (hour < 1 ? Colors.red : kPrimary).withOpacity(0.10);
}
