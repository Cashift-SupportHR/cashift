import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/periodPricing/period_pricing_screen.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/periodPricing/widget/add_period_pricing_button.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../../common/components/buttons/row_buttons.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/index.dart';
import '../../bloc/add_period_pricing_cubit.dart';

class PeriodPricingPage extends BaseBlocWidget<Initialized<List<PeriodPricing>>, PeriodPricingCubit> {
  final Function()? idCallback;
  final Function()? companyIdCallback;
  final Function()? onNext;
  final Function()? onPrevious;
   int? companyId;
  PeriodPricingPage({Key? key, this.idCallback, this.companyId, this.companyIdCallback, this.onNext, this.onPrevious}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    PraPeriodPricing? praPeriodPricing = getArguments(context);
    bloc.fetchPeriodPrice(projectId: getProjectId(praPeriodPricing));
  }

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  String? title(context) {
    return idCallback != null ? null : strings.pricing_adjustment;
  }

  @override
  Widget build(BuildContext context) {
    PraPeriodPricing? praPeriodPricing = getArguments(context);
    return mainFrame(
        body: Column(
      children: [
        AddPeriodPricingButton(
          projectId: getProjectId(praPeriodPricing),
          companyId: getCompanyId(praPeriodPricing) ?? companyId ?? 0,
          onRefresh: () {
            loadInitialData(context);
          },
        ),
        Expanded(child: buildConsumer(context)),
      ],
    ));
  }

  StreamStateInitial<bool> isEmptyPeriodPricingStream = StreamStateInitial<bool>();
  @override
  Widget buildWidget(BuildContext context, Initialized<List<PeriodPricing>> state) {
    PraPeriodPricing? praPeriodPricing = getArguments(context);
    isEmptyPeriodPricingStream.setData(state.data.isEmpty);
    return PeriodPricingScreen(
      state: state.data,
      projectId: getProjectId(praPeriodPricing),
      companyId: getCompanyId(praPeriodPricing) ?? companyId ?? 0,
      deletePeriodPrice: (id) {
        bloc.deletePeriodPrice(id: id);
      },
      onRefresh: () {
        loadInitialData(context);
      },
    );
  }

  @override
  Widget? bottomNavigationBar(context) {
    return idCallback != null
        ? StreamBuilder<bool>(
            initialData: true,
            stream: isEmptyPeriodPricingStream.stream,
            builder: (context, snapshot) {
              return RowButtons(
                textCancelButton: strings.previous,
                onSave: snapshot.data == true
                    ? null
                    : () {
                        onNext!();
                      },
                onCancel: () {
                  onPrevious!();
                },
              );
            })
        : null;
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }

  int getProjectId(PraPeriodPricing? praWorkingPeriod) {
    return (praWorkingPeriod?.idProject ?? idCallback?.call()) as int;
  }

  int? getCompanyId(PraPeriodPricing? praWorkingPeriod) {
    return praWorkingPeriod?.idCompany ?? companyIdCallback?.call();
  }
}

class PraPeriodPricing {
  int? idProject;
  int? idCompany;

  PraPeriodPricing({required this.idProject, required this.idCompany});
}
