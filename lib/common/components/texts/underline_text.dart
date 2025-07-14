import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../underline_widget.dart';

///  Created by harbey on 5/11/2023.
class UnderlineText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double? fontSize;
  const UnderlineText({Key? key, required this.text, this.textStyle, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyle ?? kTextBold.copyWith(
            color: kPrimary,
            fontSize: fontSize ?? 18,
          ),
        ),
        const UnderlineWidget(),
      ],
    );
  }
}
