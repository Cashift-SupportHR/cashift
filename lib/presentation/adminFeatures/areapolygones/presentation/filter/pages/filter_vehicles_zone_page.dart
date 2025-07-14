import 'package:flutter/material.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../data/models/filter_vehicle_zone_params.dart';
import '../bloc/filter_vehicles_zone_cubit.dart';
import '../bloc/filter_vehicles_zone_state.dart';
import 'filter_vehicles_zone_screen.dart';

class FilterVehiclesZonePage extends BaseBlocWidget<
    Initialized<FilterVehiclesZoneState>, FilterVehiclesZoneCubit> {
  FilterVehiclesZonePage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
     bloc.fetchInitialData();
  }


  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<FilterVehiclesZoneState> state) {
    return FilterVehiclesZoneScreen(
      state: state.data,
      onFetchProjectsCompanyId: (int companyId) {
        bloc.fetchProjectsCompanyId(companyId);
      },
      onFetchShiftsByProjectId: (int projectId) {
        bloc.fetchShiftsByProjectId(projectId);
      },
      onFetchVehiclesZoneAreasByProjectId: (FilterVehicleZoneParams params) {
        bloc.fetchVehiclesZoneAreasByProjectId(params);
      },
    );
  }
}
