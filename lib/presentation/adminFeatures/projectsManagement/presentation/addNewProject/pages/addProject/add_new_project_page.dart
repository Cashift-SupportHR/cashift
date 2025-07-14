import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../../presentationUser/common/common_state.dart';
import '../../bloc/add_new_project_bloc.dart';
import 'add_new_project_screen.dart';
import '../../../../data/models/index.dart';

class AddNewProjectPage
    extends BaseBlocWidget<InitializedAddNewProject, AddNewProjectCubit> {
  final Function(int projectId, int companyId)? onNext;
  final Function()? idCallback;

  AddNewProjectPage({Key? key, this.idCallback, this.onNext}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAllaData(id: getProjectId(context));
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  String? title(context) {
    int? id = getArguments(context);
    return id == null ? null : strings.edit_project_data;
  }

  int companyId = 0;

  @override
  Widget buildWidget(BuildContext context, InitializedAddNewProject state) {
    return AddNewProjectScreen(
      projectId: getProjectId(context),
      state: state,
      onAddProject: (params) {
        int? id = getArguments(context);
        // isEdit attribute is used to determine if the project in edit mode or back from next page
        params.id = getProjectId(context);
        companyId = params.companyId ?? 0;
        bloc.addEditNewProject(params, isEdit: id == null ? null : true);
      },
    );
  }

  @override
  void onSuccessDataState(projectId) {
    print('projectIdonNext $projectId');
    if (projectId is int) {
      if (onNext != null) {
        onNext!(projectId, companyId);
      }
    }
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
  }

  int getProjectId(BuildContext context) {
    int? id =
        (getArguments(context) ?? idCallback!()) as int?;
    return id ?? 0;
  }
}
