import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../add_focus_point/bloc/add_focus_point_data_cubit.dart';
import '../add_focus_point/pages/focus_point_data/focus_point_data_screen.dart';

abstract class BaseFocusPointDataPage
    extends BaseBlocWidget<InitializedFocusPointData, AddFocusPointDataCubit> {

  BaseFocusPointDataPage({Key? key}) : super(key: key);

  @override
  bool detectRequiredTasks() {
    return false;
  }

  int ?  projectId;
  bool isDelete = false;
  @override
  Widget buildWidget(BuildContext context, InitializedFocusPointData state) {
    return FocusPointDataScreen(
      state: state,
      areasStream: bloc.areasStream,
        shiftsStream:  bloc.shiftsStream,
      onDeleteShift: (id) {
        isDelete = true;
        bloc.deleteFocusPointShift(id);
      },
      onFetchShifts: (projectId) {
        bloc.fetchShifts(projectId);
      },
      onFetchFocusPointAreas: (projectId) {
        bloc.fetchFocusPointAreas(projectId);
      },
      onSaveAddFocusPoint: (params) {
        isDelete = false;
        bloc.addFocusPoint(params);
        projectId = params.projectId ;
      },
    );
  }

  @override
  void onSuccessDataState(data) {
    if (data is int) {
      onSaveNewPoint(data, projectId??0);
    }
  }

  void onSaveNewPoint(int id,int projectID) {

  }

  bool isNewPoint(){
    return true;
  }

  bool isDeleteShift(){
    return isDelete;
  }
}
