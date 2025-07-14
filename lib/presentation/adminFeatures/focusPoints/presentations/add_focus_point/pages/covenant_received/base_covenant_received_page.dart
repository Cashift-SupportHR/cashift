import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../bloc/add_covenant_received_cubit.dart';
import 'covenant_received_screen.dart';
import 'custody_initialize_state.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';

abstract class BaseCovenantReceivedPage
    extends BaseBlocWidget<CustodyInitializeState, CovenantReceivedCubit> {
  void onSave() {

  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
/*
  int focusPointId = 0;
  @override
  void loadInitialData(BuildContext context) {
    focusPointId = onFetchProjectId?.call() ?? 0;
    bloc.fetchCovenantTypes();
  }*/

  @override
  Widget buildWidget(BuildContext context, CustodyInitializeState state) {
    return CovenantReceivedScreen(
      state: state,
      onPrevious: (){

      },
      focusPointId: initFocusPointId(context),
      onSaveAddFocusPoint: (params) {
        bloc.addFocusPointCovenant(params);
      },
      onSaveEditFocusPoint: (params) {
        params.focusPointId = initFocusPointId(context);
        bloc.editFocusPointCovenant(params);
      },
      onDelete: (params) {
        params.focusPointId = initFocusPointId(context);
        bloc.deleteFocusPointCovenant(params);
      },
    );
  }
  @override
  void onSuccessDismissed() {
    onSave();
  }


  int initFocusPointId(BuildContext context);
}
