import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../data/models/ban_employee_status_params.dart';
import '../../../domain/entities/ban_employee.dart';
import '../../../domain/entities/ban_employee_constants.dart';
import '../widgets/ban_employee_item.dart';

class BanEmployeesScreen extends BaseStatelessWidget {
  final int type;
  final List<BanEmployee> data;
  final Function(BanEmployeeStatusParams) onUpdateEmployeeStatus;
  BanEmployeesScreen(
      {Key? key,
      required this.data,
      required this.type,
      required this.onUpdateEmployeeStatus,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBackground,
      child: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        controller: ScrollController(),
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
        itemBuilder: (context, index) {
          return BanEmployeeItem(
            type: type,
            item: data[index],
            onUpdateEmployeeStatus: (int type) {
              showConfirmDialog(context, index, type);
            },
          );
        },
      ),
    );
  }

  showConfirmDialog(BuildContext context, int index, int type) {
    DialogsManager.showConfirmationDialog(
      context,
      message: type == BanEmployeeConstants.rejected
          ? strings.are_you_sure_ban_employee
          : strings.are_you_sure_approval_employee,
      onClickOk: () {
        Navigator.of(context).pop();
        onUpdateEmployeeStatus(BanEmployeeStatusParams(
          id: data[index].id ?? 0,
          type: type,
        ));
      },
    );
  }
}
