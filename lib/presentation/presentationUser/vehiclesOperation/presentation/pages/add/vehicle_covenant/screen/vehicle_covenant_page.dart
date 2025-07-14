import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/vehicle_covenant/screen/vehicle_covenant_screen.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../../../common/components/bottom_sheet/custom_bottom_sheets.dart';
import '../../../../../../../shared/components/dialogs_manager.dart';
import '../../../../../data/models/add_custodies_prams.dart';
import '../../../../../data/models/confirm_receive_vehicle_params.dart';
import '../../../../../domain/entities/vehicleComponents.dart';
import '../../../../../domain/entities/custody_handover.dart';
import '../bloc/confirm_receive_vehicle_state_listener.dart';
import '../bloc/reject_receive_vehicle_state_listener.dart';
import '../bloc/vehicles_custodies_cubit.dart';

class VehicleCovenantPage extends BaseBlocWidget<
    Initialized<List<VehicleComponents>>, VehiclesCustodiesCubit> {
  final bool isEdit;
  final Function() onNext;
  final Function() onCancel;
  final int Function() onInitialDataCallback;
  final int Function() onInitialDataCallbackHandoverId;
  final List<CustodyHandover>? Function()? onCustodiesHandoversInitialData;

  VehicleCovenantPage({
    Key? key,
    required this.isEdit,
    required this.onInitialDataCallback,
    required this.onCancel,
    required this.onInitialDataCallbackHandoverId,
    required this.onNext,
    this.onCustodiesHandoversInitialData,
  }) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    List<CustodyHandover>? custodiesHandoversInitialData =
        onCustodiesHandoversInitialData!();
    bloc.fetchVehicleCustodie(
        onInitialDataCallback(), custodiesHandoversInitialData);
  }

  bool isConfirm = false;
  bool isReject = false;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<VehicleComponents>> state) {
    print('onInitialDataCallbackHandoverId: ${onInitialDataCallbackHandoverId()}');
    return VehicleCovenantScreen(
      vehicleComponents: state.data,
      addStream: bloc.addStream,
      isEdit: isEdit,
      onNext: (params, vehicleComponentsUpdated) async {
        bloc.vehicleComponents = vehicleComponentsUpdated;
        showReceiveVehicleDialog(context, addCustodiesPrams: params);
      },
      onAddYes: (addImageAndDescriptionsComponentsPrams, file) =>
          bloc.addImageAndDescriptionsCustodies(
              addImageAndDescriptionsComponentsPrams:
                  addImageAndDescriptionsComponentsPrams,
              file: file),
      onCancel: (vehicleComponentsUpdated) {
        bloc.vehicleComponents = vehicleComponentsUpdated;
        onCancel();
      },
      handoverId: onInitialDataCallbackHandoverId(),
    );
  }

  @override
  void onSuccessDismissed() {
    if (isConfirm) {
      onNext();
    } else if (isReject) {
      Navigator.pop(context, true);
    }
  }

  void showReceiveVehicleDialog(BuildContext context,
      {required AddCustodiesPrams addCustodiesPrams}) {
    DialogsManager.showConfirmationAnimatedDialog(
      context,
      message: strings.are_you_sure_want_receive,
      description: strings.receive_confirm_desc,
      negativeButtonName: strings.receive_reject,
      buttonName: strings.receive_confirm,
      onConfirm: () {
        isConfirm = true;
        bloc.addCustodiesAndConfirmRejectReceiveVehicle(
          addCustodiesPrams: addCustodiesPrams,
          params: ConfirmReceiveVehicleParams(
            vehicleHandoverId: addCustodiesPrams.vehicleHandoverId,
            handoverStatus: 1, // 1 Confirm
          ),
        );
      },
      negativeTap: () {
        showReceiveRejectBottomSheet(context,
            addCustodiesPrams: addCustodiesPrams);
      },
    );
  }

  void showReceiveRejectBottomSheet(BuildContext context,
      {required AddCustodiesPrams addCustodiesPrams}) {
    showRejectBottomSheet(
      context,
      title: strings.why_want_refuse_receive,
      subtitle: strings.receive_reject_desc,
      onRejectPressed: (String value) {
        Navigator.pop(context, true);
        isReject = true;
        bloc.addCustodiesAndConfirmRejectReceiveVehicle(
          addCustodiesPrams: addCustodiesPrams,
          params: ConfirmReceiveVehicleParams(
            vehicleHandoverId: addCustodiesPrams.vehicleHandoverId,
            description: value,
            handoverStatus: 2, // 2 Reject
          ),
        );
      },
    );
  }
}
