import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/absencenotice/page/widget/attendance_info_card_widget.dart';
import 'package:shiftapp/presentation/presentationUser/absencenotice/page/widget/data_user_widget.dart';
import 'package:shiftapp/presentation/presentationUser/absencenotice/page/widget/table_data_absence.dart';
import 'package:shiftapp/common/data/models/absence_notation/index.dart';

import '../../../../common/data/models/attendance/index.dart';
import '../../../shared/components/base_stateless_widget.dart';

class AbsenceNoticeScreen extends BaseStatelessWidget {
  final List<AbsenceDateParams> absenceDateParams;
  final AttendanceShiftDto attendanceShiftDto;
  AbsenceNoticeScreen({required this.absenceDateParams,required this.attendanceShiftDto, Key? key})
      : super(key: key);
  CalcOpportunity? calcOpportunity;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          DataUserWidget(
              employeeName: attendanceShiftDto.nameEmployee??"",
              idNumber: attendanceShiftDto.idNumber??"",
              job: attendanceShiftDto.jobName??"",
              projectName: attendanceShiftDto.projectName??""),

          AttendanceInfoCardWidget(),
          TableDataAbsenceWidget(absenceDateParams),
        ],
    );
  }
}
