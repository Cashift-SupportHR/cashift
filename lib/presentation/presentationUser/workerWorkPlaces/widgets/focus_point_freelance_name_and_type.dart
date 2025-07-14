import 'package:flutter/material.dart';

import '../../../../common/components/divider/divider_vertical.dart';
import '../../resources/constants.dart';

class FocusPointFreelanceNameAndType extends StatelessWidget {
  final String freelanceName;
  final String type;
  final TextStyle? styleName;
  final TextStyle? styleType;

  const FocusPointFreelanceNameAndType({Key? key, required this.freelanceName, required this.type, this.styleName, this.styleType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(freelanceName,
            style: styleName ?? kTextSemiBold.copyWith(fontSize: 18)),
        const DividerVertical(),
        Text(type,
            style: styleType ?? kTextMedium.copyWith(fontSize: 14)),
      ],
    );
  }
}
