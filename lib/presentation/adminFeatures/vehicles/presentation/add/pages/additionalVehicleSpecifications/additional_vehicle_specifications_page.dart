
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../data/models/vehicle_image_params.dart';
import '../../../../domain/entities/index.dart';
import '../../bloc/additional_vehicle_specifications_cubit.dart';
import 'additional_vehicle_specifications_screen.dart';

class AdditionalVehicleSpecificationsPage
    extends BaseBlocWidget<Initialized<List<VehicleImageFace>>, AdditionalVehicleSpecificationsCubit> {
  final Function(int vehicleId)? onNext;
  final int Function()? idCallback;
  final Function()? onPrevious;

  AdditionalVehicleSpecificationsPage({Key? key, this.idCallback, this.onNext, this.onPrevious})
      : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAllaData();
  }

  @override
  String? title(context) {
    int? id = getArguments(context);
    return id == null ? null : strings.edit_vehicle;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  List<VehicleImageFace>? vehicleImageFaces;
  @override
  Widget buildWidget(BuildContext context, Initialized<List<VehicleImageFace>> state) {
    return AdditionalVehicleSpecificationsScreen(
      data: vehicleImageFaces ?? state.data,
      onAddVehicle: (List<MultipartFile> files, List<VehicleImageFace> vehicleImageFaces) {
        this.vehicleImageFaces = vehicleImageFaces;
        bloc.addVehicleImages(
          VehicleImageParams(
            images: files,
            vehicleId: getVehicleId(context),
          ),
        );
      },
      onPrevious: onPrevious,
    );
  }

  @override
  void onSuccessDismissed() {
    int vehicleId = getVehicleId(context);
    if (getVehicleId(context) != 0){
      if (onNext != null) {
        onNext!(vehicleId);
      }
    } else {
      Navigator.pop(context, true);
    }
  }

  int getVehicleId(BuildContext context) {
    int? id = (getArguments(context) ?? idCallback!()) as int?;
    return id ?? 0;
  }

}
