import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; import 'package:shiftapp/presentation/presentationUser/logistics_request/presentation/pages/select_car/screens/vehicle_type_page.dart';
import 'package:shiftapp/presentation/presentationUser/logistics_request/presentation/pages/terms_and_conditions_logistics/screens/terms_and_conditions_logistics_page.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../shared/components/stepper/custom_linear_step_indicator.dart';
import '../../data/models/add_logistics_prams.dart';
import 'license_data/screens/license_data_page.dart';
import 'location_data/screens/location_data_page.dart';

class MainLogisticsRequestPage extends BaseStatelessWidget {
  MainLogisticsRequestPage({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final StreamStateInitial<int> pageStream = StreamStateInitial();

  AddLogisticPrams addLogisticPrams = AddLogisticPrams();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.add_request,
      body: CustomLinearStepIndicator(
        icons: [],

        labels: [
          strings.vehicle_type,
         // strings.license_data,
          strings.location_data,
          strings.terms_and_conditions,
        ],
        pages: [

          VehicleTypePage(
            onNext: (int id) {
              addLogisticPrams.jobOfferCarTypeId = id;
              animateToPage(1);
            },
          ),

          // LicenseDataPage(
          //   onNext: (License license) {
          //     addLogisticPrams.license = license;
          //     animateToPage(2);
          //   },
          //   onPrevious: () {
          //     animateToPage(0);
          //   },
          // ),

          LocationDataPage(
            onNext: (AddLogisticPrams data) {
              addLogisticPrams.location = data.location;
              addLogisticPrams.preferredDistrictIds = data.preferredDistrictIds;
              animateToPage(2);
            },
            onPrevious: () {
              animateToPage(0);
            },
          ),
          TermsAndConditionsLogisticsPage(
            callback: () => callback(addLogisticPrams),
            onNext: () {

            },
            onPrevious: () {
              animateToPage(1);
            },
          ),
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

  callback(AddLogisticPrams prams) {
    return prams;
  }
}
