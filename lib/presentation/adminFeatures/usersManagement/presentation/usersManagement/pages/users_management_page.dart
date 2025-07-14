import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/usersManagement/presentation/usersManagement/pages/users_management_screen.dart';

import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../domain/entities/user_management.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../bloc/users_management_cubit.dart';


class UsersManagementPage extends BaseBlocWidget<
    Initialized<List<UserManagement>>, UsersManagementCubit> {
  final int type;

  UsersManagementPage({Key? key, required this.type})
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
    bloc.fetchUsers(type);
  }
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return mainFrame(
        body: Column(
          children: [
            Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 10),
            child: TextFieldSearchJob(
              title: strings.search,
              controller: controller,
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
            Expanded(child: buildConsumer(context))
          ],
        ));
  }
  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<UserManagement>> state) {
    return UsersManagementScreen(
      data: state.data,
      type: type,
      onRefresh: (value) {
        bloc.fetchUsers(type);
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onChangeStatus: (id) {
        bloc.changeUserStatus(id);
      },
      onDeleteUser: (id) {
      //  bloc.deleteUsersManagement(id);
      },
    );
  }

  @override
   onRequestSuccess(message) {
    bloc.fetchUsers(type);
    controller.clear();
  }
}
