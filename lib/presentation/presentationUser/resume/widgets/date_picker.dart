import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateful_widget.dart';
import 'package:shiftapp/presentation/shared/components/datepicker/date_picker.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';
import 'package:shiftapp/core/utils/app_utils.dart';

import '../../../shared/components/datepicker/hijri_calendar.dart';

class DatePicker extends StatefulWidget {
  final Function(String date , bool isHijri) onSelectdate;
  DatePicker({required this.onSelectdate});

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends BaseState<DatePicker> {
  String selectedDate = '';

  bool isHijri = true;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final nowHijri = HijriCalendar.now();

    final minHijri = nowHijri.hYear-70 ;
    final maxHijri = nowHijri.hYear-18 ;
    final initHijri = nowHijri..hYear = maxHijri ;
    final minDate = DateTime(
      now.year - 70,
    );
    final maxDate = DateTime(
      now.year - 18,
    );
    final initDate = DateTime(
      now.year - 18,
    );
    if (selectedDate.isEmpty) {
      if(isHijri){
        final hijriDate = AppUtils.replaceArabicNumber(initHijri.toFormat('dd/mm/yyyy'));

        selectedDate   = hijriDate ;
      }else{
      selectedDate = DateFormatter.formatDate(initDate, DateFormatter.DAY_MONTH_YEAR, local: 'en');
      }

    }

    print('DatePicker isHijri $isHijri');

    return Container(
      height: 340,
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(strings.birthdate,
               style: kTextMedium.copyWith(fontSize: 16),),

             PopupMenuButton(

                 child: MaterialText(isHijri?strings.hijri_date:strings.gregorian_date,style: kTextMedium.copyWith(fontSize: 14),
                 endIcon: SvgPicture.asset('images/arrow_down.svg'),endIconPadding: EdgeInsetsDirectional.only(start: 16),),
                  position: PopupMenuPosition.under,
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                        PopupMenuItem<String>(
                            child: Text(strings.hijri_date,style: kTextRegular.copyWith(
                                fontSize: 11, color: kGreyishBrown),), value: 'Attendance',),
                        PopupMenuItem<String>(
                            child: Text(strings.gregorian_date,
                                style: kTextRegular.copyWith(
                                    fontSize: 11, color: kGreyishBrown)),
                            value: 'Lion'),
                      ],
                  onSelected: (value) {
                    setState(() {   if (value == 'Attendance') {
                      isHijri = true;
                    } else {
                      isHijri = false;
                    }


                    });
                  }),
           ],
         ),
          Expanded(
            child: isHijri == true
                ? HijriCupertinoDatePicker(
                    onDateTimeChanged: (d) {
                      final hijriDate = AppUtils.replaceArabicNumber(d.toFormat('dd/mm/yyyy'));
                      selectedDate =hijriDate;
                    },
                    mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.mdy,
               minimumYear:minHijri ,
                    maximumYear: maxHijri,
              initialDateTime: initHijri,
                  )
                : CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,

                    onDateTimeChanged: (value) {
                      selectedDate = DateFormatter.formatDate(
                          value, DateFormatter.DAY_MONTH_YEAR,
                          local: 'en');
                    },
              dateOrder: DatePickerDateOrder.mdy,
                    initialDateTime: initDate,
                    minimumYear: minDate.year,
                    maximumYear: maxDate.year,
                  ),
          ),
          AppCupertinoButton(
            text: strings.save_button,
            onPressed: () {
              widget.onSelectdate(selectedDate, isHijri);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
