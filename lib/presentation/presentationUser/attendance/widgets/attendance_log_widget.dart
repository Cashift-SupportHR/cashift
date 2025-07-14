import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/attendance/Attendance_log.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/pages/attendance_log_page.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/widgets/attendance_log_item_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';

class AttendanceLogWidget extends BaseStatelessWidget {
  final List<AttendanceLog> attandanceLog;
  final AttendanceRequestType status;
  AttendanceLogWidget(this.attandanceLog, {required this.status});

  AttendanceLog header() => AttendanceLog(
        fullDates: strings.today,
        status: strings.status,
        checkOut: strings.leave,
        checkIn: strings.attendance,
        vacationType: strings.vacation_type,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
      child: Column(
        children: [
          AttendanceLogItemWidget(
            header(),
            status: status,
            header: true,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: attandanceLog.length,
            //  shrinkWrap: true,
            //  physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = attandanceLog[index];
                return AttendanceLogItemWidget(
                  item,
                  status: status,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: kDivider,
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          status == AttendanceRequestType.overtime
              ? const SizedBox()
              : Row(
                  children: [
                    statusDefination(
                        strings.attendance, kAttendanceStatusColor),
                    statusDefination(strings.absence, kAbsenceStatusColor),
                    statusDefination(strings.delay, kDelayColor),
                    statusDefination(strings.vacations, kVacationColor),
                  ],
                ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget statusDefination(String title, Color color) {
    return MaterialText(
      title,
      style: kTextRegularPrimary.copyWith(fontSize: 10),
      startIcon: statusCircle(color),
      margin: const EdgeInsetsDirectional.only(start: 16),
      startIconPadding: const EdgeInsetsDirectional.only(end: 10),
    );
  }

  Widget statusCircle(Color color) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
