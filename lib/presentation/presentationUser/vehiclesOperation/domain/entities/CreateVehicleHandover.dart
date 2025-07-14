
import '../../data/models/index.dart';

class CreateVehicleHandover {
  CreateVehicleHandover({
    this.vehicleId,
    this.companyId,
    this.projectId,
    this.shiftId,
    this.id,
    this.isComplete,
  });

  int? vehicleId;

  int? companyId;
  int? projectId;
  int? shiftId;
  int? id;
  bool? isComplete;

  factory CreateVehicleHandover.fromDto(CreateVehicleHandoverDto json) {
    return CreateVehicleHandover(
      vehicleId: json.vehicleId,
      id: json.id,
      companyId: json.companyId,
      projectId: json.projectId,
      shiftId: json.shiftId,
      isComplete: json.isComplete,
    );
  }
}
