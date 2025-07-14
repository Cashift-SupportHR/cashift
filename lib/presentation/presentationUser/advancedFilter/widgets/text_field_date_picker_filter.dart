import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text_field.dart';
import 'package:shiftapp/utils/app_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/helper_widgets.dart';
import '../../../../common/components/radio/radio_grid_list.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';

class TextFieldDatePicker extends BaseStatelessWidget {
  final String? fromDate;
  final String? toDate;
  final String? title;
  final Function(String, String)? onChanged;

  TextFieldDatePicker(
      {Key? key, this.title, this.onChanged, this.fromDate, this.toDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamState<bool> isDeleteStream = StreamStateInitial();
    TextEditingController _controller = TextEditingController();
    if (fromDate!.isNotEmpty && toDate!.isNotEmpty) {
      isDeleteStream.setData(true);
      _controller.text = '$fromDate - $toDate';
    }

    PickerDateRange? dateRange =
        PickerDateRange(DateTime.now(), DateTime.now());
    final now = DateTime.now();
    DateTime dateFrom7Da = now.subtract(const Duration(days: 7));
    DateTime dateFrom14Da = now.subtract(const Duration(days: 14));
    DateTime dateFromMonth = now.subtract(const Duration(days: 30));
    String dateNow = DateFormatter.getCurrentDate(
        pattern: DateFormatter.DAY_MONTH_YEAR, local: "en");
    String date7 = DateFormatter.formatDate(
        dateFrom7Da, DateFormatter.DAY_MONTH_YEAR,
        local: "en");
    String date14 = DateFormatter.formatDate(
        dateFrom14Da, DateFormatter.DAY_MONTH_YEAR,
        local: "en");
    String dateMonth = DateFormatter.formatDate(
        dateFromMonth, DateFormatter.DAY_MONTH_YEAR,
        local: "en");
    List<RadioItem> dataRadio = [
      RadioItem(value: dateNow, title: strings.current),
      RadioItem(value: date7, title: strings.from_week),
      RadioItem(value: date14, title: strings.from_tow_week),
      RadioItem(value: dateMonth, title: strings.from_month_week),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? strings.date_opportunity_offered,
            style: kTextSemiBold.copyWith(color: kPrimary),
          ),
          const SizedBox(
            height: 8,
          ),
          MaterialTextField(
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
                                  dateRange!.startDate.toString(),
                                  local: "en");
                          String endDateLangCode =
                              DateFormatter.formatDateStringNoPattern(
                                  dateRange!.endDate.toString(),
                                  local: "en");
                          String startDate =
                              DateFormatter.formatDateStringNoLangCode(
                            dateRange!.startDate.toString(),
                          );
                          String endDate =
                              DateFormatter.formatDateStringNoLangCode(
                                  dateRange!.endDate.toString(),
                                  local: "en");
                          _controller.text =
                              '$startDateLangCode - $endDateLangCode';
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
            readOnly: true,
            controller: _controller,
            inputDecoration: kRequestTextFieldDecoration.copyWith(
              hintText: strings.write_date,
              hintStyle:
                  kTextSemiBold.copyWith(color: kBattleShipGrey2, fontSize: 16),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: StreamBuilder<bool>(
                  stream: isDeleteStream.stream,
                  builder: (context, snapshot) {
                    return InkWell(
                      onTap: () {
                        _controller.clear();
                        onChanged?.call('', '');
                        isDeleteStream.setData(false);
                      },
                      child: kLoadSvgInCirclePath(
                          (snapshot.data ?? false)
                              ? AppIcons.removeCircle
                              : AppIcons.calendar2,
                          color: kPrimary),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RadioGridList(
            crossAxisCount: 4,
            color: Colors.black,
            items: dataRadio,
            groupValue: dataRadio.first.value,
            onChanged: (item) {
              print(item.value);
              print("jhbekvd");

              String startDate = DateFormatter.formatDateStringNoLangCode(
                item.value  ,
              );
              String endDate =
                  DateFormatter.formatDateStringNoLangCode(dateNow);
              print(startDate);
              print(startDate);
              print(endDate);
              _controller.text = '$dateNow - ${item.value}';
              isDeleteStream.setData(true);
              onChanged?.call( item.value,dateNow);
            },
          ),
        ],
      ),
    );
  }
}
