import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/texts/icon_double_text.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 8/5/2023.
class TextValue extends StatelessWidget {
  final String text;
  final String value;
  final TextStyle? textStyle;
  final TextStyle? valueStyle;
  final bool isExpanded;
  final int flex;
  final CrossAxisAlignment crossAxisAlignment;
  final double? spaceHoriz;


  const TextValue({
    Key? key,
    required this.text,
    required this.value,
    this.textStyle,
    this.valueStyle,
    this.isExpanded = true,
    this.flex = 0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spaceHoriz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (isExpanded) ...[
          Expanded(flex: 2 + flex, child: buildTitle(text)),
          SizedBox(width: spaceHoriz ?? 0),
          buildValue(value, 5),
        ] else ...[
          buildTitle(text),
          SizedBox(width: spaceHoriz ?? 8),
          buildValue(value, 1)
        ],
      ],
    );
  }

  Widget buildTitle(String title) {
    return Text(text, style: textStyle ?? kTextSemiBold.copyWith(color: kPrimaryDark));
  }

  Widget buildValue(String value, int flex) {
    return Expanded(
      flex: flex,
      child: Text(value, style: valueStyle ?? kTextLabel.copyWith(color: kBattleShipGrey, fontSize: 14)),
    );
  }
}
