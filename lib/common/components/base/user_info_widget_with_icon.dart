import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/user_info_widget.dart';
import 'package:shiftapp/common/components/icons/icon_text.dart';

import '../../../utils/app_icons.dart';
import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 7/31/2023.
class UserInfoWidgetWithIcon extends StatelessWidget {
  final String image;
  final String name;
  final String? phone;
  final String? email;
  final String? job;
  final double imageSize;
  final double space;

  const UserInfoWidgetWithIcon({
    Key? key,
    required this.image,
    required this.name,
    this.phone,
    this.email,
    this.job,
    this.space = 2,
    this.imageSize = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserInfoWidget(
      image: image,
      imageSize: imageSize,
      name: name,
      nameStyle: kTextBold.copyWith(fontSize: 14, color: kBlack_3C),
      subTitleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (job != null && job!.isNotEmpty)
            iconText(
              text: job ?? "",
              icon: AppIcons.bag_work,
            ),
          if (phone != null)
            iconText(
              text: phone ?? "",
              icon: AppIcons.phone,
            ),
          if (email != null && email!.isNotEmpty)
            iconText(
              text: email ?? "",
              icon: AppIcons.email,
            ),
        ],
      ),
    );
  }

  Widget iconText(
      {String? text,
      String? icon,
      double? iconSize,
      double? space,
      TextStyle? textStyle}) {
    return IconText(
      text: text ?? "",
      isExpanded: true,
      padding: EdgeInsets.only(bottom: space ?? 2),
      crossAxisAlignment: CrossAxisAlignment.center,
      textStyle: textStyle ?? kTextRegular.copyWith(fontSize: 12, color: kGreen_7B),
      sizedBoxWidth: 10,
      icon: icon,
      iconSize: iconSize ?? 14,
    );
  }
}
