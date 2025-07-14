import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/required_tasks/pages/required_tasks_dialog.dart';

import '../../../../common/data/models/user_overview/index.dart';
import '../../../../common/components/base/base_widget_bloc.dart';
import '../bloc/required_tasks_cubit.dart';

class RequiredTasksDialogBuilder extends BaseBlocWidget<UnInitState, RequiredTasksCubit> {
  final DisclosureRequiredTaskDto requiredTaskDto;
  final Function() onRefresh;
  RequiredTasksDialogBuilder({Key? key, required this.requiredTaskDto, required this.onRefresh}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return buildConsumer(context);
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return RequiredTasksDialog(
      requiredTaskDto: requiredTaskDto,
      onConfirm: (int type) {
        bloc.confirmRequiredTask(type);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context);
    onRefresh();
  }
}
