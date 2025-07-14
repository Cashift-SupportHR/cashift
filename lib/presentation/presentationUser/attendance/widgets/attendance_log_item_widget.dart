import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/attendance/Attendance_log.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/pages/attendance_log_page.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

class AttendanceLogItemWidget extends BaseStatelessWidget {
  final AttendanceLog attendanceLog;
  final AttendanceRequestType status;
  final bool? header;
  AttendanceLogItemWidget(this.attendanceLog,
      {this.header, required this.status});
  @override
  Widget build(BuildContext context) {
    final statusColor = status == AttendanceRequestType.attend ? kAttendanceStatusColor
        : status == AttendanceRequestType.absence ? kAbsenceStatusColor
        :  status == AttendanceRequestType.vacation  ? kVacationColor :kDelayColor;
    final textStyle = kTextRegularPrimary.copyWith(fontSize: 11);
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: Text(
              attendanceLog.fullDates!,
              style: kTextRegularPrimary.copyWith(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
        status == AttendanceRequestType.overtime
            ? SizedBox(
                width: 0,
                height: 0,
              )
            : Expanded(
                flex: 2,
                child: Center(
                  child: header == true
                      ? Text(
                          'الحالة',
                          style: textStyle,
                        )
                      : Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: statusColor,
                          ),
                        ),
                ),
              ),
        status != AttendanceRequestType.vacation
            ? Expanded(
                flex: 2,
                child: Text(
                  attendanceLog.checkIn!,
                  style: textStyle,
                ))
            : SizedBox(),
        status != AttendanceRequestType.vacation
            ? Expanded(
                flex: 2,
                child: Text(
                  attendanceLog.checkOut!,
                  style: textStyle,
                ))
            : Expanded(
                flex: 2,
                child: Text(
                  attendanceLog.vacationType!,
                  style: textStyle,
                ))
      ],
    );
  }
}
