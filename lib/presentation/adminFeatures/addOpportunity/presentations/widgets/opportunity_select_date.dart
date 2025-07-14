import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/helper_widgets.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';

class OpportunitySelectDate extends BaseStatelessWidget {
  final Function(List dates) onPressed;
  final int? opportunityId;
  final TextEditingController? opportunityDateController;
  final StreamState<bool> isAllowEditDateOppStream;
  OpportunitySelectDate({Key? key, required this.onPressed, this.opportunityId, this.opportunityDateController, required this.isAllowEditDateOppStream}) : super(key: key);
// DateFormatter
  @override
  Widget build(BuildContext context) {
    List opportunityDates = [DateTime.now()];
    List opportunityApiDates = [DateTime.now()];
    return StreamBuilder<bool>(
      stream: isAllowEditDateOppStream.stream,
      builder: (context, snapshot) {
        bool isAllowEditDateOpp = snapshot.data ?? false;
        return BuildTextFieldItem(
            title: strings.opportunity_date,
            hintText: strings.select_opportunity_date,
            suffixIcon: Icons.calendar_today,
            isValidator: true,
            controller: opportunityDateController,
            onTap: () {
              print("isAllowEditDateOpp $isAllowEditDateOpp");
              showAppModalBottomSheet(
                context: context,
                isScrollControlled: false,
                title: strings.select_working_day_date,
                child: Column(
                  children: [
                    opportunityId != null ?
                    Expanded(
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          print("value $value");
                          opportunityDates[0] = DateFormatter.formatDateStringNoLangCode(value.toString());
                          print("opportunityDates[0] ${opportunityDates[0]}");
                        },
                        dateOrder: DatePickerDateOrder.mdy,
                        initialDateTime: DateTime.now(),
                        minimumYear: isAllowEditDateOpp ? DateTime.now().month : DateTime.now().day,
                        maximumYear: DateTime.now().add(const Duration(days: 365 )).year,
                      ),
                    ) :
                    Expanded(
                      child: SfDateRangePicker(
                        view: DateRangePickerView.month,
                        selectionMode: DateRangePickerSelectionMode.range,
                        minDate: isAllowEditDateOpp ? DateTime.now().add(const Duration(days: -30)) : DateTime.now(),
                        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                          PickerDateRange? dateRange = args.value;
                          opportunityDates = [dateRange?.startDate, dateRange?.endDate ?? dateRange?.startDate];

                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20 , right: 10, left: 10),
                      child: AppCupertinoButton(
                        text: strings.save_button,
                        onPressed: () {
                          if(opportunityId == null){
                            print("opportunityId ${opportunityDates[0]}");
                            opportunityApiDates = opportunityDates.map((e) => DateFormatter.formatDateStringNoLangCode(e.toString())).toList();
                            opportunityDates = opportunityDates.map((e) => DateFormatter.formatDateStringNoPattern(e.toString())).toList();
                            opportunityDateController!.text = ["${strings.from} ${opportunityDates[0]}", "${strings.too} ${opportunityDates[1]}"].join(' ');
                          } else{
                            print("opportunityDates[0] ${opportunityDates[0]}");
                            opportunityDateController!.text = opportunityDates[0];
                          }
                          onPressed(opportunityApiDates);
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
      }
    );
  }
}
