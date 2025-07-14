import 'package:flutter/material.dart';
import 'package:shiftapp/core/resources/data_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../presentationUser/common/common_state.dart';

import '../../../../data/models/index.dart';
import '../../../../domain/entities/index.dart';
import '../../bloc/add_additional_locations_bloc.dart';
import '../../bloc/map_project_gates_bloc.dart';
import 'map_project_gates_screen.dart';

class MapProjectGatesPage extends BaseBlocWidget<
    Initialized<LocationGateProjectDto>, MapProjectGatesCubit> {
  @override
  void loadInitialData(BuildContext context) {
    ProjectManagement projectManagement = getArguments(context);

    bloc.fetchLocationGateProject(projectManagement.id ?? 0);
  }

  @override
  String? title(context) {
    return strings.show_focus_points_in_map;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  Widget buildWidget(
      BuildContext context, Initialized<LocationGateProjectDto> state) {
    return MapProjectGatesScreen(
      locationGateProjectDto: state.data,
      detectMyLocation: () => bloc.detectMyLocation(),
      mapController: bloc.mapController,
      getMarker: ({required emp, required name}) =>
          bloc.getMarkerIcon(name: name, description: emp),
    );
  }
}
