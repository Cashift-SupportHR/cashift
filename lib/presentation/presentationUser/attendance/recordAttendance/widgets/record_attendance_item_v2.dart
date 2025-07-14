import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../resources/colors.dart';

///  Created by harbey on 8/23/2023.
class RecordAttendanceItemV2 extends BaseStatelessWidget {
  final String icon;
  final String title;
  final String description;
  final Function()? onPressed;

  RecordAttendanceItemV2({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          kLoadSvgInCirclePath(icon, height: 120, width: 120),
          SizedBox(height: 25),
          Text(
            title ?? '',
            style: kTextSemiBold.copyWith(
                fontSize: 26, color:kBlack_1E),
          ),
          SizedBox(height: 10),
          Text(
            description ?? '',
            style: kTextRegular.copyWith(
                fontSize: 16,
                color: kBlack_45),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          AppCupertinoButton(
            text: strings.scan,
            radius: BorderRadius.circular(6),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
