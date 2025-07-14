import 'package:flutter/material.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../domain/entities/index.dart';
import '../bloc/general_violation_details_cubit.dart';
import 'general_violation_details_screen.dart';

class GeneralViolationDetailsPage extends BaseBlocWidget<
    Initialized<GeneralViolation>, GeneralViolationCubit> {


  @override
  loadInitialData(BuildContext context) {
    int id = getArguments(context);
    bloc.fetchWorkHazardDetails(id);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  String? title(BuildContext context) {
    return strings.violation_details;
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<GeneralViolation> state) {
    return GeneralViolationScreen(
      item: state.data,
    );
  }
}
