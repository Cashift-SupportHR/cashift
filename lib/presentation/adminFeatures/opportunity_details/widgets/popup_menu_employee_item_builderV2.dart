import 'package:flutter/material.dart';

import '../../../../common/components/base/base_widget_bloc.dart';
import '../../shared/domain/entities/opportunities/AppliedData.dart';
import '../../shared/domain/entities/opportunities/menu_employees_status.dart';
import '../../shared/domain/entities/opportunities/opportunity_details.dart';
import '../bloc/opportunity_details_cubit.dart';
import 'approve_job_request.dart';
import 'approve_job_requestV2.dart';
import 'update_attendance_widget.dart';

class PopupMenuEmployeeItemBuilderV2 extends BaseBlocWidget<dynamic, OpportunityDetailsCubit> {
  final int opportunityId;
  final AppliedData menuEmployees;
  final Function() onRefresh;
  final String jopName;
  PopupMenuEmployeeItemBuilderV2({Key? key, required this.opportunityId, required this.menuEmployees, required this.onRefresh, required this.jopName}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {}
  @override
  Widget buildWidget(BuildContext context, dynamic state) {
    return MenuEmployeesStatus.acceptedOrRejectedStatus.contains(menuEmployees.status)
        ? ApproveJobRequestV2(
            opportunityId: opportunityId,
            menuEmployees: menuEmployees,
            jopName: jopName,
            onApproveJobRequest: (params) => bloc.approveJobRequest(params),
          )
        : UpdateAttendanceWidget(
            opportunityId: opportunityId,
            employeeId: menuEmployees.id ?? 0,
            onUpdateAttendance: (params) => bloc.updateAttendance(params),
          );
  }

  @override
  void onRequestSuccess(String? message) {
    onRefresh();
    Navigator.pop(context);
    super.onRequestSuccess(message);
  }
}
