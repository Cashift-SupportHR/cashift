import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../data/models/add_vehicle_params.dart';
import '../../../../domain/entities/index.dart';
import '../../bloc/basic_vehicle_info_cubit.dart';
import '../../bloc/basic_vehicle_info_state.dart';
import 'basic_vehicle_info_screen.dart';

class BasicVehicleInformationPage
    extends BaseBlocWidget<Initialized<BasicVehicleInformationState>, BasicVehicleInformationCubit> {
  final Function(AddVehicleParams, VehicleDetails?)? onNext;
  final Function()? idCallback;

  BasicVehicleInformationPage({Key? key, this.idCallback, this.onNext}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAllaData(getArguments(context));
  }

  // @override
  // String? title(context) {
  //   return getArguments(context) == null ? null : strings.edit_vehicle;
  // }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  int vehicleId = 0;
  AddVehicleParams params = AddVehicleParams();
  VehicleDetails? initialData;
  @override
  Widget buildWidget(BuildContext context, Initialized<BasicVehicleInformationState> state) {
    initialData = state.data.initialData;
    return BasicVehicleInformationScreen(
      vehicleId: getArguments(context) ?? 0,
      state: state.data,
      onFetchProjectsByCompanyId: (id) {
        bloc.fetchProjectsCompanyId(id);
      },
      onAdd: (AddVehicleParams params) {
        // int? id = ModalRoute.of(context)?.settings.arguments as int?;
        // // isEdit attribute is used to determine if the project in edit mode or back from next page
        // params.id = getProjectId(context);
        // bloc.addEditNewProject(params, isEdit: id == null ? null : true);
        onNext!(params, initialData);
      },
    );
  }


  // @override
  // void onSuccessDataState(projectId) {
  //   print('projectIdonNext $projectId');
  //   if (projectId is int) {
  //     if (onNext != null) {
  //       onNext!(projectId, vehicleId);
  //     }
  //   }
  // }

  // @override
  // void onSuccessDismissed() {
  //   Navigator.pop(context, true);
  // }
  //
  // int getProjectId(BuildContext context) {
  //   int? id =
  //   (ModalRoute.of(context)?.settings.arguments ?? idCallback!()) as int?;
  //   return id ?? 0;
  // }
}
