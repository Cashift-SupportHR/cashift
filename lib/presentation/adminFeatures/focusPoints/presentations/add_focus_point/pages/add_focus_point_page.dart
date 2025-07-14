import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/utils/app_icons.dart';
import '../../../../../../common/components/stepper/custom_linear_step_indicator.dart';
import '../../../../../presentationUser/common/common_state.dart';
import 'covenant_received/covenant_received_page.dart';
import 'focus_point_data/add_focus_point_data_page.dart';

class AddFocusPointPage extends BaseStatelessWidget {
   AddFocusPointPage({
    Key? key,
  }) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final StreamStateInitial<int> pageStream = StreamStateInitial();

  int projectId = 0;
  int focusPointId = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.add_focus_point,
      body: CustomLinearStepIndicator(
        icons: const [
          AppIcons.openDoorOutline,
        //  AppIcons.timeOutline,
          AppIcons.covenantReceivedOutline,
        ],
        labels: [
          strings.focus_point_data,
        //  strings.focus_point_times,
          strings.covenant_received,
        ],
        pages: [
          AddFocusPointDataPage(
            onSave: (projectId, focusPointId) {
              this.projectId = projectId;
              this.focusPointId = focusPointId;
              print('projectIdonNext $projectId');
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            },
          ),
          // FocusPointTimesPage(
          //   idCallback: () => syncSavedID(
          //       FocusPointTimesArgs(projectId: projectId, focusPointId: focusPointId)
          //   ),
          //   onNext: () {
          //     pageController.animateToPage(2,
          //         duration: const Duration(milliseconds: 500),
          //         curve: Curves.ease);
          //   },
          // ),
          CovenantReceivedPage(
              idCallback: () => syncSavedID(focusPointId),
              onPrevious: () {
                pageController.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              }),
        ],
        pageStream: pageStream,
        pageController: pageController,
        onPageChanged: (index) {},
      ),
    );
  }

  syncSavedID(id) {
    return id;
  }
}
