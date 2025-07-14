import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 6/20/2023.
class AppOutlineButtonIcon extends StatelessWidget {
  final String ?text ;
  final Function()? onClick ;
  final Widget? child ;
  final double ? borderWidth ;
  final double ? radius ;
  final Color ? textColor ;
  final Color ? strokeColor ;
  final double ? height ;
  final double ?width ;
  final EdgeInsetsGeometry  ? padding ;
  final EdgeInsetsGeometry  ? margin ;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final String icon;
  final double? iconSize;
  final Color? iconColor;
  const AppOutlineButtonIcon({Key? key,this.radius,this.borderWidth, this.height , this.width , this.text, this.onClick, this.child, this.padding, this.margin, this.strokeColor, this.textColor, this.textStyle, this.backgroundColor, required this.icon, this.iconSize, this.iconColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
      padding: margin ?? const EdgeInsets.all(0.0),
      child: OutlinedButton.icon(
        onPressed:onClick,
        icon: kLoadSvgInCirclePath(
            icon,
          color: iconColor,
          height: iconSize,
          width: iconSize,
        ),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(kPrimary.withOpacity(0.4)),
          textStyle: MaterialStateProperty.all(textStyle ?? kTextLabelFontDark),
          padding:MaterialStateProperty.all(padding??EdgeInsets.all(4)),
          side: MaterialStateProperty.all(BorderSide(color:strokeColor?? kPrimaryDark,width: borderWidth ?? 1.5)),
          minimumSize: MaterialStateProperty.all(Size(width ?? 100,height ?? 40)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 8.0),)),
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? Colors.transparent),
        ),
        label: child==null ?Text(text!, style: textStyle ?? kTextMedium.copyWith(fontSize: 14,color: textColor??kFontDark),):child!,

      ),
    );
  }
}
