import 'package:flutter/material.dart';

import 'package:shiftapp/common/data/models/attendance/attendance_shift_dto.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/overtimeAttendance/page/overtime_log_page.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/widgets/shared_widgets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text.dart';

class OvertimeAttendanceScreen extends BaseStatelessWidget {
  final AttendanceShiftDto attendanceShift;
  final Function()? onSubmit;

  OvertimeAttendanceScreen({required this.attendanceShift,  this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        child: Column(
          children: [
            employeeInfo(context,name: attendanceShift.nameEmployee,job: attendanceShift.jobName),
            SizedBox(
              height: 12,
            ),
            companyInfoCard(context, projectName: attendanceShift.projectName??'',city: attendanceShift.cityName??''),
            SizedBox(
              height: 20,
            ),
            attendanceInfoCard(context),
            SizedBox(
              height: 20,
            ),
            Expanded(child: attendanceLogWidget()),
          ],
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: AppCupertinoButton(
      //  text: strings.check_finger,
        child: Text( buttonName(),style: kButtonTextStyle.copyWith(fontSize: 14),),
        padding: EdgeInsets.all(6),
        backgroundColor: buttonColor(),
        radius: BorderRadius.circular(8),
        onPressed: onSubmit,
      ),
    );
  }


  Widget buildHeader(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          kBuildCircleImagePlaceHolder(scale: 2.2),
          const SizedBox(
            height: 8,
          ),
          Text(attendanceShift.jobName!,
              style: kTextMedium.copyWith(color: kFontDark, fontSize: 20)),
          const SizedBox(
            height: 4,
          ),
          Text(
            attendanceShift.projectName!,
            style: kTextMedium.copyWith(color: kBattleShipGrey, fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }


  Widget attendanceLogWidget() {
    return OvertimeLogPage();
  }

  Widget attendanceInfoCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: kPrimaryLight, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          MaterialText(
            today(),
            startIcon: Icon(
              Icons.calendar_month_outlined,
              color: kPrimary,
              size: 14,
            ),
            startIconPadding: EdgeInsetsDirectional.only(end: 4),
            style: kTextRegularPrimary.copyWith(fontSize: 12),
          ),
          SizedBox(
            height: 4,
          ),
          MaterialText(
            ' ${strings.shift_hours} \t'
                '${attendanceShift.shiftFrom} - ${attendanceShift.shiftTo}',
            startIcon: Icon(
              Icons.access_time,
              color: kPrimary,
              size: 14,
            ),
            startIconPadding: EdgeInsetsDirectional.only(end: 4),
            style: kTextRegularPrimary.copyWith(fontSize: 12),
          ),
          SizedBox(
            height: 16,
          ),
          submitButton(context)
        ],
      ),
    );
  }

  String today() {
    return DateFormatter.formatDate(DateTime.now(), DateFormatter.DATE_UI);
  }

  String buttonName() {
    return attendanceShift.startOverTime==true? strings.end_overtime : strings.start_overtime;
  }

  Color buttonColor() {
    return attendanceShift.startOverTime==false ?kPrimary : kLipStick;
  }

}