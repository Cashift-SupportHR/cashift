import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/widgets/job_details.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/buttons/row_buttons.dart';
import 'package:shiftapp/common/components/tabview/tab_bar_view_widget_line.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../presentationUser/appliedoffers/details/applied_offer_details_screen_v2.dart';
import '../../addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import '../../available_opportunities/presentation/widgets/cancel_opportunity_widget_builder.dart';
import '../../shared/domain/entities/opportunities/OpportunityDetailsData.dart';
import '../../shared/domain/entities/opportunities/opportunity.dart';

import '../widgets/opportunity_conditionsV2.dart';
import '../widgets/opportunity_details_data.dart';
import '../widgets/opportunity_details_header.dart';

class OpportunityDetailsScreenV2 extends BaseStatelessWidget {
  final OpportunityDetailsData opportunityDetails;
  final Opportunity opportunity;
  final Function() onNavigatorToEdit;
  final bool isShowButtonsAction;
  final Function() onRefreshOpportunityDetails;
  final Function()? onRefreshOpportunities;

  OpportunityDetailsScreenV2({
    Key? key,
    required this.opportunityDetails,
    required this.opportunity,
    required this.onNavigatorToEdit,
    this.isShowButtonsAction = true,
    required this.onRefreshOpportunityDetails,
    this.onRefreshOpportunities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Column(
      children: [
        OpportunityDetailsHeader(
          opportunityDetails: opportunityDetails,
        ),
        Expanded(
          child: TabBarViewWidgetLine(
            isShowCounter: false,
            onTabChange: (index, id) {},
            textStyle: kTextSemiBold.copyWith(fontSize: 20, color: kPrimary),
            tabs: [
              TabLineModel(
                id: 1,
                text: strings.opportunity_details,
              ),
              TabLineModel(
                id: 2,
                text: strings.opportunity_condition,
              ),
            ],
            children: [
              OpportunityDetailsWidget(
                opportunityDetails: opportunityDetails,
              ),
              OpportunityConditionsWidget(
                opportunityDetails: opportunityDetails,
              ),
            ],
          ),
        ),
        if (isShowButtonsAction)
          RowButtons(
            textSaveButton: strings.edit_opportunity,
            onSave: () {
              onNavigatorToEdit();
            },
            textCancelButton: strings.cancel_opportunity,
            onCancel: () {
              onCancelOpportunity(context);
            },
            strokeColor: kRateBarIconColor,
            cancelColor: kRateBarIconColor,
          ),
      ],
    );
  }

  navigatorToEditOpportunity(BuildContext context) {
    AddNewOpportunityPage.push(context, opportunity: opportunity, onSuccess: () {
      //setState(() {});
      print('onSuccess');
    });
  }

  onCancelOpportunity(BuildContext context) {
    showDialogCancelOpportunity(context, opportunityId: opportunity.id ?? 0, isOpportunityDetailsPage: true, onRefresh: onRefreshOpportunities ?? () {});
  }
}
