import 'package:flutter/material.dart';
import 'package:shiftapp/common/data/models/attendance/attendance_shift_dto.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/widgets/attendance_log_tabs.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/widgets/shared_widgets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../widgets/fingerprint_actions_list.dart';
import '../widgets/timer_counter.dart';

class AttendanceScreen extends BaseStatelessWidget {
  final AttendanceShiftDto attendanceShift;
  final Function(int) onSubmit;

  AttendanceScreen(
      {Key? key, required this.attendanceShift, required this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            employeeInfo(context,
                name: attendanceShift.nameEmployee,
                job: attendanceShift.jobName),
            const SizedBox(
              height: 12,
            ),
            companyInfoCard(context,
                projectName: attendanceShift.projectName,
                city: attendanceShift.cityName),
            const SizedBox(
              height: 20,
            ),
            attendanceInfoCard(context),
            const SizedBox(
              height: 20,
            ),
            attendanceLogWidget(),
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
        child: Text(
          strings.check_finger,
          style: kButtonTextStyle.copyWith(fontSize: 14),
        ),
        padding: const EdgeInsets.all(6),
        radius: BorderRadius.circular(8),
        onPressed: () {
          // onSubmit();
        },
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
    return AttendanceLogTabs();
  }

  Widget attendanceInfoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
          color: kPrimaryLight, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialText(
            today(),
            startIcon: const Icon(
              Icons.calendar_month_outlined,
              color: kPrimary,
              size: 14,
            ),
            startIconPadding: const EdgeInsetsDirectional.only(end: 4),
            style: kTextRegularPrimary.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: 4,
          ),
          MaterialText(
            ' مواعيد العمل \t'
            '${attendanceShift.shiftFrom} - ${attendanceShift.shiftTo}',
            startIcon: const Icon(
              Icons.access_time,
              color: kPrimary,
              size: 14,
            ),
            startIconPadding: const EdgeInsetsDirectional.only(end: 4),
            style: kTextRegularPrimary.copyWith(fontSize: 12),
          ),

          if (attendanceShift.startShiftTimeHoure != 0)
            TimerCounter(
              endTimeDateTime: attendanceShift.endTimeDateTime ?? '',
            ),
          MaterialText(
            attendanceShift.employeeChar!,
            startIcon: kLoadSvgInCirclePath(
              AppIcons.clockWaiting,
            ),
            startIconPadding: const EdgeInsetsDirectional.only(end: 4),
            style:
                kTextRegularPrimary.copyWith(fontSize: 12, color: kYellow_00),
          ),
          const SizedBox(
            height: 16,
          ),
          FingerprintActionsList(
            presentType: attendanceShift.presentType,
            onFingerPrint: (presentId) {
              onSubmit(presentId);
            },
          ),
        ],
      ),
    );
  }

  String today() {
    return DateFormatter.formatDate(DateTime.now(), DateFormatter.DATE_UI);
  }
}
