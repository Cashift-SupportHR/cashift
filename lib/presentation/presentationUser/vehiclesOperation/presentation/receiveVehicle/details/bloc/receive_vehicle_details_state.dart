import '../../../../../../adminFeatures/maintenanceAndBreakdowns/domain/entities/maintenance.dart';
import '../../../../../../adminFeatures/vehicles/domain/entities/vehicle_violation.dart';
import '../../../../../common/common_state.dart';
import '../../../../../common/stream_data_state.dart';
import '../../../../domain/entities/driver_violation.dart';
import '../../../../domain/entities/receive_vehicle_details.dart';
import '../../../../domain/entities/vehicle_performance.dart';

class ReceiveVehicleDetailsState extends CommonStateFBuilder {
  final ReceiveVehicleDetails details;
  final StreamDataState<VehiclePerformance?> vehiclePerformanceStream;
  final StreamDataState<DriverViolation?> driverViolations;
  final StreamDataState<ContractViolationData?> violationsFactory;
  final StreamDataState<MaintenanceData?> maintenanceBreakdowns;
  final StreamStateInitial<int?> vehiclePerformanceCountStream;
  final StreamStateInitial<int?> vehicleTrueCustodiesCountStream;
  final StreamStateInitial<int?> vehicleTrueComponentsCountStream;
  final StreamStateInitial<int?> vehicleViolationsStream;
  final StreamStateInitial<int?> contractViolationStream;
  final StreamStateInitial<int?> maintenanceStream;

  ReceiveVehicleDetailsState({
    required this.details,
    required this.vehicleTrueCustodiesCountStream,
    required this.vehicleTrueComponentsCountStream,
    required this.vehicleViolationsStream,
    required this.vehiclePerformanceStream,
    required this.contractViolationStream,
    required this.vehiclePerformanceCountStream,
    required this.driverViolations,
    required this.maintenanceBreakdowns,
    required this.maintenanceStream,
    required this.violationsFactory,
  });
}
