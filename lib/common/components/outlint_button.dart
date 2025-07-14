import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

class AppOutlineButton extends StatelessWidget {
  final String? text;
  final Function()? onClick;
  final Widget? child;
  final double? borderWidth;
  final double? radius;
  final Color? textColor;
  final Color? strokeColor;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  const AppOutlineButton(
      {Key? key,
      this.radius,
      this.borderWidth,
      this.height,
      this.width,
      this.text,
      this.onClick,
      this.child,
      this.padding,
      this.strokeColor,
      this.textColor,
      this.textStyle,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enable = onClick != null;
    final defaultStrok =enable ?   kPrimaryDark :kPrimaryDark.withOpacity(0.3);
    final defaultFontColor =enable ?   kFontDark :kFontDark.withOpacity(0.5);
    return OutlinedButton(
      onPressed: onClick,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(kPrimary.withOpacity(0.4)),
        textStyle: MaterialStateProperty.all(textStyle ?? kTextLabelFontDark),
        padding:MaterialStateProperty.all(padding??EdgeInsets.all(10)),
        side: MaterialStateProperty.all(BorderSide(color: strokeColor?? defaultStrok,width: borderWidth ?? 1.5)),
        minimumSize: MaterialStateProperty.all(Size(width ?? 100, height ?? 30)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 8.0),)),
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? Colors.transparent),
      ),
      child: child == null
          ? Text(
              text!,
              style: textStyle ?? kTextMedium.copyWith(fontSize: 14, color: textColor ?? defaultFontColor),
            )
          : child!,
    );
  }
}
