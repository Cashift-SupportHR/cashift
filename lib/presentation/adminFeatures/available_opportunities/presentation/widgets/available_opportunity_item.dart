import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity_constants.dart';
import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/column_texts.dart';
import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/work_dates.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/pages/opportunity_details_page.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/outlint_button.dart';
import 'package:shiftapp/common/components/shapes/rounded_shape.dart';
import 'package:shiftapp/common/components/underline_widget.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../core/services/routes.dart';
import '../addopportunityemployee/pages/add_employee_for_opportunity_page.dart';


class AvailableOpportunityItem extends BaseStatelessWidget {
  final Opportunity opportunity;
  final Function()? onNavigatorToEdit;
  final Function()? onRefresh;
  final int index;
  AvailableOpportunityItem({Key? key, required this.opportunity, required this.index, this.onNavigatorToEdit, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kGrey_9B),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Card(
                  shadowColor: kPrimaryDark,
                  margin: const EdgeInsets.all(2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: kBuildImage(
                    opportunity.logoPath ?? '',
                    size: 50,
                    border: 0.0,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        opportunity.companyName ?? '',
                        style: kTextMedium.copyWith(color: kFontDark, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          kLoadSvgInCirclePath(AppIcons.mainJob, height: 20, width: 15),
                          const SizedBox(width: 5),
                          Text(
                            opportunity.jobName!,
                            style: kTextLabelNormal.copyWith(
                              fontSize: 12,
                              color: kGreen_9B,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                RoundedShape(
                  width: 80,
                  height: 28,
                  radius: 8,
                  color: kPrimary.withOpacity(0.10),
                  child: Text(
                    '${opportunity.requiredCount}  ${strings.remaining}  ${opportunity.actualNumber} ',
                    style: kTextMedium.copyWith(fontSize: 10, color: kPrimary),
                  ),
                ),
              ],
            ),
          ),
          CountPeople(opportunity: opportunity),
          WorkDates(opportunity: opportunity),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16, top: 8),
            child: Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    onClick: () {
                      navigatorToDetails(context);
                    },
                    child: Text(
                      strings.show_details,
                      style: kTextSemiBold.copyWith(color: kPrimary),
                    ),
                    radius: 6,
                    borderWidth: 0.9,
                    strokeColor: kPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                  ),
                ),
                checkStatusOpportunity(index),
              ],
            ),
          ),
        ],
      ),
    );
  }

  navigatorToDetails(BuildContext context) async {
    final result = await Navigator.pushNamed(context, Routes.opportunityDetails,
        arguments: OpportunityDetailsPageArgs(
          opportunity: opportunity,
          isShowButtonsAction: (index == 0 || index == 1) ? true : false,
          onRefreshOpportunities: onRefresh,
        ));
    if (result == true) {
      onRefresh!();
    }
  }

  Widget checkStatusOpportunity(int opportunityStatus) {
    if (opportunityStatus == OpportunityStatus.todayOpportunity || opportunityStatus == OpportunityStatus.activeOpportunity) {
      return BuildPopupMenuButton(opportunity: opportunity, onRefresh: onRefresh, onNavigatorToEdit: onNavigatorToEdit);
    } else if (opportunityStatus == OpportunityStatus.expiredOpportunity) {
      return AddEmployeeButton(opportunityId: opportunity.id!);
    } else {
      return const SizedBox();
    }
  }
}

class AddEmployeeButton extends BaseStatelessWidget {
  final int opportunityId;
  AddEmployeeButton({Key? key, required this.opportunityId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAppModalBottomSheet(
          context: context,
          isScrollControlled: true,
          title: strings.add_employee_on_opportunity,
          isDivider: false,
          titleWidget: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.add_employee_on_opportunity,
                  style: kTextBold.copyWith(color: kPrimary),
                ),
                const UnderlineWidget(),
              ],
            ),
          ),
          child: AddEmployeeForOpportunityPage(opportunityId: opportunityId),
        );
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 16),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromRGBO(30, 134, 111, 0.65), width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  kLoadSvgInCirclePath(AppIcons.job),
                  const Icon(
                    Icons.add_circle,
                    color: kRed,
                    size: 12,
                  ),
                ],
              ),
            ),
            Text(
              strings.add_applicant,
              style: kTextRegular.copyWith(color: kBattleShipGrey, fontSize: 6),
            ),
          ],
        ),
      ),
    );
  }
}

class CountPeople extends BaseStatelessWidget {
  final Opportunity opportunity;
  CountPeople({Key? key, required this.opportunity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ColumnTexts(
          title: strings.wanted_number,
          subtitle: opportunity.requiredCount?.toString() ?? '0',
        ),
        ColumnTexts(
          title: strings.num_accepted,
          subtitle: opportunity.numberAccepted?.toString() ?? '0',
        ),
        ColumnTexts(
          title: strings.num_reserve,
          subtitle: opportunity.reserveNumber?.toString() ?? '0',
          isDivider: false,
        ),
      ],
    );
  }
}
