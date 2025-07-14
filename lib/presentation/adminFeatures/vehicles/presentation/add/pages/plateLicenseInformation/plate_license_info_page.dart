import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/presentation/add/pages/plateLicenseInformation/plate_license_info_screen.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item.dart';

import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../data/models/add_vehicle_params.dart';
import '../../../../domain/entities/index.dart';
import '../../bloc/vehicle_plate_license_info_cubit.dart';
class PlateLicenseInfoPage
    extends BaseBlocWidget<Initialized<List<CommonListItem>>, VehiclePlateLicenseInfoCubit> {
  final Function(int projectId)? onNext;
  final Function()? onPrevious;
  final AddVehicleParams Function() onParamsCallback;
  final VehicleDetails? Function() onInitialDataCallback;

  PlateLicenseInfoPage({Key? key, required this.onParamsCallback, this.onNext, this.onPrevious, required this.onInitialDataCallback}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    print("onNext from BasicVehicleInformationPage ${onParamsCallback().toJson()}");
    bloc.fetchAllaData();
  }


  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<CommonListItem>> state) {
    AddVehicleParams params = onParamsCallback();
    return VehiclePlateLicenseInfoScreen(
      colors: state.data,
      initialData: onInitialDataCallback(),
      onAddVehicle: (valueParams) {
        params.id = onInitialDataCallback()?.id;
        params.plateNumber = valueParams.plateNumber;
        params.licenseNumber = valueParams.licenseNumber;
        params.vehicleColorId = valueParams.vehicleColorId;
        params.licenseExpiryDate = valueParams.licenseExpiryDate;
        params.vehicleImageFile = valueParams.vehicleImageFile;
        params.mobileVehicleIndexCode = valueParams.mobileVehicleIndexCode;
        print("onNext from BasicVehicleInformationPage ${params.toJson()}");
        bloc.addVehicle(params);
      },
      onPrevious: () {
        onPrevious!();
      },
    );
  }

  @override
  void onSuccessDataState(data) {
    // data may be int or string(message success)
    print('onAddVehicle onSuccessDataState $data');
    if (data is int) {
      if (onNext != null) {
        onNext!(data);
      }
    } else {
      super.onSuccessDataState(data);
    }
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
  }

}
