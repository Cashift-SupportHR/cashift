import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/texts/text_value.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import 'list_row_texts_icons_v2.dart';

///  Created by harbey on 7/23/2023.
class ListRowTextsV2 extends StatelessWidget {
  final List<ListRowTextItem> items;
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

  const ListRowTextsV2({
    Key? key,
    required this.items,
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
        children: items
            .map((e) => isHideEmptyValue
                ? (e.title.isEmpty
                    ? SizedBox.shrink()
                    : buildText(e.title, e.value??""))
                : buildText(e.title,e.value??""))
            .toList(),
      ),
    );
  }

  Widget buildText(String text, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: spaceVert),
      child: TextValue(
        text: isMark ? '$text :' : text,
        value: value,
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
