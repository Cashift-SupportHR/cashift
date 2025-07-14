import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../resources/colors.dart';

///  Created by harbey on 8/15/2023.
class RecordAttendanceScanItem extends BaseStatelessWidget {
  final bool isActive;
  final bool passed;
  final String? icon;
  final String? title;
  final String? description;
  final Function()? onPressed;
  final Widget? button;
  final Widget? childDescription;
  final double sizedBoxWidth;

  RecordAttendanceScanItem({
    Key? key,
    this.isActive = false,
    this.passed = false,
    this.icon,
    this.title,
    this.button,
    this.description,
    this.onPressed,
    this.childDescription,
    this.sizedBoxWidth = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsetsDirectional.only(bottom: 12),
      decoration: Decorations.shapeDecorationBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null) kLoadSvgInCirclePath(icon!),
              SizedBox(width: sizedBoxWidth),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title ?? '',
                      style: kTextBold.copyWith(
                          fontSize: 14, color: isActive ? kPrimary : kGray_92),
                    ),
                  if (description != null) ...[
                    SizedBox(height: 8),
                    Text(
                      description ?? '',
                      style: passed
                          ? kTextMedium
                          : kTextRegular.copyWith(
                              fontSize: 14,
                              color: isActive ? kBlack : kGray_AC),
                    )
                  ]
                ],
              )),
            ],
          ),
          if (childDescription == null) ...[
            SizedBox(height: 16),
            SizedBox(
              width: 100,
              height: 30,
              child: button != null
                  ? button
                  : AppCupertinoButton(
                      text: strings.scan,
                      textStyle:
                          kTextBold.copyWith(fontSize: 12, color: kWhite),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        print('onPressedonPressed');
                        onPressed!();
                      },
                    ),
            ),
          ] else ...[
            childDescription!,
          ]
        ],
      ),
    );
  }
}
