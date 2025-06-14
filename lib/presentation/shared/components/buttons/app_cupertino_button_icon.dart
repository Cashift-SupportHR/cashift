import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
class AppCupertinoButtonIcon extends StatelessWidget {
  final Function()? onPressed;
  final String ? text;
  final Widget ? child ;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? startIcon;
  final double? height;
  final bool ?  enable;
  final double? elevation;
  final EdgeInsetsGeometry? startIconPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? raduis;
  final String? icon;
  final double? iconSize;
  final Color? iconColor;

  const AppCupertinoButtonIcon(
      {this.onPressed,
         this.text,
        this.backgroundColor,
        this.textStyle,
        this.enable =true,
        this.startIcon,
        this.padding,
        this.margin,
        this.raduis,
        this.height,
        this.child ,
        this.startIconPadding,
        this.elevation,
        this.icon,
        this.iconSize,
        this.iconColor,
      }):assert(text == null || child == null, 'Cannot provide both a text and a child');

  @override
  Widget build(BuildContext context) {

    Color enabledColor = backgroundColor != null
        ? backgroundColor!
        : kPrimaryDark;

    return Padding(
      padding: margin != null ? margin! : const EdgeInsets.all(0),
      child: CupertinoButton(
        padding: padding ?? const EdgeInsets.all(12),
        borderRadius: raduis ?? BorderRadius.circular(20),
        onPressed: enable==true ? onPressed:null,
        minSize: height,

        disabledColor: kPrimary.withOpacity(0.5),
        color: enabledColor,
        child: child??_buildButton()
      ),
    );
  }
  Widget _buildButton(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: startIconPadding != null
              ? startIconPadding!
              : const EdgeInsetsDirectional.only(end: 8),
          child: startIcon ?? kLoadSvgInCirclePath(icon ?? '', color: iconColor, height: iconSize, width: iconSize),
        ),
        Text(
          text??'',
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: textStyle ?? kButtonTextStyle,
        ),
      ],
    );
  }
}
