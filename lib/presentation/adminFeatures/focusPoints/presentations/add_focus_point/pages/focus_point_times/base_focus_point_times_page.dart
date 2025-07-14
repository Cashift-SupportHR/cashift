import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import '../../../../../../presentationUser/common/common_state.dart';
import '../../bloc/add_focus_point_times_cubit.dart';
import 'widgets/focus_point_times_screen.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';


abstract class BaseFocusPointTimesPage extends BaseBlocWidget<
    InitializedFocusPointTimes, AddFocusPointTimesCubit> {
  BaseFocusPointTimesPage({Key? key}) : super(key: key);

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  Widget buildWidget(BuildContext context, InitializedFocusPointTimes state) {
    return FocusPointTimesScreen(
      focusPointId: initFocusPointId(context),
      state: state,
      onDeleteTime: (id) {
        bloc.deleteFocusPointAttendance(id);
      },
      onSaveEditTime: (param) {
        bloc.addFocusAttendanceTime([param]);
      },
      onSaveAddFocusPoint: (params) {
       bloc.addFocusAttendanceTime(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    onSavePoints();
  }

  void onSavePoints() {

  }
  int initFocusPointId(BuildContext context);
}
