import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/violations/presentation/pages/violations_user_page.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';

import '../../../../../common/domain/entities/bail_requests/employee_services_status.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/tabview/tab_bar_view_widget.dart';

class ViolationsUserTabs extends BaseStatelessWidget {

  ViolationsUserTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.violations,
      body: TabBarViewWidget(
        margin: const EdgeInsets.symmetric(vertical: 16),
        tabs: [
          strings.waiting_for_review,
          strings.approved,
          strings.rejected,
        ],
        children: [
          ViolationsUserPage(
            type: EmployeeServicesStatus.waitingForReview,
          ),
          ViolationsUserPage(
            type: EmployeeServicesStatus.approved,
          ),
          ViolationsUserPage(
            type: EmployeeServicesStatus.rejected,
          ),
        ],
      ),
    );
  }
}
