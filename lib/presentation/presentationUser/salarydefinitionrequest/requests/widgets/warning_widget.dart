import 'package:flutter/material.dart';

import '../../../../../core/utils/app_icons.dart';
import '../../../../shared/components/image_builder.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class WarningWidget extends StatelessWidget {
  final String warningText;
  final Color? color;
  final double? iconSize;
  final EdgeInsetsGeometry? margin;
  final Widget? leading;
  final EdgeInsetsGeometry? padding;
  final String? textClick;
  Function()? onTap;
  final String? iconPath;
  final int? maxLines;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsetsGeometry? paddingTitles;
  WarningWidget({Key? key, this.textClick, this.iconPath, this.onTap, required this.warningText, this.color, this.iconSize, this.margin, this.leading, this.padding, this.maxLines, this.backgroundColor, this.textStyle, this.crossAxisAlignment, this.paddingTitles}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin ?? const EdgeInsetsDirectional.only(end: 10, top: 16, bottom: 10),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: backgroundColor ?? color?.withOpacity(0.05) ?? kRed_2.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          leading ?? Padding(
            padding: const EdgeInsetsDirectional.only(top: 2),
            child: kLoadSvgInCirclePath(iconPath ?? AppIcons.warning, height: iconSize ?? 15, width: iconSize ?? 15, color: color),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Padding(
              padding: paddingTitles ?? EdgeInsets.zero,
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      warningText,
                      maxLines: maxLines,
                      style: textStyle ?? kTextRegular.copyWith(
                        color: color ?? kRed_2,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  textClick == null
                      ? SizedBox()
                      : InkWell(
                          onTap: onTap,
                          child: Text(
                            textClick!,
                            style: kTextSemiBold.copyWith(
                              color: kOrange,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
