import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/areapolygones/presentation/add/pages/add_info_vehicle_zone_page.dart';
import 'package:shiftapp/presentation/adminFeatures/areapolygones/presentation/add/pages/map_vehicle_zone_page.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/stepper/custom_linear_step_indicator.dart';
import '../../data/models/add_vehicle_zone_params.dart';

class MainAddVehicleZonePage extends BaseStatelessWidget {
  MainAddVehicleZonePage({
    Key? key,
  }) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final StreamStateInitial<int> pageStream = StreamStateInitial();

  int? vehicleId;
  AddVehicleZoneParams? params;
  @override
  Widget build(BuildContext context) {
    vehicleId = getArguments(context);
    bool isEditVehicle = vehicleId != null;
    return AppScaffold(
      title: isEditVehicle ? strings.edit_area : strings.add_area,
      body: CustomLinearStepIndicator(
        icons: [],
        labels: [
          strings.add_data,
          strings.mark_box_map,
        ],
        pages: [
          AddInfoVehicleZonePage(
            idCallback: () => syncSavedID(vehicleId),
            onNext: (AddVehicleZoneParams params) {
              this.params = params;
              animateToPage(1);
            },
          ),
          MapVehicleZonePage(
            onParamsCallback: () => params,
            onPrevious: () {
              animateToPage(0);
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
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  syncSavedID(id) {
    return id;
  }
}
