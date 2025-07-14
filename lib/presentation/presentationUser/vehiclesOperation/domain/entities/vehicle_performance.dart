import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/models/index.dart';
import '../../data/models/vehicle_performance_dto.dart';

class VehiclePerformance {
  int? maxSpeed;
  List<VehiclePerformanceDetails>? detailsList;

  VehiclePerformance({
    this.maxSpeed,
    this.detailsList,
  });

  factory VehiclePerformance.fromDto(VehiclePerformanceDto dto) => VehiclePerformance(
        maxSpeed: dto.maxSpeed,
        detailsList: dto.detailsList,
  );

  static List<VehiclePerformance> fromDtoList(List<VehiclePerformanceDto> dtos) =>
      dtos.map((dto) => VehiclePerformance.fromDto(dto)).toList();

  List<LatLng> get latlongs => detailsList!.map((e) => LatLng(
    e.latitude ?? 0.0,
    e.longitude ?? 0.0
  )).toList();
}
