import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/domain/entities/vehicle_component_handover.dart';

import '../../data/models/custody_handover_dto.dart';
import '../../data/models/index.dart';
import 'vehicleComponents.dart';

class CustodyHandover {
  int? id;
  int? vehicleCustodyId;
  String? vehicleCustodyName;
  int? custodyHandoverId;
  bool? custodyStatus;
  String? custodyStatusName;
  String? image;
  String? issueDescription;
  String? attachmentPath;

  CustodyHandover(
      {this.id,
      this.vehicleCustodyId,
      this.vehicleCustodyName,
      this.custodyHandoverId,
      this.custodyStatus,
      this.custodyStatusName,
      this.image,
      this.issueDescription,
      this.attachmentPath
      });

  factory CustodyHandover.fromDto(CustodyHandoverDto json) => CustodyHandover(
        id: json.id,
        vehicleCustodyId: json.vehicleCustodyId,
        vehicleCustodyName: json.vehicleCustodyName,
        custodyHandoverId: json.custodyHandoverId,
        custodyStatus: json.custodyStatus,
        custodyStatusName: json.custodyStatusName,
        image: json.image,
        issueDescription: json.issueDescription,
        attachmentPath: json.attachmentPath,
      );

  static List<CustodyHandover> fromDtoList(List<CustodyHandoverDto> list) {
    return list.map((e) => CustodyHandover.fromDto(e)).toList();
  }

  static List<VehicleComponentHandover> toVehiclesComponentsHandovers(List<CustodyHandover> list) {
    return list.map((e) => VehicleComponentHandover(
      id: e.id,
      vehicleComponentId: e.vehicleCustodyId,
      vehicleComponentName: e.vehicleCustodyName,
      vehicleHandoverId: e.custodyHandoverId,
      componentStatus: e.custodyStatus,
      componentStatusName: e.custodyStatusName,
      image: e.image,
      attachmentPath: e.attachmentPath,
      issueDescription: e.issueDescription,
    )).toList();
  }

  static List<VehicleComponents> toVehicleComponents(
      List<CustodyHandover> list) {
    return list
        .map((e) => VehicleComponents(
      id: e.vehicleCustodyId,
      name: e.vehicleCustodyName,
      description: e.issueDescription,
      image: e.attachmentPath,
      status: e.custodyStatus,
      isTrueAndSubmitted: e.custodyStatus == true && e.attachmentPath != null && e.attachmentPath!.isNotEmpty,
    ))
        .toList();
  }

  static List<int> getVehicleComponentIdsYES(List<VehicleComponentHandover> list) {
    return list
        .where((element) => element.componentStatus == true)
        .map((e) => e.vehicleComponentId!)
        .toList();
  }

  static List<int> getVehicleComponentIdsNO(List<VehicleComponentHandover> list) {
    return list
        .where((element) => element.componentStatus == false)
        .map((e) => e.vehicleComponentId!)
        .toList();
  }
}
