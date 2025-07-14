import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import '../../../../../domain/entities/index.dart';
import '../../../bloc/add_new_employees_bloc.dart';
import 'emp_info_screen.dart';

class EmployeeInfoPage extends BaseBlocWidget<
    Initialized<EmployeeChasfiterDetails>, AddNewEmployeesCubit> {
  final Function()? onNext;
  final Function()? onPrevious;
  final int freelancerId;
  final bool isEdit;

  EmployeeInfoPage(
      {Key? key,
      this.onNext,
      required this.freelancerId,
      required this.isEdit,
      this.onPrevious})
      : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchEmpById(freelancerId: freelancerId);
  }

  @override
  String? title(BuildContext context) {

    return isEdit == true ? strings.employee_data : null;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<EmployeeChasfiterDetails> state) {
    return EmployeeInfoScreen(
      onNext: () => onNext!(),
      isEdit: isEdit,
      data:state.data,
      onPrevious: () => onPrevious!(),
    );
  }
}
