import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/receive_vehicle_details_screen.dart';
import '../../../../../../../core/services/routes.dart';
import '../../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/models/download_vehicle_violation_picture_params.dart';
import '../../../../domain/entities/receive_vehicle_details.dart';
import '../bloc/receive_vehicle_details_cubit.dart';
import '../bloc/receive_vehicle_details_state.dart';

class ReceiveVehicleDetailsPage
    extends BaseBlocWidget<ReceiveVehicleDetailsState, ReceiveVehicleDetailsCubit> {
  @override
  loadInitialData(BuildContext context) {
    int id = getArguments(context);
    bloc.fetchReceiveVehicleDetails(id);
  }

  @override
  String? title(BuildContext context) {
    return strings.receive_vehicle_details;
  }

  @override
  Widget buildWidget(BuildContext context, ReceiveVehicleDetailsState state) {
    return ReceiveVehicleDetailsScreen(
      state: state,
      onFetchVehiclePerformance: (id) => bloc.fetchVehiclePerformance(id),
      onFetchDriverViolations: (id) => bloc.fetchDriverViolations(id),
      onDownloadViolationPicture: (DownloadVehicleViolationPictureParams params){
        bloc.downloadVehicleViolationPicture(params);
      }
    );
  }

  @override
  void onSuccessDataState(data) {
    print('onSuccessDataState: $data');
    String img64 = data as String;
    Navigator.pushNamed(
      context,
      Routes.filesPreviewPage,
      arguments: [img64],
    );
  }
}
