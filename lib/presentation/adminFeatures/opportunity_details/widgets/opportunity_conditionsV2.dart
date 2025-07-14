import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/texts/list_row_texts.dart';

import '../../../presentationUser/resources/constants.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../../../common/components/texts/list_row_texts_icons_v2.dart';
import '../../../../common/components/texts/list_row_texts_v2.dart';
import '../../../../common/components/texts/row_rich_texts.dart';
import '../../shared/domain/entities/opportunities/OpportunityDetailsData.dart';

class OpportunityConditionsWidget extends BaseStatelessWidget {
  final OpportunityDetailsData opportunityDetails;

  OpportunityConditionsWidget({required this.opportunityDetails});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
           decoration: Decorations.shapeDecoration(radius: 10, color: kBackground),
          child: Column(
            children: [
              ListRowTextsV2(
                spaceHoriz: 5,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                titleStyle: kTextMedium.copyWith(fontSize: 14, color: kPrimaryDark),
                valueStyle: kTextMedium.copyWith(fontSize: 12, color: kGreen_69),
                spaceVert: 15,
                flex: 3,
                items: [
                  ListRowTextItem(
                    title: '•  ' + strings.project_name,
                    value: opportunityDetails.projectName ?? '',
                  ),
                  ListRowTextItem(
                    title: '•  ' + strings.attendance_method,
                    value: opportunityDetails.registerAttendance ?? '',
                  ),
                  ListRowTextItem(
                    title: '•  ' + strings.date_create,
                    value: opportunityDetails.addedDate ?? '',
                  ),
                  ListRowTextItem(
                    title: '•  ' + strings.beginning_work,
                    value: opportunityDetails.startShiftDate ?? '',
                  ),
                  ListRowTextItem(
                    title: '•  ' + strings.end_work,
                    value: opportunityDetails.endShiftDate ?? '',
                  ),
                ],
              ),
              footer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget footer() {
    TextStyle titleStyle = kTextSemiBold.copyWith(fontSize: 20, color: kPrimary);
    TextStyle subTitleStyle = kTextSemiBold.copyWith(fontSize: 24, color: kRateBarIconColor);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: Decorations.bottomRadius(color: kGreen_f4,  radius: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomRichText(
            title: strings.required_number,
            subTitle: opportunityDetails.requiredCount.toString() ?? '',
            titleStyle: titleStyle,
            subTitleStyle: subTitleStyle,
          ),
          SizedBox(
              width: 1,
              height: 20,
              child: VerticalDivider(
                color: kGray_C6,
              )),
          CustomRichText(
            title: strings.remaining_number,
            subTitle: opportunityDetails.actualNumber.toString() ?? '',
            titleStyle: titleStyle,
            subTitleStyle: subTitleStyle,
          ),
        ],
      ),
    );
  }
}
