import 'package:flutter/material.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../domain/entities/employee_data.dart';
import '../bloc/employment_management_cubit.dart';
import '../widgets/employee_data_sheet.dart';


class EmployeeDataBuilder extends BaseBlocWidget<
    InitializedSaveEmployeeData, EmploymentManagementCubit> {
  final Function() onRefresh;
  final EmployeeData employeeData;

  EmployeeDataBuilder({Key? key, required this.onRefresh, required this.employeeData})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void loadInitialData(context) {
    bloc.fetchAllEmployeeData(employeeData.freeLanceId ?? 0);
  }

  @override
  Widget buildWidget(
      BuildContext context, InitializedSaveEmployeeData state) {
    return EmployeeDataSheet(
      item: employeeData,
      state: state,
      onSave: (params) {
        print('params ${params.toJson()}');
           bloc.saveEmployeesOrderStatus(params);
      },
    );
  }

  @override
  onSuccessDismissed() {
    Navigator.pop(context);
    onRefresh();
  }
}
