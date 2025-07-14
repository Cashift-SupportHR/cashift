import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/attendance/violation.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/bloc/attendance_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/slide_animation.dart';


class AttendanceViolationPage
    extends BaseBlocWidget<Initialized<List<Violation>>, AttendanceCubit> {
  DateTime date = DateTime.now();

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchViolation();
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<Violation>> state) {
    return ListView.builder(
        itemCount: state.data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return attendanceViolationItemWidget(state.data[index], context);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SlideAnimationWidget(
      child: Column(
        children: [buildConsumer(context)],
      ),
    );
  }

  @override
  Widget handleApiErrorPlaceHolder(error,
      {Function()? onReload, String? buttonName, double? height}) {
    return super
        .handleApiErrorPlaceHolder(error, onReload: onClickReload, height: 300);
  }

  Widget attendanceViolationItemWidget(
      Violation violation, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(30, 134, 111, 0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                itemRow(
                    strings.violation_date,
                    DateFormatter.repairApiDateTime(
                        violation.violationDate ?? '',apiPattern: DateFormatter.DATE_TIME_API)),
                itemRow(strings.violation, violation.violationName ?? ''),
                itemRow(strings.violation_details,
                    violation.violationDescription ?? ''),
                itemRow(strings.violation_repeated,
                    violation.violationRepeated ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemRow(String title, String value) {
    final labelStyle =
        kTextSemiBold.copyWith(color: kPrimaryDark, fontSize: 18);
    final valueStyle = kTextRegularGrey.copyWith(fontSize: 14,color: kBrownishGreyTwo);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title+' :\t',
            style: labelStyle,
          ),
          Expanded(
              child: Text(
            value,
            style: valueStyle,
          ))
        ],
      ),
    );
  }
}
