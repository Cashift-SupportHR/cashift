import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:location/location.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/widgets/cancel_shift_widget.dart';

import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/shapes/rounded_shape.dart';

import 'app_requirement_notification_widget.dart';
import 'timer_widget.dart';

class StartSoonShiftWidget extends BaseStatelessWidget {
  final AppliedOffer shift;
  final Function(LocationData location) onConfirm;
  final Function(String msg) onReject;
  final bool isStarted;
  StartSoonShiftWidget(
      {Key? key,
      required this.shift,
      required this.onConfirm,
      required this.onReject,
      this.isStarted = true});

  @override
  Widget build(
    BuildContext context,
  ) {
    return TimerWidget(
      currentShift: shift,
      timeoutWidget: Container(),
      timerWidget: (c, timer) {
        return Stack(
          children: [
            PositionedDirectional(
                top: 0,
                start: 10,
                child: RoundedShape(
                  width: 70,
                  height: 18,
                  color: kLipStick.withOpacity(0.9),
                  child: Text(
                    timer.min.toString() + ':' + timer.sec.toString(),
                    style:
                        kTextRegular.copyWith(color: Colors.white, height: 1.2),
                  ),
                )),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 8),
              child: inAppRequirementNotification(context, timer),
            ),
          ],
        );
      },
    );
  }

  Widget inAppRequirementNotification(
      BuildContext context, CurrentRemainingTime timer) {
    return InAppRequirementNotification(
      message:_buildMessage(),
      onSubmit: () {
        acceptJob(shift.id!);
      },
      onReject: () {
        cancelJob(shift.id!, context);
      },
    );
  }

  cancelJob(int id, BuildContext context) async {
    CancelShiftWidget.showCancelShiftDialog(context, onConfirm: (message) {
      onReject(message);
    });
  }

  acceptJob(int id) {
    fetchLocation(onGetLocation: ((location) {
      print('fetchLocation $location');
      onConfirm(location);
    }));
  }


 String _buildMessage() {
    return  strings.confirm_attendance_message +
        '\n' +
        shift.jobName.toString() +
        ' ' +
        shift.projectName.toString();
  }
}
