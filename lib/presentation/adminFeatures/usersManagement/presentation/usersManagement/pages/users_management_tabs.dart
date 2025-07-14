import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/tabview/tab_bar_view_widget.dart';
import '../../../domain/entities/users_management_constants.dart';
import '../../addNewUser/pages/add_new_user_page.dart';
import 'users_management_page.dart';

class UsersManagementTabs extends StatefulWidget {
  UsersManagementTabs({Key? key}) : super(key: key);

  @override
  State<UsersManagementTabs> createState() => _UsersManagementTabsState();
}

class _UsersManagementTabsState extends State<UsersManagementTabs> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations strings = AppLocalizations.of(context)!;
    return AppScaffold(
      title: strings.users,
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.added_users,
            textButton: strings.add_new_user,
            onTap: () {
              AddNewUserPage.push(context, onSuccess: () {
                setState(() {});
              });
            },
          ),
          Expanded(
            child: TabBarViewWidget(
              isSeparate: true,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              marginTabs: const EdgeInsets.symmetric(horizontal: 16),
              tabs: [
                strings.active,
                strings.inactive,
              ],
              children: [
                UsersManagementPage(
                  type: UsersManagementConstants.active,
                ),
                UsersManagementPage(
                  type: UsersManagementConstants.inactive,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
