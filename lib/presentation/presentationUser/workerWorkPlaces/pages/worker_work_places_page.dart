import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../common/data/models/workerWorkPlaces/index.dart';
import '../../../../core/services/routes.dart';
import '../../../shared/components/base_widget_bloc.dart';
import '../../appliedoffers/pages/qrcode_screen.dart';
import '../../common/common_state.dart';
import '../bloc/worker_work_places_cubit.dart';
import 'worker_work_places_screen.dart';

class WorkerWorkPlacesPage
    extends BaseBlocWidget<InitializedFocusPoints, WorkerWorkPlacesCubit> {

  WorkerWorkPlacesPage({Key? key}) : super(key: key);

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(context) {
    bloc.loadInitialData();
    // refresh every 15 seconds
    Timer.periodic(
        const Duration(seconds: 60), (Timer t) => bloc.loadInitialData());
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  Widget buildWidget(BuildContext context, InitializedFocusPoints state) {
    return RefreshIndicator(
      onRefresh: () async {
        bloc.loadInitialData();
      },
      child: WorkerWorkPlacesScreen(
        focusPointInfo: state.focusPointInfo,
        gates: state.workerWorkPlace,
        onActionPerform: (isStart, id) {
          performAttendance(isStart: isStart, id: id);
        },
      ),
    );
  }

  void performAttendance({required bool isStart, required int id}) async {
    final result = await Navigator.pushNamed(context, Routes.qrScanner);
    if (result is QrCode) {
      fetchLocation(onGetLocation: (position) {
        StartAttendanceFocusPointParams params =
            StartAttendanceFocusPointParams(
          id: id,
          focusPointId: result.code,
          latitude: position.latitude.toString(),
          longtude: position.longitude.toString(),
        );
        isStart
            ? bloc.endAttendanceFocusPoint(params)
            : bloc.startAttendanceFocusPoint(params);
      }
      );
    }
  }

  @override
  String? title(context) => strings.my_work_points;
}
