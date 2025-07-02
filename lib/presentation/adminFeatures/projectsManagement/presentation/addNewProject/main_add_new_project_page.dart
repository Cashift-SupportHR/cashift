import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/addAdditionalLocations/add_additional_locations_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/addProject/add_new_project_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/periodPricing/period_pricing_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/workingPeriodsProject/working_periods_project_page.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../core/services/routes.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../../../shared/components/stepper/custom_linear_step_indicator.dart';
import 'pages/projectSuccessfullyPage/pages/project_successfully_page.dart';

class MainAddNewProjectPage extends BaseStatelessWidget {
   MainAddNewProjectPage({
    Key? key,
  }) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final StreamStateInitial<int> pageStream = StreamStateInitial();

  int projectId = 0;
  int companyId = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.projects_management,
      body: CustomLinearStepIndicator(
        icons: const [
          // AppIcons.buildingsOutline,
          // AppIcons.location,
          // AppIcons.adjustPeriodsOutline,
          // AppIcons.pricingAdjustmentOutline,
        ],
        labels: [
          strings.add_projects,
          strings.additional_locations,
          strings.work_periods,
          strings.period_pricing,
        ],
        pages: [
          AddNewProjectPage(
            idCallback: () => syncSavedID(projectId),
            onNext: (projectId, companyId) {
              this.projectId = projectId ?? 0;
              this.companyId = companyId ?? 0;

              print('projectIdonNext $projectId');
              animateToPage(1);
            },
          ),
          AddAdditionalLocationsPage(
            idCallback: () => syncSavedID(projectId),
            onNext: () {
              animateToPage(2);
            },
            onPrevious: () {
              animateToPage(0);
            },
          ),
          WorkingPeriodsProjectPage(
            companyId: companyId ?? 0,
            idCallback: () => syncSavedID(projectId),
            companyIdCallback: () => syncSavedID(companyId ?? 0),
            onNext: () {
              animateToPage(3);
            },
            onPrevious: () {
              animateToPage(1);
            },
          ),
          PeriodPricingPage(
            companyId: companyId,
            idCallback: () => syncSavedID(projectId),
            companyIdCallback: () => syncSavedID(companyId ?? 0),
            onNext: () {
              Navigator.pushNamed(context, Routes.projectSuccessfullyPage, arguments: projectId);
            },
            onPrevious: () {
              animateToPage(2);
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
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  syncSavedID(id) {
    return id;
  }
}
