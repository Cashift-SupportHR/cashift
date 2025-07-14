import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

///  Created by harbey on 7/16/2023.
class AppIconButton extends StatelessWidget {
  final Function()? onTap ;
  final String icon;
  final double? iconSize;
  final Color? iconColor;
  const AppIconButton({Key? key, this.onTap, required this.icon, this.iconSize, this.iconColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  InkWell(
      onTap: onTap,
      child:  kLoadSvgInCirclePath(
        icon,
        height: iconSize,
        width: iconSize,
        color: iconColor,
      ),
    );
  }
}
