
import '../../data/models/index.dart';
import '../../data/models/vehicle_component_handover_dto.dart';
import 'vehicleComponents.dart';

class VehicleComponentHandover {
  int? id;
  int? vehicleComponentId;
  String? vehicleComponentName;
  int? vehicleHandoverId;
  bool? componentStatus;
  String? componentStatusName;
  String? image;
  String? issueDescription;
  String? attachmentPath;

  VehicleComponentHandover(
      {this.id,
      this.vehicleComponentId,
      this.vehicleComponentName,
      this.vehicleHandoverId,
      this.componentStatus,
      this.componentStatusName,
      this.image,
      this.issueDescription,
      this.attachmentPath});

  factory VehicleComponentHandover.fromDto(VehicleComponentHandoverDto json) =>
      VehicleComponentHandover(
        id: json.id,
        vehicleComponentId: json.vehicleComponentId,
        vehicleComponentName: json.vehicleComponentName,
        vehicleHandoverId: json.vehicleHandoverId,
        componentStatus: json.componentStatus,
        componentStatusName: json.componentStatusName,
        image: json.image,
        issueDescription: json.issueDescription,
        attachmentPath: json.attachmentPath,
      );

  static List<VehicleComponentHandover> fromDtoList(
      List<VehicleComponentHandoverDto> list) {
    return list.map((e) => VehicleComponentHandover.fromDto(e)).toList();
  }

  static List<VehicleComponents> toVehicleComponents(
      List<VehicleComponentHandover> list) {
    return list
        .map((e) => VehicleComponents(
              id: e.vehicleComponentId,
              name: e.vehicleComponentName,
              description: e.issueDescription,
              image: e.attachmentPath,
              status: e.componentStatus,
              isTrueAndSubmitted: e.componentStatus == true &&
                  e.attachmentPath != null &&
                  e.attachmentPath!.isNotEmpty,
            ))
        .toList();
  }

  static List<VehicleComponentHandover> fromVehicleComponents(
      List<VehicleComponents> list) {
    return list
        .map((e) => VehicleComponentHandover(
              id: e.id,
              attachmentPath: e.image,
              issueDescription: e.description,
              vehicleComponentName: e.name,
              image: e.image,
              vehicleComponentId: e.id,
              vehicleHandoverId: 0,
              componentStatus: e.status,
            ))
        .toList();
  }

  static List<int> getVehicleComponentIdsYES(
      List<VehicleComponentHandover> list) {
    return list
        .where((element) => element.componentStatus == true)
        .map((e) => e.vehicleComponentId!)
        .toList();
  }

  static List<int> getVehicleComponentIdsNO(
      List<VehicleComponentHandover> list) {
    return list
        .where((element) => element.componentStatus == false)
        .map((e) => e.vehicleComponentId!)
        .toSet()
        .toList();
  }
}
