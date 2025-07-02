import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/texts/list_row_texts_icons.dart';
import 'package:shiftapp/core/utils/app_icons.dart';
import '../../../../../../domain/entities/shared/date_formatter.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../domain/entities/ScheduleEmpAttendanceList.dart';

class AttendanceNotificationsReportsItem extends BaseStatelessWidget {
  final ScheduleEmpAttendanceList scheduleEmpAttendanceList;

  AttendanceNotificationsReportsItem(
      {super.key, required this.scheduleEmpAttendanceList});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          Row(
            children: [
              kBuildCircleImage("", size: 50),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scheduleEmpAttendanceList.freelancerName ?? "",
                    style:
                        kTextBold.copyWith(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    scheduleEmpAttendanceList.attendanceStatus ?? "",
                    style: kTextRegular.copyWith(
                        fontSize: 14, color: Colors.black38),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListRowTextsIcons(
            icons: [
              AppIcons.calanderTime,
              AppIcons.empName,
              AppIcons.calanderTime,
              AppIcons.handOne,
              AppIcons.handTow,
            ],
            titles: [
              strings.period,
              strings.type,
              strings.working_hours,
              strings.starting_fingerprint,
              strings.ending_fingerprint,
            ],
            values: [
              scheduleEmpAttendanceList.shiftName ?? "",
              scheduleEmpAttendanceList.employeeStatusName ?? "",
              scheduleEmpAttendanceList.workHoursNumber.toString() ?? "",
              scheduleEmpAttendanceList.empStartShiftDate == null
                  ? ""
                  : DateFormatter.formatDateString(
                      scheduleEmpAttendanceList.empStartShiftDate ?? "",
                      DateFormatter.TIME_STAMP,
                      DateFormatter.HOUR_MINUT_12),
              scheduleEmpAttendanceList.empEndShiftDate == null
                  ? ""
                  : DateFormatter.formatDateString(
                      scheduleEmpAttendanceList.empEndShiftDate ?? "",
                      DateFormatter.TIME_STAMP,
                      DateFormatter.HOUR_MINUT_12),
            ],
          ),
        ],
      ),
    );
  }
}
