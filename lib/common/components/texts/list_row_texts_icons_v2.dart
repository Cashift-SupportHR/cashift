import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/texts/icon_double_text.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

class ListRowTextsIconsV2 extends StatelessWidget {
  final List<ListRowTextItem> items;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final bool isExpanded;
  final bool isMark;
  final EdgeInsetsGeometry? padding;
  final int flex;
  final CrossAxisAlignment crossAxisAlignment;
  final int? maxLines;
  final double? iconSize;
  final EdgeInsetsGeometry? paddingItem;
  final Color? iconColor;

  const ListRowTextsIconsV2({
    Key? key,
    required this.items,
    this.titleStyle,
    this.valueStyle,
    this.isExpanded = true,
    this.isMark = false,
    this.padding,
    this.iconColor,
    this.flex = 3,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.maxLines,
    this.iconSize,
    this.paddingItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
        this.titleStyle ?? kTextBold.copyWith(fontSize: 12, color: kPrimary);
    TextStyle valueStyle =
        this.valueStyle ?? kTextMedium.copyWith(fontSize: 12, color: kGreen_4E);
    return SingleChildScrollView(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: items
            .map((e) => isExpanded
                ? IconDoubleTextExpanded(
                    flexValue: flex,
                    icon: e.icon ?? '',
                    iconColor: iconColor,
                    name: isMark ? '${e.title} :' : e.title,
                    value: e.value,
                    nameStyle: titleStyle,
                    valueStyle: valueStyle,
                    valueWidget: e.valueWidget,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    maxLines: maxLines,
                    iconSize: iconSize,
                  )
                : IconDoubleText(
                    icon: e.icon ?? '',
                    iconColor: iconColor,
                    name: isMark ? '${e.title} :' : e.title,
                    value: e.value,
                    valueWidget: e.valueWidget,
                    nameStyle: titleStyle,
                    valueStyle: valueStyle,
                    padding: paddingItem,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    iconSize: iconSize,
                  ))
            .toList(),
      ),
    );
  }
}

class ListRowTextItem {
  String? icon;
  final String title;
    String ?value;
    Widget? valueWidget;

  ListRowTextItem({this.valueWidget, this.icon, required this.title,   this.value});
}
