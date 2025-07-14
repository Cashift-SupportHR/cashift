import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/map_project_gates/employee_gates/employee_gates_screen.dart';
 import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

  import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../data/models/employe_point_dto.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';
import '../../../bloc/map_project_gates_bloc.dart';



class EmployeeGatesPage extends BaseBlocWidget<Initialized<List<EmployePointDto>>, MapProjectGatesCubit> {

  final  String  idPoint;
  EmployeeGatesPage({required this.idPoint});

  @override
  void loadInitialData(BuildContext context) {

    bloc.fetchEmpLocationGate(idPoint);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  Widget buildWidget(BuildContext context, Initialized<List<EmployePointDto>> state) {
    return EmployeeGatesScreen(
data:state.data??[]
    );
  }
}
