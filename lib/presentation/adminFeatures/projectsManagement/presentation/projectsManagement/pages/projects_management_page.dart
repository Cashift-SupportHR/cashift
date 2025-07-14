import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/projectsManagement/pages/projects_management_screen.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../domain/entities/project_management.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../addNewProject/main_add_new_project_page.dart';
import '../bloc/projects_management_cubit.dart';


class ProjectsManagementPage extends BaseBlocWidget<
    Initialized<List<ProjectManagement>>, ProjectsManagementCubit> {

  ProjectsManagementPage({Key? key})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void loadInitialData(context) {
    bloc.fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
        body: Column(
          children: [
            Padding(
            padding: const EdgeInsets.all(16),
            child: TextFieldSearchJob(
              title: strings.search,
              readOnly: false,
              onTap: () {},
              onChanged: (value) {
                if (value.isEmpty) {
                  loadInitialData(context);
                  return;
                }
                print('points is ${value}');

                bloc.searchByText(value);
              },
            ),
          ),

            TitleAndAddNewRequest(
              title: strings.projects,
              textButton: strings.add_project,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () async {
                final isRefresh = await Navigator.pushNamed(
                    context, Routes.mainAddNewProjectPage);
                if (isRefresh == true) {
                  loadInitialData(context);
                }
              },
            ),
            Expanded(child: buildConsumer(context))
          ],
        ));
  }
  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<ProjectManagement>> state) {
    return ProjectsManagementScreen(
      data: state.data,
      onRefresh: (value) {
        loadInitialData(context);
      },
    );
  }

  @override
  String? title(context)=> strings.projects_management;

  @override
   onRequestSuccess( message) {
    bloc.fetchProjects();
  }
}
