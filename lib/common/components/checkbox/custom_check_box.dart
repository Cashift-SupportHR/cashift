import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 9/8/2023.
class CustomCheckBox extends StatelessWidget {
  final bool? value;
  final String? title;
  final Widget? titleWidget;
  final double? fontSize;
  final Color? color;
  final Color? checkColor;
  final TextStyle? textStyle;
  final Function(bool?)? onChanged;

  const CustomCheckBox({Key? key, this.value, this.title, this.fontSize, this.color, this.textStyle,  this.onChanged, this.titleWidget, this.checkColor,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool value = this.value ?? false;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        StatefulBuilder(
          builder: (context, setSate) {
            return SizedBox(
              child: Checkbox(
                value: value,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              //  fillColor: MaterialStateProperty.all<Color>(checkColor ?? kSteal),
                activeColor: checkColor ?? kSteal,
                visualDensity: VisualDensity.standard,
                onChanged: (newValue){
                  value = newValue ?? false;
                  onChanged!(value);
                  setSate(() {});
                },
              ),
            );
          }
        ),
        if(title != null || titleWidget != null)
        Expanded(
          child: titleWidget ?? Text(
            title ?? '',
            style: textStyle ?? kTextMedium.copyWith(color: color ?? kSteal, fontSize: fontSize ?? 14),
          ),
        ),
      ],
    );
  }
}
