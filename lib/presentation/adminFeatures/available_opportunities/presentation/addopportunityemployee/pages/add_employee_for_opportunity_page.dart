import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/models/free_lance_info_params.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../opportunities/bloc/available _opportunities_cubit.dart';
import 'add_employee_for_opportunity.dart';




class AddEmployeeForOpportunityPage extends
BaseBlocWidget<UnInitState, AvailableOpportunitiesCubit> {
  final int opportunityId;
  final Function()? onRefresh;
  AddEmployeeForOpportunityPage({Key? key, required this.opportunityId, this.onRefresh}) : super(key: key);
  @override
  bool initializeByKoin() {
    return false;
  }
  //
  @override
  void loadInitialData(BuildContext context) {
     //bloc.fetchFreeLanceInfo('01141475581');
  }
  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return AddEmployeeForOpportunityWidget(
      opportunityId: opportunityId,
      employeeFreeLanceInfoStream: bloc.employeeFreeLanceInfoStream,
      onAddEmployee: (String phone) => bloc.fetchEmployeeFreeLanceInfo(phone),
      onSaveEmployees: (List<FreeLanceInfoParams> employees) {
        bloc.assignListFreeLanceOpportunity(employees);
      },
    );
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void onRequestSuccess(String? message) {
    onRefresh?.call();
    Navigator.pop(context);
    super.onRequestSuccess(message);
    print('onRequestSuccess AddEmployeeForOpportunityPage');
    print('onRequestSuccess AddEmployeeForOpportunityPage');
  }
}
