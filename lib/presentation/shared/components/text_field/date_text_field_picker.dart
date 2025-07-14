import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/utils/app_icons.dart';
import 'package:shiftapp/utils/app_utils.dart';

import 'build_text_field_item.dart';

///  Created by harbey on 8/8/2023.
class DateTextFieldPicker extends StatelessWidget {
  final String? title;
  final String? initValue;
  final String? hintText;
  final String? pattern;

  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final IconData? suffixIcon;

  final Function(String)? onChanged;

  DateTextFieldPicker(
      {this.title,
      this.hintText,
      this.initValue,
      this.controller,
      this.onChanged,
      this.pattern,
      this.suffixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        this.controller ?? TextEditingController();
    return BuildTextFieldItem(
      title: title,
      hintText: hintText,
      endIcon: AppIcons.calendarOutline,
      controller: controller,
      validator: validator,
      onChanged: (value) => onChanged!(value),
      onTap: () {
        AppUtils.showDateTimePicker(context, onConfirm: (date) {
          controller.text = DateFormatter.formatDate(
              date, pattern ?? DateFormatter.DATE_TIME_UI,
              local: "en");
        });
      },
    );
  }
}
