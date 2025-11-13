import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/scan_qr/scan_qr_vehicle_screen.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/vehicleReceivedImages/pages/vehicle_received_images_page.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/vehicle_components/screen/vehicle_components_page.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/vehicle_covenant/screen/vehicle_covenant_page.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/vehicle_info/screen/vehicle_info_page.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../common/common_state.dart';
import '../../../../../shared/components/stepper/custom_linear_step_indicator.dart';
import '../../../data/models/create_vehicle_handover_prams.dart';
import '../../../data/models/mainReceiveVehicleArgument.dart';
import '../../../domain/entities/CreateVehicleHandover.dart';
import '../../../domain/entities/custody_handover.dart';
import '../../startTour/pages/start_tour_page.dart';

class MainReceiveVehiclePage extends BaseStatelessWidget {
  MainReceiveVehiclePage({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  final StreamStateInitial<int> pageStream = StreamStateInitial();

  String? vehicleCode;
  int? handoverId;
  CreateVehicleHandoverPrams? createVehicleHandoverPrams;

  static push(
    BuildContext context, {
    required Function() onSuccess,
    MainReceiveVehicleArg? mainReceiveVehicleArg,
  }) async {
    final result = await Navigator.pushNamed(
      context,
      Routes.mainReceiveAdd,
      arguments: mainReceiveVehicleArg,
    );
    if (result is bool && result) {
      print('push: $result');
      onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    WakelockPlus.enable();
    MainReceiveVehicleArg arg = getArguments(context);
    List<CustodyHandover>? custodiesHandoversInitialData;
    CreateVehicleHandover createVehicleHandover = CreateVehicleHandover();
    return AppScaffold(
      title: strings.receive_vehicle,
      body: CustomLinearStepIndicator(
        icons: [],
        labels: [
          if (arg.isEdit == false) ...[
            strings.scan_code,
            strings.data_vehicles,
            strings.vehicle_image,
          ],
          strings.vehicle_components,
          strings.covenants,
          strings.start_tour,
        ],
        pages: [
          if (arg.isEdit == false) ...[
            ScanQrVehicleScreen(
              onNext: (code) {
                print(code);
                print("codeScanThis");
                if (code != "") {
                  vehicleCode = code;
                  animateToPage(1);
                }
              },
            ),
            VehicleInfoPage(
              idCallback: () {
                animateToPage(0);
              },
              onInitialDataCallback: () => vehicleCode ?? "",
              onNext: (dataCreateVehicleHandoverPrams) {
                createVehicleHandoverPrams = dataCreateVehicleHandoverPrams;
                animateToPage(2);
              },
            ),
            VehicleReceivedImagesPage(
              onInitialDataCallback:
                  () =>
                      createVehicleHandoverPrams ??
                      CreateVehicleHandoverPrams(),
              onNext: (handover) {
                createVehicleHandover = handover;
                animateToPage(3);
              },
              onPrevious: () {
                animateToPage(1);
              },
            ),
          ],
          VehicleComponentsPage(
            mainReceiveVehicleArg: getArguments(context),
            onNext: (data, custodiesHandovers) {
              custodiesHandoversInitialData = custodiesHandovers;
              print(
                "custodiesHandoversInitialData $custodiesHandoversInitialData",
              );
              if (arg.isEdit == true) {
                handoverId = arg.receiveVehicleData?.handoverId ?? 0;
                animateToPage(1);
              } else {
                handoverId = data;
                animateToPage(4);
              }
            },
            onCancel: () {
              if (arg.isEdit == true) {
                Navigator.pop(context);
              } else {
                animateToPage(2);
              }
            },
            onInitialDataCallback: () => createVehicleHandover,
          ),
          VehicleCovenantPage(
            isEdit: arg.isEdit,
            onInitialDataCallback:
                () =>
                    arg.isEdit == true
                        ? arg.receiveVehicleData?.vehicleId ?? 0
                        : createVehicleHandoverPrams?.vehicleId ?? 0,
            onInitialDataCallbackHandoverId: () => handoverId ?? 0,
            onCustodiesHandoversInitialData:
                () => custodiesHandoversInitialData,
            onCancel: () {
              arg.isEdit == true ? animateToPage(0) : animateToPage(3);
            },
            onNext: () {
              if (arg.isEdit == true) {
                animateToPage(2);
              } else {
                animateToPage(5);
              }
            },
          ),
          StartTourPage(onInitialDataCallbackHandoverId: () => handoverId ?? 0),
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
