import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';
import '../../../bloc/add_period_pricing_cubit.dart';
import 'add_period_pricing_sheet.dart';

class AddPeriodPricingBuilder extends BaseBlocWidget<InitializedAddPeriodPricing, PeriodPricingCubit> {
  final int? id;
  final int projectId;
  final int companyId;
  final Function()? onRefresh;
  AddPeriodPricingBuilder({this.id, required this.companyId, required this.projectId, required this.onRefresh});

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAddPeriodPrice(projectId: projectId, id: id, companyId: companyId);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, InitializedAddPeriodPricing state) {
    print(companyId);
    print(projectId);
    print("rdvklndvkl");
    return AddPeriodPricingSheet(
      shiftTime: state.shiftTime,
      pricesPreviousStream: bloc.pricesPreviousStream,
      LoadingLastPricing: (idShift, idProject) {
        bloc.fetchInfoLastPricing(idShift: idShift, projectId: projectId);
      },
      dataDetails: state.pricingDetails,
      projectId: projectId,
      timePrice: state.timePrice,
      job: state.job,
      pricingLabel: state.periodPricingLabel,
      onSaveData: (AddPeriodPricingParams addPeriodPricingParams) {
        addPeriodPricingParams.companyId = companyId;
        bloc.addPeriodPricing(addPeriodPricingParams);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    // bloc.fetchPeriodPrice(projectId: projectId);
    Navigator.pop(context, true);
    onRefresh!();
  }
}
