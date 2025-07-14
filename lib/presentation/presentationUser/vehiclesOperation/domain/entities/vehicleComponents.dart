
import '../../data/models/index.dart';

class VehicleComponents {
  VehicleComponents({
    this.id,
    this.name,
    this.description,
    this.image,
    this.status,
    this.isTrueAndSubmitted,
  });

  int? id;
  String? name;
  String? description;
  String? image;
  bool? status;
  // This use if user change question to yes and submit
  bool? isTrueAndSubmitted;

  factory VehicleComponents.fromDto(VehicleComponentsDto json) {
    return VehicleComponents(
      name: json.name,
      id: json.id,
      description: json.description,
    );
  }

  static List<VehicleComponents> fromDtoList(List<VehicleComponentsDto> json) {
    return json.map((e) => VehicleComponents.fromDto(e)).toList();
  }

  static List<int> getVehicleComponentIdsYES(List<VehicleComponents> list) {
    return list
        .where((element) => element.status == true)
        .map((e) => e.id ?? 0)
        .toList();
  }

  static List<int> getVehicleComponentIdsNO(List<VehicleComponents> list) {
    return list
        .where((element) => element.status == false)
        .map((e) => e.id ?? 0)
        .toList();
  }
}
