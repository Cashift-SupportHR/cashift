import 'package:flutter/cupertino.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';

typedef CountdownTimerWidgetBuilder = Widget Function(
    BuildContext context, CurrentRemainingTime time);

class TimerWidget extends StatelessWidget {
  final AppliedOffer currentShift;
  final Widget timeoutWidget ;
  final CountdownTimerWidgetBuilder timerWidget ;

  TimerWidget({required this.currentShift, required this.timeoutWidget , required this.timerWidget});

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: currentShift.finishedDateTime()!.millisecondsSinceEpoch,
      widgetBuilder: (c, time) {
        final hour = time != null && time.hours != null ? time.hours! : 0;
        if (time != null) {
          return timerWidget(context,time);
        }
        return timeoutWidget;
      },
    );
  }

}
