import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../shared/components/app_cupertino_button.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/helper_widgets.dart';

class DatePickerAttendance extends BaseStatelessWidget {
  final Function(String, String)? onChanged;

  DatePickerAttendance({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamState<bool> isDeleteStream = StreamStateInitial();

    String? fromDate;
    String? toDate;
    PickerDateRange? dateRange =
        PickerDateRange(DateTime.now(), DateTime.now());
    final now = DateTime.now();

    return StreamBuilder<bool>(
        stream: isDeleteStream.stream,
        builder: (context, snapshot) {
          return InkWell(
            onTap: () async {
              showAppModalBottomSheet(
                context: context,
                isScrollControlled: false,
                title: strings.select_working_day_date,
                child: Column(
                  children: [
                    Expanded(
                      child: SfDateRangePicker(
                        view: DateRangePickerView.month,
                        selectionMode: DateRangePickerSelectionMode.range,
                        onSelectionChanged:
                            (DateRangePickerSelectionChangedArgs args) {
                          dateRange = args.value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, right: 10, left: 10),
                      child: AppCupertinoButton(
                        text: strings.save_button,
                        onPressed: () {
                          String startDateLangCode =
                              DateFormatter.formatDateStringNoPattern(
                                  dateRange!.startDate.toString());
                          String endDateLangCode =
                              DateFormatter.formatDateStringNoPattern(
                                  dateRange!.endDate.toString());
                          String startDate =
                              DateFormatter.formatDateStringNoLangCode(
                            dateRange!.startDate.toString(),
                          );
                          String endDate =
                              DateFormatter.formatDateStringNoLangCode(
                                  dateRange!.endDate.toString());
                          fromDate = startDateLangCode;
                          toDate = endDateLangCode;
                          isDeleteStream.setData(true);
                          onChanged?.call(startDate, endDate);
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              );
            },
            child: FittedBox(child: Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: kPrimary,
                ),
                Text(fromDate == null ? strings.from_day : fromDate.toString(),
                    style: kTextSemiBold.copyWith(
                        color: kPrimaryDark, fontSize: 12)),
                SizedBox(
                  width: 13,
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: kPrimary,
                ),
                Text(toDate == null ? strings.to_day : toDate.toString(),
                    style: kTextSemiBold.copyWith(
                        color: kPrimaryDark, fontSize: 12)),
                ],
              ),
            ),
          );
        });
  }
}
