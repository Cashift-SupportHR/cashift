import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../core/utils/app_icons.dart';
import '../decorations/decorations.dart';
import '../image_builder.dart';

///  Created by harbey on 5/21/2023.
class CompleteStepperWidget extends StatelessWidget {
  final Color? color;
  const CompleteStepperWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: Decorations.boxDecorationBorderShape(
          color: color ?? kPrimary,
          borderColor: color ?? kPrimary,
          borderWidth: 0.5
      ),
      child: kLoadSvgInCirclePath(
        AppIcons.done,
        color: kWhite,
        height: 20,
        width: 20,
      ),
    );
  }
}
