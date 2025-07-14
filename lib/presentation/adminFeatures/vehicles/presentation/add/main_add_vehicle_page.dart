import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/presentation/add/pages/additionalVehicleSpecifications/additional_vehicle_specifications_page.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/presentation/add/pages/basicVehicleInformation/basic_vehicle_info_page.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/presentation/add/pages/covenantsVehicles/view/covenants_vehicles_page.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/presentation/add/pages/plateLicenseInformation/plate_license_info_page.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/stepper/custom_linear_step_indicator.dart';
import '../../data/models/add_vehicle_params.dart';
import '../../domain/entities/index.dart';

class MainAddVehiclePage extends BaseStatelessWidget {
  MainAddVehiclePage({
    Key? key,
  }) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final StreamStateInitial<int> pageStream = StreamStateInitial();

  int? vehicleId;
  AddVehicleParams params = AddVehicleParams();
  VehicleDetails? initialData;

  @override
  Widget build(BuildContext context) {
    vehicleId = getArguments(context);
    bool isEditVehicle = vehicleId != null;
    return AppScaffold(
      title: isEditVehicle ? strings.edit_vehicle : strings.add_vehicle,
      body: CustomLinearStepIndicator(
        icons: [
          // AppIcons.done,
          // AppIcons.done,
          // if (!isEditVehicle) ...[
          //   AppIcons.done,
          //   AppIcons.done,
          // ]
        ],
        labels: [
          strings.basic_vehicle_information,
          strings.license_and_plate_information,
          if (!isEditVehicle) ...[
            strings.additional_specifications,
            strings.covenants,
          ]
        ],
        pages: [
          BasicVehicleInformationPage(
            idCallback: () => syncSavedID(vehicleId),
            onNext: (AddVehicleParams params, VehicleDetails? initialData) {
              this.params = params;
              this.initialData = initialData;
              animateToPage(1);
            },
          ),
          PlateLicenseInfoPage(
            onInitialDataCallback: () => initialData,
            onParamsCallback: () => params,
            onNext: (id) {
              vehicleId = id;
              animateToPage(2);
            },
            onPrevious: () {
              animateToPage(0);
            },
          ),
          if (!isEditVehicle) ...[
            AdditionalVehicleSpecificationsPage(
              idCallback: () => syncSavedID(vehicleId),
              onNext: (vehicleId) {
                print('vehicleId: $vehicleId');
                animateToPage(3);
              },
              onPrevious: (){
                animateToPage(1);
              },
            ),
            VehiclesCovenantPage(
              idCallback: () => syncSavedID(vehicleId),
              onNext: () {
                Navigator.pop(context, true);
              },
              onPrevious: () {
                animateToPage(2);
              },
            ),
          ],
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
