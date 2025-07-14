import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/addOpportunity/presentations/bloc/add_opportunity_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../core/services/routes.dart';
import '../../../shared/data/models/opportunity_data_dto.dart';
import '../../../shared/domain/entities/opportunities/opportunity.dart';
import 'add_new_opportunity_screen_v2.dart';

class AddNewOpportunityPage extends BaseBlocWidget<InitializedOpportunity, AddOpportunityCubit> {

  static push(BuildContext context, {required Function() onSuccess, Opportunity? opportunity}) async {
    final result = await Navigator.pushNamed(context, Routes.addNewOpportunity, arguments: opportunity);
    if (result is bool && result) {
      onSuccess();
    }
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    final opportunityItem = getArguments(context);
    bloc.fetchDataOpportunityDropDown();
    if (opportunityItem?.id != null) {
      bloc.fetchDataForEdit(opportunityItem);
    }
  }

  @override
  Widget buildWidget(BuildContext context, InitializedOpportunity state) {
    final opportunityItem = getArguments(context);


    return AddNewOpportunityScreenV2(
      state: state,
      opportunity: opportunityItem,
      addOpp: (params) {
        bloc.addOpportunity(params, opportunityItem?.id == null ? false : true);
      },
      onFetchShiftData: (params) => bloc.fetchListShift(params),
      getSchedulePriceOpportunity: (params) => bloc.fetchSchedulePriceDetailForOpportunity(params),
      onFetchProjectsCompanyId: (companyId) => bloc.fetchProjectsCompanyId(companyId),
      onFetchJobsByProjectId: (contractId) => bloc.fetchJobsByProjectId(contractId),
      onFetchContractConditions: (params) => bloc.fetchContractsConditions(params),
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
  }

  @override
  String? title(BuildContext context) {
    final opportunityItem = (getArguments(context) ?? Opportunity.fromDto(OpportunityDto())) as Opportunity;
    return opportunityItem.id == null ? strings.add_new_opportunity : strings.edit_opportunity;
  }
}
