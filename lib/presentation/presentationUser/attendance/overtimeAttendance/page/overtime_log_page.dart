import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/attendance/index.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/overtimeAttendance/bloc/overtime_attendance_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/pages/attendance_log_page.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/widgets/attendance_log_widget.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

class OvertimeLogPage extends BaseBlocWidget<Initialized<List<AttendanceLog>>,
    OvertimeAttendanceCubit> {
  @override
  bool initializeByKoin() {

    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchOvertimeLog();
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<AttendanceLog>> state) {
    return AttendanceLogWidget(
      state.data,
      status: AttendanceRequestType.overtime,
    );
  }

  AttendanceLogQuery createQuery(int month, int year) {
    return AttendanceLogQuery(
        month: month,
        year: year,
        typeRequest: AttendanceRequestType.overtime.index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: buildConsumer(context));
  }
}
