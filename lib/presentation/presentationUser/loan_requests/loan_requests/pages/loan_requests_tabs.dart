import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';

import '../../../../../core/services/routes.dart';
import '../../../../../common/domain/entities/bail_requests/employee_services_status.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/tabview/tab_bar_view_widget.dart';
 import 'loan_requests_page.dart';

class LoanRequestsTabs extends BaseStatelessWidget {
   LoanRequestsTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.loan_requests,
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.loan_requests,
            textButton: strings.add_new_loan_request,
            onTap: () {
              Navigator.pushNamed(context, Routes.addLoanRequest);
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
                LoanRequestsPage(
                  type: EmployeeServicesStatus.waitingForReview,
                ),
                LoanRequestsPage(
                  type: EmployeeServicesStatus.approved,
                ),
                LoanRequestsPage(
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
