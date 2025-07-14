import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/data/exceptions/empty_list_exception.dart';
import 'package:shiftapp/common/domain/entities/attendance/Attendance_log_query.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/widgets/month_picker_widget.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/decorations/decorations.dart';
import 'package:shiftapp/common/components/slide_animation.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../data/models/emp_attandance_prams.dart';
import '../../../../domain/entities/Emp_attandance.dart';
import '../../bloc/employees_cubit.dart';
import '../../widgets/date_picker_filter.dart';
import 'attendance_employee_screen.dart';
import 'cubit/employees_attendance_cubit.dart';

enum AttendanceType { attend, absence, delay, vacation, overtime }

class AttendanceEmployeePage extends BaseBlocWidget<Initialized<EmpAttandance>,
    EmployeesAttendanceCubit> {
  final AttendanceType requestType;
  final int empId;
  AttendanceEmployeePage({required this.requestType, required this.empId});

  DateTime date = DateTime.now();

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData(
        empAttandancePrams: createQuery(date.month, date.year));
  }

  Widget noDataPlaceHolder() => SvgPicture.asset(
        'images/no_data_placeholder.svg',
        height: 150,
      );

  @override
  Widget buildWidget(BuildContext context, Initialized<EmpAttandance> state) {
    return (state.data.transactionsList == null ||
            state.data.transactionsList!.isEmpty)
        ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                noDataPlaceHolder(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  strings.list_empty,
                  style: kTextMedium.copyWith(fontSize: 14),
                )
              ],
            ),
          )
        : AttendanceEmployeesScreen(
            indexPage: requestType.index + 1,
            transactionsList: state.data.transactionsList ?? [],
          );
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 55,
            color: Colors.white,
            child: datePickerWidget(context),
          ),
          Expanded(child: buildConsumer(context))
        ],
      ),
    );
  }

  EmpAttandancePrams createQuery(int month, int year) {
    return EmpAttandancePrams(
        scheduleEmployeeWorkId: empId,
        month: month,
        year: year,
        typeRequest: requestType.index + 1);
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
