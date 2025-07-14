import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/texts/icon_double_text.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 7/23/2023.
class ListRowTextsIcons extends StatelessWidget {
  final List<String> icons;
  final List<String> titles;
  final List<String> values;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final bool isExpanded;
  final bool isMark;
  final EdgeInsetsGeometry? padding;
  final int flex;
  final CrossAxisAlignment crossAxisAlignment;
  final CrossAxisAlignment crossAxisAlignmentText;
  final int? maxLines;

  final Color? iconColor;
  const ListRowTextsIcons({
    Key? key,
    required this.icons,
    required this.titles,
    required this.values,
    this.titleStyle,
    this.iconColor,
    this.valueStyle,
    this.isExpanded = true,
    this.isMark = false,
    this.padding,
    this.flex = 3,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.crossAxisAlignmentText = CrossAxisAlignment.center,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = this.titleStyle ?? kTextBold.copyWith(fontSize: 12, color: kPrimary);
    TextStyle valueStyle = this.valueStyle ?? kTextMedium.copyWith(fontSize: 12, color: kGreen_4E);
    return SingleChildScrollView(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        // children: titles
        //     .map((e) => isExpanded
        //         ? IconDoubleTextExpanded(
        //             flexValue: flex,
        //             icon: icons[titles.indexOf(e)],
        //             name: isMark ? '$e :' : e,
        //             value: values[titles.indexOf(e)],
        //             nameStyle: titleStyle,
        //             valueStyle: valueStyle,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             maxLines: maxLines,
        //           )
        //         : IconDoubleText(
        //             icon: icons[titles.indexOf(e)],
        //             name: isMark ? '$e :' : e,
        //             value: values[titles.indexOf(e)],
        //             nameStyle: titleStyle,
        //             valueStyle: valueStyle,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //           ))
        //     .toList(),
        children: titles
            .map((e) => isExpanded
                ? IconDoubleTextExpanded(
                    flexValue: flex,
                    iconColor: iconColor ?? kPrimaryDark,
                    icon: icons[titles.indexOf(e)],
                    name: isMark ? '$e :' : e,
                    value: values[titles.indexOf(e)],
                    nameStyle: titleStyle,
                    valueStyle: valueStyle,
                    crossAxisAlignment: crossAxisAlignmentText,
                  )
                : IconDoubleText(
                    icon: icons[titles.indexOf(e)],
                    name: isMark ? '$e :' : e,
                    value: values[titles.indexOf(e)],
                    nameStyle: titleStyle,
                    valueStyle: valueStyle,
                    crossAxisAlignment: crossAxisAlignmentText,
                  ))
            .toList(),
      ),
    );
  }
}
