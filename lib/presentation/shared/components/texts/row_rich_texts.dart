import 'package:flutter/material.dart';

import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';



class RowRichTexts extends StatelessWidget {
  final Widget? child;
  final Widget? subChild;
  final String? title1;
  final String? title2;
  final String? subTitle1;
  final String? subTitle2;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? paddingRow;
  const RowRichTexts({Key? key, this.child, this.subChild, this.title1,
    this.title2, this.subTitle1, this.subTitle2, this.titleStyle, this.subTitleStyle, this.padding, this.paddingRow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: child ?? CustomRichText(
              title: title1 ?? '',
              subTitle: subTitle1 ?? '',
              titleStyle: titleStyle,
              subTitleStyle: subTitleStyle,
              padding: paddingRow,
            ),
          ),
          Expanded(
            child: subChild ?? CustomRichText(
              title: title2 ?? '',
              subTitle: subTitle2 ?? '',
              titleStyle: titleStyle,
              subTitleStyle: subTitleStyle,
              padding: paddingRow,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final EdgeInsetsGeometry? padding;
  final bool isMark;
  const CustomRichText(
      {Key? key,
        required this.title,
        required this.subTitle,
        this.titleStyle,
        this.subTitleStyle,
        this.padding,
        this.isMark = true,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: RichText(
        text: TextSpan(
          text: '$title ${isMark ? ':\t\t' : ''}',
          style: titleStyle ??
              kTextMediumPrimary,
          children: [
            TextSpan(
              text: subTitle,
              style: subTitleStyle ??
                  kTextRegular.copyWith(color: kFontDark, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}