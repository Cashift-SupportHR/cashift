import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';
import 'package:shiftapp/utils/app_utils.dart';

import '../../../presentationUser/resources/colors.dart';
import '../decorations/decorations.dart';
import 'build_text_field_item.dart';

class DateTimeTextFieldPicker extends StatelessWidget {
  final String? hintText;
  final String? title;
  final String? inaialValue;

  Function(String date) onTap;

  DateTimeTextFieldPicker({
    this.hintText,
    this.inaialValue,
    this.title,
    required this.onTap,
  });
  String? text;
  @override
  Widget build(BuildContext context) {
    text = inaialValue;
    print(inaialValue);
    print("jjkjkjkjk");
    return StatefulBuilder(builder: (context, setState) {
      return InkWell(
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );

          if (pickedDate != null) {
            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (pickedTime != null) {
              final DateTime fullDateTime = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              );

              text = DateFormatter.formatDate(
                  fullDateTime, DateFormatter.DATE_TIME_UIF,
                  local: "en");

              String date = DateFormatter.formatDate(
                  fullDateTime, DateFormatter.TIME_STAMP,
                  local: "en");
              setState(() {});
              onTap(date);
            }
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if(title != null) ...[
              Text(
                title ?? '',
                style:  kTextMedium.copyWith(fontSize: 14, color: kPrimary),
              ),
              SizedBox(
                height:5,
              ),
        ],
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration:
                  Decorations.decorationTabBarView(  radius: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppIcons.timeCalender, width: 20),
                  Text(
                    text ?? hintText ?? "",
                    style: kTextRegular.copyWith(color: kAlmostBlack, fontSize: 11),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined,
                      color: kPrimary, size: 15),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
