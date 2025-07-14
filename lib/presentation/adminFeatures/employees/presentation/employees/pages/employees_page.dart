import 'package:flutter/material.dart';

import '../../../../../../core/services/routes.dart';
 import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/base/stream_state_widget_v2.dart';
import '../../../../../shared/components/base_widget_bloc.dart';

import '../../../../../shared/components/tabview/dynamic_tab_bar_view.dart';
 import '../../../domain/entities/EmpChasifterData.dart';
import '../../../domain/entities/tab_cashifter.dart';
 import '../bloc/employees_cubit.dart';
import 'employees_screen.dart';

class EmployeesPage
    extends BaseBlocWidget<Initialized<List<TabCashifter>>, EmployeesCubit> {
   int? tabIndex;
  String search = '';

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  @override
  String? title(BuildContext context) {
    return strings.cashifters;
  }

   @override
   bool detectRequiredTasks() {
     return false;
   }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 10),
            child: TextFieldSearchJob(
              title: strings.search_by_phone_employee,
              readOnly: false,
              controller: controller,
              onTap: () {},
              onChanged: (value) {
                bloc.searchByText(value);
              },
            ),
          ),
          TitleAndAddNewRequest(
            title: strings.cashifters,
            textButton: strings.add_cashifters,
            onTap: () {
              Navigator.pushNamed(context, Routes.homeAddNewEmployeesPage);
            },
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<TabCashifter>> state) {
    return DynamicTabBarView(
      isSeparate: true,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      marginTabs: const EdgeInsets.symmetric(horizontal: 16),
      tabs: state.data
              .map((e) => DynamicItem(name: e.name!, id: e.id!))
              .toList() ??
          [],
      onTap: (index) {
        tabIndex = index;
        bloc.fetchEmpChasifter(employeeStatusId: tabIndex!);
      },
      pageWidget: StreamStateWidgetV2<List<EmpChasifter>?>(
          stream: bloc.empChasifterStream,
          onReload: () {
            controller.clear();
            bloc.fetchEmpChasifter(employeeStatusId: tabIndex!);
            loadInitialData(context);
          },
          builder: (context, snapshot) {
            return EmployeesScreen(
              data: snapshot ?? [],
              onRefresh: () {
                bloc.fetchEmpChasifter(
                      employeeStatusId: tabIndex ?? state.data.first.id ?? 0);
              },
              onChangeStatus: (id) {
                //   bloc.changeUserStatus(id);
              },
              onDeleteUser: (id) {
                //  bloc.deleteUsersManagement(id);
              },
            );
          }),
    );
  }

  @override
  onRequestSuccess(message) {
    //bloc.fetchUsers(type);
    controller.clear();
  }
}
