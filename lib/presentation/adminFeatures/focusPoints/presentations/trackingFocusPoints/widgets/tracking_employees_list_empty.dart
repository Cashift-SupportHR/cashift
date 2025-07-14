import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../../utils/app_icons.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';

///  Created by harbey on 5/31/2023.
class TrackingEmployeesListEmpty extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        kLoadSvgInCirclePath(
         AppIcons.trackingEmployeesListEmpty,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          strings.there_no_employees,
          style: kTextBold.copyWith(
            fontSize: 10,
            color: kBlack.withOpacity(0.2),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
  // emp
}
