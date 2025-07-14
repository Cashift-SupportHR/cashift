import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';

class MonthPickerWidget extends BaseStatelessWidget {
  final Function(DateTime date) onDateChange;
  MonthPickerWidget({required this.onDateChange});

  DateTime _dateTime = DateTime.now();
  final _streamController = BehaviorSubject<String>();
  Stream<String> get stream => _streamController.stream;
  @override
  Widget build(BuildContext context) {
    return datePickerWidget(context);
  }

  Widget datePickerWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 12, top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              pickDate(context).then((value) {
                if (value != null) {
                  _dateTime = value;
                  _streamController.add(dateString(_dateTime));
                  onDateChange(value);
                }
              });
            },
            child: StreamBuilder<String>(
                stream: stream,
                builder: (context, snapshot) {
                  return MaterialText(
                    dateString(_dateTime),
                    style: kTextMediumPrimary.copyWith(fontSize: 12),
                    endIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kPrimary,
                    ),
                  );
                }),
          ),
          // Container(
          //   width: 60,
          //   color: kOrange47,height: 1,)
        ],
      ),
    );
  }

  DateTime minDate() {
    final now = DateTime.now();
    return DateTime(now.year - 1);
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final selected = await showMonthYearPicker(
      context: context,
      initialMonthYearPickerMode: MonthYearPickerMode.year,
      initialDate: DateTime.now(),
      firstDate: minDate(),
      lastDate: maxDate(),
    );
    if (selected != null) {
      return selected;
    }
    return null;
  }

  String dateString(DateTime date) {
    return DateFormatter.monthNameYear(date);
  }

  DateTime maxDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1);
  }
}
