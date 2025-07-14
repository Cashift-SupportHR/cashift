import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';

import '../../presentationUser/resources/colors.dart';
import '../../presentationUser/resume/widgets/date_picker.dart';
import 'app_cupertino_button.dart';
import 'base_stateless_widget.dart';
import 'material_text_field.dart';

class DatePickerTextFieldWidget extends BaseStatelessWidget {
  DatePickerTextFieldWidget( {
    Key? key,
    required this.hintText,
    this.validator,
    required this.controller,
    required this.dateAbsenceController,
    required this.isHijri,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextEditingController dateAbsenceController;
  final  String? Function(String?)? validator;
  DateTime? opportunityDates;
  String? dateHijri;
  final bool isHijri;
  @override
  Widget build(BuildContext context) {
    return MaterialTextFieldWithCard(
      validator: validator,
      onTap: () {
        isHijri == false
            ? showAppModalBottomSheet(
                context: context,
                isScrollControlled: false,
                title: strings.date_absence,
                child: Column(
                  children: [
                    Expanded(
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {

                          opportunityDates = value;
                        },
                        dateOrder: DatePickerDateOrder.mdy,
                        initialDateTime: DateTime.now(),
                        minimumYear:
                            DateTime.now().add(const Duration(days: -365)).year,
                        maximumYear:
                            DateTime.now().add(const Duration(days: 365)).year,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, right: 10, left: 10),
                      child: AppCupertinoButton(
                        text: strings.save_button,
                        onPressed: () {
                          if (  dateAbsenceController.text.isNotEmpty){
                            dateAbsenceController.text = DateFormatter.repairRequestApiDate(opportunityDates!);
                          }else{
                            dateAbsenceController.text = DateFormatter.getCurrentDate(pattern: DateFormatter.DAY_MONTH_YEAR,
                            local: 'en');
                          }

                          Navigator.pop(context, true);
                        },
                      ),
                    )
                  ],
                ),
              )
            : showModalBottomSheet(
                context: context,
                builder: (BuildContext builder) {
                  return DatePicker(
                    onSelectdate: (var date, bool isHijri) {
                      dateHijri = date;
                      isHijri = isHijri;
                      dateAbsenceController.text = dateHijri!;
                    },
                  );
                });
      },
      hintText: hintText,
      readOnly: true,
      controller: controller,
      startIcon: const Icon(
        Icons.calendar_month_outlined,
        color: kPrimary,
        size: 20,
      ),
    );
  }
}
