import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';

import '../../../../../common/domain/entities/bail_requests/employee_services_status.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../data/models/approve_reject_violation_params.dart';
import '../../data/models/violation_user_dto.dart';
import '../../domain/entities/violations_data.dart';
import '../widgets/reject_violation_dialog.dart';
import '../widgets/violations_user_item.dart';

class ViolationsUserScreen extends BaseStatelessWidget {
  final int type;
  final ViolationsData violationsData;
  final Function(ApproveRejectViolationParams) onAccept;
  final Function(ApproveRejectViolationParams) onReject;

  ViolationsUserScreen(
      {Key? key,
      required this.violationsData,
      required this.type,
      required this.onAccept,
      required this.onReject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: double.infinity,
      child: ListView.builder(
        itemCount: violationsData.apply?.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ViolationsUserItem(
            type: type,
            description: violationsData.description ?? '',
            violation: violationsData.apply![index],
            onAccept: ()=>showAcceptDialog(context, id: violationsData.apply![index].id ?? 0),
            onReject: ()=>showRejectDialog(context, violation: violationsData.apply![index]),
          );
        },
      ),
    );
  }

  showAcceptDialog(BuildContext context, {required int id}){
    DialogsManager.showConfirmationDialog(
      context,
      message: strings.are_you_sure_approval_violation,
      onClickOk: (){
        onAccept(ApproveRejectViolationParams(
          id: id,
          typeViolation: EmployeeServicesStatus.approved,
          status: 0,
        ));
        Navigator.pop(context);
      },
    );
  }

  showRejectDialog(BuildContext context,
      { ViolationUserDto? violation}) {
    return showAppDialog(
      context,
        child: RejectViolationDialog(
          warningText: violation!.typeApprove ?? '',
          onReject: (reason){
            onReject(ApproveRejectViolationParams(
              id: violation.id,
              typeViolation: EmployeeServicesStatus.rejected,
              status: 0,
              description: reason,
            ));
            Navigator.pop(context);
          },
        ),
    );
  }
}
