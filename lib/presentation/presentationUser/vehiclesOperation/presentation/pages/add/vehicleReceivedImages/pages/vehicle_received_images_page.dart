
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../../adminFeatures/vehicles/domain/entities/vehicle_image_face.dart';
import '../../../../../../../adminFeatures/vehicles/presentation/add/pages/additionalVehicleSpecifications/additional_vehicle_specifications_screen.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../data/models/create_vehicle_handover_prams.dart';
import '../../../../../data/models/vehicle_received_images_params.dart';
import '../../../../../domain/entities/CreateVehicleHandover.dart';
import '../bloc/vehicle_received_images_cubit.dart';

class VehicleReceivedImagesPage
    extends BaseBlocWidget<InitializedReceivedVehiclesImages, VehicleReceivedImagesCubit> {
  final Function(CreateVehicleHandover)? onNext;
  final CreateVehicleHandoverPrams Function() onInitialDataCallback;
  final Function()? onPrevious;

  VehicleReceivedImagesPage({Key? key, this.onNext, this.onPrevious, required this.onInitialDataCallback})
      : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAllaData(onInitialDataCallback());
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  CreateVehicleHandover createVehicleHandover = CreateVehicleHandover();

  @override
  Widget buildWidget(BuildContext context, InitializedReceivedVehiclesImages state) {
    createVehicleHandover = state.createVehicleHandover;

    return AdditionalVehicleSpecificationsScreen(
      data: state.vehicleImageFaces,
      onAddVehicle: (List<MultipartFile> files, List<VehicleImageFace> vehicleImageFaces) {
        bloc.vehicleImageFaces = vehicleImageFaces;

        // Note: When the files are empty, we assume that the user has not added any images again.
        // In this case, we can directly call the onNext callback.
        // because the user has already added images in this page before.
        if (files.isNotEmpty) {
          bloc.addVehicleHandoverImages(
            VehicleReceivedImagesParams(
              images: files,
              vehicleId: createVehicleHandover.vehicleId ?? 0,
              vehicleHandoverId: createVehicleHandover.id ?? 0,
            ),
          );
        } else {
          onNext!(createVehicleHandover);
        }
      },
      onPrevious: onPrevious,
    );
  }

  @override
  void onSuccessDismissed() {
    onNext!(createVehicleHandover);
  }

}
