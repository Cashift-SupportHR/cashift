import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/texts/row_rich_texts.dart';
import 'package:shiftapp/presentation/shared/components/underline_widget.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../domain/entities/shared/date_formatter.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/circular_percent_widget.dart';
import '../../../shared/components/curancy_widget.dart';
import '../../../shared/components/decorations/decorations.dart';
import '../../../shared/components/texts/icon_double_text.dart';
import '../../../shared/components/texts/list_row_texts_icons_v2.dart';
import '../../shared/domain/entities/opportunities/OpportunityDetailsData.dart';
import '../applied_details/pages/Applicants/applied_page.dart';
import 'applied_opportunity_details_widget.dart';

class OpportunityDetailsWidget extends BaseStatelessWidget {
  final OpportunityDetailsData opportunityDetails;

  OpportunityDetailsWidget({Key? key, required this.opportunityDetails})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // I use column and IntrinsicHeight to make the widget Container suitable size with the content
    return SingleChildScrollView(
      child: Column(
        children: [
          IntrinsicHeight(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: Decorations.shapeDecoration(
                radius: 12,
                color: kBackground,
              ),
              child: Column(
                children: [
                  ListRowTextsIconsV2(
                    isMark: true,
                    iconSize: 18,
                    // iconColor: kPrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 14,
                    ),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    items: getListData(context),
                  ),

                  footer(),
                ],
              ),
            ),
          ),
          AppliedOpportunityDatailsWidget(
            opportunityDetails: opportunityDetails,
          ),
        ],
      ),
    );
  }

  List<ListRowTextItem> getListData(BuildContext context) {
    return [
      ListRowTextItem(
        icon: AppIcons.bagSquareOutline,
        title: strings.job,
        value: opportunityDetails.jobName ?? '-',
      ),
      ListRowTextItem(
        icon: AppIcons.workingPeriodOutline,
        title: strings.working_hours2,
        value: opportunityDetails.workingHours.toString() ?? '-',
      ),
      ListRowTextItem(
        icon: AppIcons.opportunityValue,
        title: strings.opportunity_value,
        valueWidget: Expanded(
          flex: 3,
          child: CurancyWidget(
            valuePrice: opportunityDetails.salaries.toString(),
          ),
        ),
      ),
      ListRowTextItem(
        icon: AppIcons.startTime1,
        title: strings.beginning_work,
        value: getDate(opportunityDetails.startShiftDate ?? '-'),
      ),
      ListRowTextItem(
        icon: AppIcons.endTime1,
        title: strings.end_work,
        value: getDate(opportunityDetails.endShiftDate ?? '-'),
      ),
      ListRowTextItem(
        icon: AppIcons.star,
        title: strings.opportunity_classification,
        value:
            opportunityDetails.completeFreeLanceInfoByCompanyAprovelLevelName ??
            '-',
      ),
    ];
  }

  String getDate(String date) {
    return DateFormatter.formatDateString(
      date,
      DateFormatter.DAY_MONTH_YEAR,
      DateFormatter.WORKING_DATE_TIME_UI,
    );
  }

  Widget footer() {
    TextStyle titleStyle = kTextSemiBold.copyWith(
      fontSize: 20,
      color: kPrimary,
    );
    TextStyle subTitleStyle = kTextSemiBold.copyWith(
      fontSize: 24,
      color: kRateBarIconColor,
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: Decorations.bottomRadius(color: kGreen_f4),
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
            child: VerticalDivider(color: kGray_C6),
          ),
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
