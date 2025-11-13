import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/bloc/receive_vehicle_details_state.dart';

import '../../../../../../../data/models/api_response.dart';
import '../../../../../../../data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../../adminFeatures/maintenanceAndBreakdowns/domain/entities/maintenance.dart';
import '../../../../../../adminFeatures/vehicles/domain/entities/vehicle_violation.dart';
import '../../../../../../shared/components/index.dart';
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

  StreamDataStateInitial<DriverViolation?> driverViolations =
      StreamDataStateInitial();
  StreamDataStateInitial<ContractViolationData?> violationsFactory =
      StreamDataStateInitial();
  StreamDataStateInitial<MaintenanceData?> maintenanceBreakdowns =
      StreamDataStateInitial();
  final StreamStateInitial<int?> countVehiclePerformance = StreamStateInitial();
  final StreamStateInitial<int?> vehicleTrueCustodiesCountStream =
      StreamStateInitial();
  final StreamStateInitial<int?> vehicleTrueComponentsCountStream =
      StreamStateInitial();
  final StreamStateInitial<int?> vehicleViolationsStream = StreamStateInitial();
  final StreamStateInitial<int?> contractViolationStream = StreamStateInitial();
  final StreamStateInitial<int?> maintenanceStream = StreamStateInitial();

  void fetchReceiveVehicleDetails(int id) {
    executeBuilder(
      () => repository.fetchReceiveVehicleDetails(id),
      onSuccess: (data) {
        vehicleTrueComponentsCountStream.setData(
          data.vehicleTrueComponentsCount,
        );
        vehicleTrueCustodiesCountStream.setData(data.vehicleTrueCustodiesCount);
        emit(
          ReceiveVehicleDetailsState(
            details: data,
            vehicleTrueComponentsCountStream: vehicleTrueComponentsCountStream,
            vehicleTrueCustodiesCountStream: vehicleTrueCustodiesCountStream,
            driverViolations: driverViolations,
            maintenanceBreakdowns: maintenanceBreakdowns,
            vehicleViolationsStream: vehicleViolationsStream,
            vehiclePerformanceStream: vehiclePerformanceStream,
            violationsFactory: violationsFactory,
            vehiclePerformanceCountStream: countVehiclePerformance,
            contractViolationStream: contractViolationStream,
            maintenanceStream: maintenanceStream,
          ),
        );
        fetchVehiclePerformance(data.id ?? 0);
        fetchDriverViolations(data.id ?? 0);
        fetchViolationsFactory(data.roundTripId ?? 0);
        fetchRoundsMaintenance(data.roundTripId ?? 0);
      },
    );
  }

  void fetchVehiclePerformance(int id) {
    try {
      vehiclePerformanceStream.start();

      vehiclePerformanceStream.setFutureData(() async {
        VehiclePerformance data = await repository.fetchVehiclePerformance(id);
        countVehiclePerformance.setData(data.count);
        return data;
      });
    } catch (e) {
      vehiclePerformanceStream.setError(e);
    }
  }

  void fetchViolationsFactory(int roundTripId) {
    try {
      violationsFactory.start();
      violationsFactory.setFutureData(() async {
        ContractViolationData data = await repository.fetchRoundViolation(
          roundTripId,
        );

        contractViolationStream.setData(data.count);
        return data;
      });
    } catch (e) {
      violationsFactory.setError(e);
    }
  }

  void fetchRoundsMaintenance(int roundTripId) {
    try {
      maintenanceBreakdowns.start();
      maintenanceBreakdowns.setFutureData(() async {
        MaintenanceData data = await repository.fetchRoundsMaintenance(
          roundTripId,
        );
        maintenanceStream.setData(data.count);
        return data;
      });
    } catch (e) {
      maintenanceBreakdowns.setError(e);
    }
  }

  void fetchDriverViolations(int id) {
    try {
      driverViolations.start();
      driverViolations.setFutureData(() async {
        DriverViolation data = await repository.fetchDriverViolations(id);
        vehicleViolationsStream.setData(data.count);
        return data;
      });
    } catch (e) {
      driverViolations.setError(e);
    }
  }

  void downloadVehicleViolationPicture(
    DownloadVehicleViolationPictureParams params,
  ) {
    executeListener(
      () => repository.downloadVehicleViolationPicture(params),
      onSuccess: (ApiResponse api) async {
        emit((SuccessStateListener(data: api.payload.toString())));
      },
    );
  }
}
