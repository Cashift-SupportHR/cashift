import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 7/16/2023.
class IconTextButton extends StatelessWidget {
  final String ?text ;
  final Function()? onTap ;
  final Widget? child;
  final Color ? textColor ;
  final TextStyle? textStyle;
  final double? fontSize;
  final String icon;
  final double? iconSize;
  final Color? iconColor;
  final MainAxisAlignment? mainAxisAlignment;
  final Widget? customIcon;
  final bool? isFlexible;
  final EdgeInsetsGeometry? padding;
  const IconTextButton({Key? key, this.text, this.onTap, this.child, this.fontSize, this.textColor, this.textStyle, required this.icon, this.iconSize, this.iconColor, this.mainAxisAlignment, this.customIcon, this.isFlexible = false, this.padding}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            customIcon ?? kLoadSvgInCirclePath(
              icon,
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            const SizedBox(
              width: 8,
            ),
            isFlexible! ? Flexible(
              fit: FlexFit.loose,
              child: _buildText(),
            ) : _buildText(),
          ],
        ),
      ),
    );
  }
  Widget _buildText() {
    return Text(text!,
        style: textStyle ?? kTextRegular.copyWith(
          color: textColor ?? kBlack_67,
          fontSize: fontSize ?? 12,
        ));
  }
}
