import 'package:flutter/material.dart';

import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../image_builder.dart';

///  Created by harbey on 7/17/2023.
class UserInfoWidget extends StatelessWidget {
  final String image;
  final String name;
  final TextStyle? nameStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final Widget? subTitleWidget;
  final double imageSize;
  final Decoration? decoration;
  final double? border;
  final MainAxisAlignment? mainAxisAlignment;
  final double imageBorder;
  final Color? borderColor;
  const UserInfoWidget({
    Key? key,
    required this.image,
    required this.name,
    this.nameStyle,
    this.subTitle,
    this.subTitleStyle,
    this.subTitleWidget,
    this.imageSize = 60,
    this.decoration,
    this.border,
    this.mainAxisAlignment,
    this.imageBorder = 0,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        kBuildCircleImage(
          image,
          border: imageBorder,
          size: imageSize,
          decoration: decoration,
          borderColor: borderColor,
            showFullImage: true
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: nameStyle ?? kTextMedium.copyWith(fontSize: 14, color: kBlack_43),
              ),
              if (subTitleWidget != null || subTitle != null) ...[
                SizedBox(
                  height: 4,
                ),
                subTitleWidget ??
                    Text(
                      subTitle ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: subTitleStyle ?? kTextRegular.copyWith(fontSize: 12, color: kBlack_91),
                    ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
