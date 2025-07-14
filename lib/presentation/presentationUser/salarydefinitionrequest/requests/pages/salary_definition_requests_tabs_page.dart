import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/pages/salary_definition_requests_page.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';

import '../../../../../core/services/routes.dart';
import '../../../../../common/domain/entities/bail_requests/employee_services_status.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/tabview/tab_bar_view_widget.dart';
import '../../newrequest/pages/salary_definition_request_page.dart';

class SalaryDefinitionRequestsTabsPage extends BaseStatelessWidget {
   SalaryDefinitionRequestsTabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.salary_definition_request,
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.requests,
            textButton: strings.add_new_request,
            onTap: () {
              Navigator.pushNamed(context, Routes.salaryDefinitionRequestPage);
            },
          ),
          Expanded(
            child: TabBarViewWidget(
              tabs: [
                strings.waiting_for_approval,
                strings.approved,
                strings.rejected,
              ],
              children: [
                SalaryDefinitionRequestsPage(
                  type: EmployeeServicesStatus.waitingForReview,
                ),
                SalaryDefinitionRequestsPage(
                  type: EmployeeServicesStatus.approved,
                ),
                SalaryDefinitionRequestsPage(
                  type: EmployeeServicesStatus.rejected,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
