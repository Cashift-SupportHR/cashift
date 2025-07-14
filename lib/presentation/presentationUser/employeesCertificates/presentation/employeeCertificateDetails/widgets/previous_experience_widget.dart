import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';

///  Created by harbey on 7/17/2023.
class PreviousExperienceWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: Decorations.shapeDecoration(radius: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.previous_experience,
            style: kTextRegular.copyWith(color: kRateBarIconColor, fontSize: 14),
          ),
          SizedBox(height: 14),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => _PreviousExperienceItem(),
          ),
        ],
      ),
    );
  }
}

class _PreviousExperienceItem extends StatelessWidget {
  const _PreviousExperienceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'خبره شهرين',
              textAlign: TextAlign.center,
              style: kTextRegular.copyWith(fontSize: 12, color: kBlack_91),
            ),
            SizedBox(height: 4),
            Text(
              'يناير 2023 - مارس 2023',
              textAlign: TextAlign.center,
              style: kTextRegular.copyWith(fontSize: 10, color: kBlack_91),
            ),
          ],
        ),
        SizedBox(width: 8),
        Column(
          children: [
            kBuildImage(
              'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
              border: 0,
              size: 30,
            ),
            SizedBox(
              height: 30,
              width: 1,
              child: VerticalDivider(
                color: kGrey_C9,
                width: 1,
                indent: 2,
                endIndent: 2,
              ),
            ),
          ],
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'شركه تضاريس نجد الامنيه',
              textAlign: TextAlign.center,
              style: kTextMedium.copyWith(fontSize: 12, color: kBlack_43),
            ),

            SizedBox(height: 4),
            Text(
              'مدير أمن لاماكن شحن البضائع',
              textAlign: TextAlign.center,
              style: kTextRegular.copyWith(fontSize: 10, color: kBlack_91),
            ),
          ],
        ),
      ],
    );
  }
}

