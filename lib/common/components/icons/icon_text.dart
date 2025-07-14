import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../image_builder.dart';

class IconText extends StatelessWidget {
  final String text;
  final String? icon;
  final TextStyle? textStyle;
  final double? iconSize;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? isExpanded;
  final double? sizedBoxWidth;
  final bool? isIconLift;
  final bool isImage;
  final IconData? iconData;
  final bool isIconData;

  IconText({
    Key? key,
    required this.text,
    this.icon,
    this.textStyle,
    this.iconSize,
    this.iconColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.mainAxisAlignment,
    this.isExpanded,
    this.crossAxisAlignment,
    this.sizedBoxWidth,
    this.isIconLift = false,
    this.isImage = false,
    this.iconData,
    this.isIconData = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsetsDirectional.zero,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          isIconLift ?? false
              ? isExpanded ?? false
                  ? buildExpandedText()
                  : buildText()
              : buildIconOrImage(),
          SizedBox(
            width: sizedBoxWidth ?? 4,
          ),
          isIconLift ?? false
              ? buildIconOrImage()
              : isExpanded ?? false
                  ? buildExpandedText()
                  : buildText(),
        ],
      ),
    );
  }

  Widget buildText() => Text(text,
      style: textStyle ??
          kTextBodyBold.copyWith(
            color: textColor ?? kPrimary,
            fontSize: fontSize ?? 14,
          ));

  Widget buildExpandedText() => Expanded(
        child: Text(text,
            style: textStyle ??
                kTextBodyBold.copyWith(
                  color: textColor ?? kPrimary,
                  fontSize: fontSize ?? 14,
                )),
      );
  final langCode = Get.locale?.languageCode;
  Widget buildIconOrImage() => isImage
      ? kBuildImageFixedSize(icon ?? '',
          border: 0, height: iconSize, width: iconSize)
      : isIconData
          ? Icon(iconData, size: iconSize, color: iconColor)
          : langCode == "en"
              ? RotationTransition(
                  turns: AlwaysStoppedAnimation(180 / 360),
                  child: kLoadSvgInCirclePath(
                    icon ?? '',
                    height: iconSize,
                    width: iconSize,
                    color: iconColor,
                  ),
                )
              : kLoadSvgInCirclePath(
                  icon ?? '',
                  height: iconSize,
                  width: iconSize,
                  color: iconColor,
                );
}
