import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/user_management.dart';
import '../widgets/users_management_item.dart';

class UsersManagementScreen extends BaseStatelessWidget {
  final int type;
  final List<UserManagement> data;
  final Function(String) onRefresh;
  final Function(String) onChangeStatus;
  final Function(String) onDeleteUser;
  UsersManagementScreen({Key? key, required this.data, required this.type, required this.onRefresh, required this.onChangeStatus, required this.onDeleteUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBackground,
      child: ListView.builder(
        itemCount: data.length,
        shrinkWrap:   true,
        padding: const EdgeInsets.only(top: 6, bottom: 16, left: 16, right: 16),
        itemBuilder: (context, index) {
          return  UsersManagementItem(
            type: type,
            item: data[index],
            onRefresh: () {
              onRefresh('');
            },
            onChangeStatus: onChangeStatus,
            onDeleteUser: onDeleteUser,
          );
        },
      ),
    );
  }
}
