import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/attendance/Attendance_log.dart';
import 'package:shiftapp/common/domain/entities/attendance/Attendance_log_query.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/bloc/attendance_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/widgets/attendance_log_widget.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/widgets/month_picker_widget.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/slide_animation.dart';

enum AttendanceRequestType {
  attend,
  absence,
  delay,
  vacation,
  overtime
}

class AttendanceLogPage
    extends BaseBlocWidget<Initialized<List<AttendanceLog>>, AttendanceCubit> {
  final AttendanceRequestType requestType;
  AttendanceLogPage({required this.requestType});

  DateTime date = DateTime.now();
  @override
  bool detectRequiredTasks() {
    return false ;
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAttendanceLog(createQuery(date.month, date.year));
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<AttendanceLog>> state) {
    return AttendanceLogWidget(
      state.data,
      status: requestType,
    );
  }

  AttendanceLogQuery createQuery(int month, int year) {
    return AttendanceLogQuery(
        month: month, year: year, typeRequest: requestType.index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return SlideAnimationWidget(
      child: Column(
        children: [
          datePickerWidget(context),
          Expanded(child: buildConsumer(context))
        ],
      ),
    );
  }


  @override
  Widget handleApiErrorPlaceHolder(error, {Function()? onReload, String? buttonName, double? height}) {
    return super.handleApiErrorPlaceHolder(error,onReload: onClickReload ,height: 300);

  }
  Widget datePickerWidget(BuildContext context) {
    return MonthPickerWidget(
      onDateChange: (DateTime date) {
        this.date = date;
        loadInitialData(context);
      },
    );
  }
}
