import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/EmpChasifterData.dart';
import '../widgets/employees_item.dart';

class EmployeesScreen extends BaseStatelessWidget {

  final List<EmpChasifter> data;
  final Function() onRefresh;
  final Function(String) onChangeStatus;
  final Function(String) onDeleteUser;
  EmployeesScreen({Key? key, required this.data, required this.onRefresh, required this.onChangeStatus, required this.onDeleteUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBackground,
      child: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 6, bottom: 16, left: 16, right: 16),
        itemBuilder: (context, index) {
          return EmployeesItem(
            item: data[index],
            details: false,
            onRefresh: () {
              onRefresh();
            },
            onChangeStatus: onChangeStatus,
            onDeleteUser: onDeleteUser,
          );
        },
      ),
    );
  }
}
