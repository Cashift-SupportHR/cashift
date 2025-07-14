import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/bloc/opportunity_details_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import '../../shared/domain/entities/opportunities/OpportunityDetailsData.dart';
import '../../shared/domain/entities/opportunities/opportunity.dart';
import '../../shared/domain/entities/opportunities/opportunity_details.dart';
import 'opportunity_details_screen_v2.dart';

class OpportunityDetailsPageArgs {
  final bool isShowButtonsAction;
  final Opportunity opportunity;
  final Function()? onRefreshOpportunities;

  OpportunityDetailsPageArgs({required this.isShowButtonsAction, required this.opportunity, this.onRefreshOpportunities});
}

class OpportunityDetailsPage extends BaseBlocWidget<Initialized<OpportunityDetailsData>, OpportunityDetailsCubit> {
   OpportunityDetailsPage({Key? key}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

   @override
   bool detectRequiredTasks() {
     return false;
   }
  @override
  void loadInitialData(BuildContext context) {
    OpportunityDetailsPageArgs args = getArguments(context);
    bloc.fetchOpportunityDetails(id: args.opportunity.id ?? 0);
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<OpportunityDetailsData> state) {
    OpportunityDetailsPageArgs args = getArguments(context);
    return AppScaffold(
      canBak: false,
      body: OpportunityDetailsScreenV2(
        opportunityDetails: state.data,
        opportunity: args.opportunity,
        isShowButtonsAction: args.isShowButtonsAction,
        onNavigatorToEdit: () {
          AddNewOpportunityPage.push(context, onSuccess: () {
            // bloc.fetchOpportunityDetailsById(args.opportunity.id!);
            Navigator.pop(context, true);
          }, opportunity: args.opportunity);
        },
        onRefreshOpportunities: () {
          print("onRefreshOpportunities");
          //  Navigator.pop(context);
          args.onRefreshOpportunities!();
        },
        onRefreshOpportunityDetails: () {
          bloc.fetchOpportunityDetailsById(args.opportunity.id!);
          //Navigator.pop(context);
        },
      ),
      title: strings.opportunity_details,
    );
  }
}
