import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/texts/text_value.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 7/23/2023.
class ListRowTexts extends StatelessWidget {
  final List<String> titles;
  final List<String> values;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final bool isExpanded;
  final bool isMark;
  final EdgeInsetsGeometry? padding;
  final int flex;
  final CrossAxisAlignment crossAxisAlignment;
  final double spaceVert;
  final bool isHideEmptyValue;
  final double? spaceHoriz;

  const ListRowTexts({
    Key? key,
    required this.titles,
    required this.values,
    this.titleStyle,
    this.valueStyle,
    this.isExpanded = true,
    this.isMark = true,
    this.padding,
    this.flex = 0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spaceVert = 8.0,
    this.isHideEmptyValue = false,
    this.spaceHoriz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: titles
            .map((e) => isHideEmptyValue
                ? (values[titles.indexOf(e)].isEmpty
                    ? SizedBox.shrink()
                    : buildText(e))
                : buildText(e))
            .toList(),
      ),
    );
  }

  Widget buildText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: spaceVert),
      child: TextValue(
        text: isMark ? '$text :' : text,
        value: values[titles.indexOf(text)],
        isExpanded: isExpanded,
        spaceHoriz: spaceHoriz,
        flex: flex,
        crossAxisAlignment: crossAxisAlignment,
        textStyle:
            titleStyle ?? kTextMedium.copyWith(fontSize: 12, color: kGreen_55),
        valueStyle:
            valueStyle ?? kTextMedium.copyWith(fontSize: 12, color: kGreen_85),
      ),
    );
  }
}
