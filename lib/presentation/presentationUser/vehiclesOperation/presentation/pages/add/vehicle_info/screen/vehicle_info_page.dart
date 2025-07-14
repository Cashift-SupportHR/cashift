import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/vehicle_info/screen/vehicle_info_screen.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../../adminFeatures/vehicles/domain/entities/vehicle_details.dart';
import '../../../../../data/models/create_vehicle_handover_prams.dart';
import '../bloc/info_vehicles_cubit.dart';

class VehicleInfoPage
    extends BaseBlocWidget<Initialized<VehicleDetails>, InfoVehiclesCubit> {
  final Function(CreateVehicleHandoverPrams createVehicleHandoverPrams) onNext;
  final Function() idCallback;

  final String Function() onInitialDataCallback;

  VehicleInfoPage(
      {Key? key,
      required this.idCallback,
      required this.onNext,
      required this.onInitialDataCallback})
      : super(key: key);
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchVehicleByCode(onInitialDataCallback());
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<VehicleDetails> state) {
    return VehicleInfoScreen(
      shiftsStream: bloc.shiftsStream,
      onNext: (shiftId) => onNext(
        CreateVehicleHandoverPrams(
          projectId: state.data.projectId,
          vehicleId: state.data.id,
          companyId: state.data.companyId,
          shiftId: shiftId,
        ),
      ),
      vehicleDetails: state.data,
      onCancel: () => idCallback(),
    );
  }
}
