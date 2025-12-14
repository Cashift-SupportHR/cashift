import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/mana_delivery/presentation/pages/resend_code/screens/resend_code_page.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../shared/components/stepper/custom_linear_step_indicator.dart';
import 'details_order_mana/screens/details_order_mana_page.dart';
import 'go_to_customer_mana/screens/go_to_customer_mana_page.dart';
import 'nearest_warehouse/screens/nearest_warehouse_page.dart';

class MainManaDeliverPage extends BaseStatelessWidget {
  MainManaDeliverPage({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final StreamStateInitial<int> pageStream = StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.job_path,
      body: CustomLinearStepIndicator(
        icons: [],

        labels: [
          strings.details_order,
          strings.nearest_warehouse,
          strings.resend_code,
          strings.go_to_customer,
        ],
        pages: [
          DetailsOrderManaPage(onNext: () {animateToPage(1);}),

          NearestWarehousePage(onNext: () {animateToPage(2);}),
          ResendCodePage(onNext: () {animateToPage(3);}),
          GoToCustomerManaPage(onNext: () {}),
        ],
        pageStream: pageStream,
        pageController: pageController,
        onPageChanged: (index) {},
      ),
    );
  }

  animateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
