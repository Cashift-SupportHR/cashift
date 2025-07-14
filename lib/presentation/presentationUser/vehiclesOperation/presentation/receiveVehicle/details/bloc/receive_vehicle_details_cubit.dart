import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/bloc/receive_vehicle_details_state.dart';

import '../../../../../../../common/data/models/api_response.dart';
import '../../../../../../../common/data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../../../common/components/index.dart';
import '../../../../../common/common_state.dart';
import '../../../../../common/stream_data_state.dart';
import '../../../../data/models/download_vehicle_violation_picture_params.dart';
import '../../../../data/repositories/vehicles_operation_repository.dart';
import '../../../../domain/entities/driver_violation.dart';
import '../../../../domain/entities/vehicle_performance.dart';

@Injectable()
class ReceiveVehicleDetailsCubit extends BaseCubit {
  final ReceiveVehiclesRepository repository;

  ReceiveVehicleDetailsCubit(this.repository);

  StreamDataStateInitial<VehiclePerformance?> vehiclePerformanceStream =
      StreamDataStateInitial();
  StreamDataStateInitial<List<DriverViolation>?> driverViolations =
      StreamDataStateInitial();

  void fetchReceiveVehicleDetails(int id) {
    executeBuilder(() => repository.fetchReceiveVehicleDetails(id),
        onSuccess: (data) {
      emit(ReceiveVehicleDetailsState(
        details: data,
        driverViolations: driverViolations,
        vehiclePerformanceStream: vehiclePerformanceStream,
      ));
    });
  }

  void fetchVehiclePerformance(int id) {
    try {
      vehiclePerformanceStream.start();
      vehiclePerformanceStream
          .setFutureData(() => repository.fetchVehiclePerformance(id));
    } catch (e) {
      vehiclePerformanceStream.setError(e);
    }
  }

  void fetchDriverViolations(int id) {
    try {
      driverViolations.start();
      driverViolations
          .setFutureData(() => repository.fetchDriverViolations(id));
    } catch (e) {
      driverViolations.setError(e);
    }
  }

  void downloadVehicleViolationPicture(
      DownloadVehicleViolationPictureParams params) {
    executeListener(() => repository.downloadVehicleViolationPicture(params),
        onSuccess: (ApiResponse api) async {
      emit((SuccessStateListener(data: api.payload.toString())));
    });
  }
}
