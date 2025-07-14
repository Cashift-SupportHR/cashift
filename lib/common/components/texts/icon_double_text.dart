import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../image_builder.dart';

///  Created by harbey on 5/8/2023.
class IconDoubleText extends StatelessWidget {
  final String icon;
  final Color? iconColor;
  final String name;
  final TextStyle? nameStyle;
  final String? value;
  final TextStyle? valueStyle;
  final Widget? valueWidget;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? isSizedBox;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;

  const IconDoubleText(
      {Key? key, required this.icon, required this.name, this.value, this.crossAxisAlignment, this.valueWidget, this.iconColor, this.nameStyle, this.valueStyle, this.isSizedBox, this.padding, this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kLoadSvgInCirclePath(
            icon,
            color: iconColor,
            height: iconSize ?? 20,
            width: iconSize ?? 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(name, style: nameStyle ?? kTextMedium.copyWith(color: kPrimary, fontSize: 12)),
          if (isSizedBox ?? true)
            const SizedBox(
              width: 5,
            ),
          valueWidget ??
              Flexible(
                child: Text(
                  value ?? '',
                  style: valueStyle ?? kTextRegular.copyWith(color: kBlack.withOpacity(0.8), fontSize: 12),
                ),
              ),
        ],
      ),
    );
  }
}

///  Created by harbey on 10/8/2023.
class IconDoubleTextExpanded extends StatelessWidget {
  final String icon;
  final Color? iconColor;
  final String name;
  final TextStyle? nameStyle;
  final String? value;
  final TextStyle? valueStyle;
  final Widget? valueWidget;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final int? maxLines;
  final int flexValue;
  final bool? isImage;

  const IconDoubleTextExpanded({
    Key? key,
    required this.icon,
    required this.name,
    this.value,
    this.maxLines,
    this.crossAxisAlignment,
    this.valueWidget,
    this.iconColor,
    this.nameStyle,
    this.valueStyle,
    this.padding,
    this.iconSize,
    this.flexValue = 3,
    this.isImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
              children: [
                isImage ?? false
                    ? kBuildImage(
                        icon,
                        border: 0,
                        size: iconSize ?? 20,
                      )
                    : Expanded(
                      child: kLoadSvgInCirclePath(
                          icon,
                          color: iconColor,
                          height: iconSize ?? 20,
                          width: iconSize ?? 20,
                        ),
                    ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 4,
                  child: Text(name, maxLines: maxLines , style: nameStyle ?? kTextMedium.copyWith(color: kPrimary, fontSize: 12, overflow: TextOverflow.ellipsis)),
                ),
              ],
            ),
          ),
          valueWidget ??
              Expanded(
                flex: flexValue,
                child: Text(
                  value ?? '',
                  maxLines: maxLines,
                  style: valueStyle ?? kTextRegular.copyWith(color: kBlack.withOpacity(0.8), fontSize: 12, overflow: TextOverflow.ellipsis),
                ),
              ),
        ],
      ),
    );
  }
}

class IconDoubleTextFixedBox extends StatelessWidget {
  final String icon;
  final int? maxLine;
  final Color? iconColor;
  final String name;
  final TextStyle? nameStyle;
  final String? value;
  final TextStyle? valueStyle;
  final Widget? valueWidget;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final int flexValue;
  final bool? isImage;

  const IconDoubleTextFixedBox({
    Key? key,
    required this.icon,
    required this.name,
    this.value,
    this.maxLine,
    this.crossAxisAlignment,
    this.valueWidget,
    this.iconColor,
    this.nameStyle,
    this.valueStyle,
    this.padding,
    this.iconSize,
    this.flexValue = 3,
    this.isImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
      child: FittedBox(
        child: Row(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          children: [
            isImage ?? false
                ? kBuildImage(
                    icon,
                    border: 0,
                    size: iconSize ?? 20,
                  )
                : kLoadSvgInCirclePath(
                    icon,
                    color: iconColor,
                    height: iconSize ?? 20,
                    width: iconSize ?? 20,
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(name + ':\t\t', maxLines: maxLine ?? 1, style: nameStyle ?? kTextMedium.copyWith(color: kPrimary, fontSize: 12, overflow: TextOverflow.ellipsis)),
                  valueWidget ??
                      FittedBox(
                        child: Text(
                          value ?? '',
                          maxLines: maxLine ?? 1,
                          style: valueStyle ?? kTextRegular.copyWith(color: kBlack.withOpacity(0.8), fontSize: 12, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
