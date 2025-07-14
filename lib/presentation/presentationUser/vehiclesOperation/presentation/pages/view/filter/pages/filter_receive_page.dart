import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/view/filter/pages/filter_receive_screen.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../../adminFeatures/usersManagement/domain/entities/company.dart';
import '../../../../../../common/common_state.dart';

import '../../../../../data/models/receive_vehicle_prams.dart';
import '../../bloc/filter_receive_vehicles_cubit.dart';

class FilterReceivePage extends BaseBlocWidget<Initialized<List<Company>>,
    FilterReceiveVehiclesCubit> {
  final  Function(ReceiveVehiclePrams) onSaveFilterData;
  FilterReceivePage({
    required this.onSaveFilterData,
  });
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCompany();
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<Company>> state) {
    return FilterReceiveScreen(
      onSaveFilterData: onSaveFilterData,
      company: state.data,
      onFetchProject: (companyId) => bloc.fetchProjectsCompanyId(companyId),
      projectsStream: bloc.projectsStream,
      shiftsStream: bloc.shiftsStream,
      onFetchShift: (projectId) => bloc.fetchShiftsByProjects(projectId),
    );
  }
}
