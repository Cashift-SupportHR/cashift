import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 7/11/2023.
class CustomRadioList extends StatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  final String title;
  final int? id;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final Color? color;

  const CustomRadioList({
    Key? key,
    required this.value,
    this.id,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.titleStyle,
    this.subTitle,
    this.subTitleStyle,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
              value: value,
              groupValue: groupValue,
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              onChanged: onChanged,
            ),
            Expanded(
              child: Text(
                title,
                style: titleStyle ?? kTextMedium.copyWith(color: color ?? kPrimary, fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(width: 4),
        if (subTitle != null)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 32),
            child: Text(
              subTitle ?? '',
              style: subTitleStyle ?? kTextMedium.copyWith(color: kGreen_72, fontSize: 10),
            ),
          ),
      ],
    );
  }
}
