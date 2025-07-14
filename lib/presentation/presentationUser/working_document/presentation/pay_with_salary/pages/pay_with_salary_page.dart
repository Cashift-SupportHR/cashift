import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/presentation/pay_with_salary/pages/pay_with_salary_screen.dart';

import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../common/common_state.dart';
import '../bloc/pay_with_salary_cubit.dart';



class PayWithSalaryPage extends BaseBlocWidget<
    Initialized<List<String>>, PayWithSalaryCubit> {

  PayWithSalaryPage({Key? key})
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
    bloc.fetchUsers();
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<String>> state) {
    return PayWithSalaryScreen(
      data: state.data,
    );
  }

  // @override
  //  onRequestSuccess(message) {
  //   bloc.fetchUsers();
  // }
}
