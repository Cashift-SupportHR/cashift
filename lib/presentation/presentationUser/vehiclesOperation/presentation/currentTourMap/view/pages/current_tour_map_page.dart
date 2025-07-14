import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../../../../main_index.dart';
import '../../../../../common/common_state.dart';
import '../../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../domain/entities/index.dart';
import '../bloc/current_tour_map_cubit.dart';
import '../bloc/current_tour_map_state.dart';
import 'current_tour_map_screen.dart';

class CurrentTourMapPage extends BaseBlocWidget<
    Initialized<CurrentTourMapState>, CurrentTourMapCubit> {
  CurrentTourMapPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }
  @override
  bool detectRequiredTasks() {
    // TODO: implement detectRequiredTasks
    return false;
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<CurrentTourMapState> state) {
    WakelockPlus.enable();
    return CurrentTourMapScreen(
      state: state.data,
      onFetchRoundTypeTermsAndCondition: (int roundTypeId) {
        bloc.fetchRoundTypeTermsAndCondition(roundTypeId);
      },
      onEndRoundTrip: () => onEndRoundTripPressed(state.data.currentRoundTrip!),
      onRefresh: () {
        bloc.fetchInitialData();
      },
    );
  }

  onEndRoundTripPressed(CurrentRoundTrip currentRoundTrip) {
    DialogsManager.showConfirmationDialog(
      context,
      message: strings.end_field_survey_warning_msg,
      onClickOk: () {
        Navigator.of(context).pop();
        bloc.endRoundTrip(currentRoundTrip.id!);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pushReplacementNamed(context, Routes.home);
  }
}
