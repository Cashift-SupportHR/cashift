import 'package:flutter/material.dart';
import 'package:shiftapp/domain/entities/bail_requests/employee_services_status.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';

 import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/tabview/tab_bar_view_widget.dart';
import 'bail_requests_page.dart';

class BailRequestsTabs extends BaseStatelessWidget {
   BailRequestsTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.bail_requests,
      body: TabBarViewWidget(
        margin: const EdgeInsets.symmetric(vertical: 16),
        tabs: [
          strings.waiting_for_review,
          strings.approved,
          strings.rejected,
        ],
        children: [
          BailRequestsPage(
            type: EmployeeServicesStatus.waitingForReview,
          ),
          BailRequestsPage(
            type: EmployeeServicesStatus.approved,
          ),
          BailRequestsPage(
            type: EmployeeServicesStatus.rejected,
          ),
        ],
      ),
    );
  }
}
