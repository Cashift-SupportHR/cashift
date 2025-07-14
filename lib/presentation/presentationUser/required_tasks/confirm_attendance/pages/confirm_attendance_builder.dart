import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/activity_log/bloc/activity_log_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/data/models/activity_log/index.dart';

import '../../../../../common/domain/entities/required_tasks/confirm_attendance.dart';
import '../../../../../common/components/base/base_widget_bloc.dart';
import 'confirm_attendance_dialog.dart';

class ConfirmAttendanceBuilder
    extends BaseBlocWidget<UnInitState, ActivityLogCubit> {
  final ConfirmAttendance data;

  ConfirmAttendanceBuilder({Key? key, required this.data}) : super(key: key);

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
    return ConfirmAttendanceDialog(
      data: data,
      onConfirm: (description, isConfirm) {
        onConfirmAction(description, isConfirm);
      },
    );
  }

  onConfirmAction(String description, bool isConfirm) {
    fetchLocation(onGetLocation: ((location) {
      print('fetchLocation $location');
      bloc.confirmActivity(ConfirmActivityParams(
        id: data.applayId,
        statusId: isConfirm
            ? ConfirmActivityStatus.Approve
            : ConfirmActivityStatus.Reject,
        description: description,
        latitude: location.latitude,
        longitude: location.longitude,
      ));
    }));
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context);
  }
}
