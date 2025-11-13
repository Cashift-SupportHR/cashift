import 'package:json_annotation/json_annotation.dart'; 

part 'vehicle_performance_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class VehiclePerformanceDto {
  @JsonKey(name: 'maxSpeed')
  int? maxSpeed;
  @JsonKey(name: 'count')
  int? count;
  @JsonKey(name: 'details')
  List<VehiclePerformanceDetails>? detailsList;

  VehiclePerformanceDto({this.detailsList,this.count, this.maxSpeed});

  factory VehiclePerformanceDto.fromJson(Map<String, dynamic> json) => _$VehiclePerformanceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VehiclePerformanceDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class VehiclePerformanceDetails {
  @JsonKey(name: 'time')
  String? time;
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;
  @JsonKey(name: 'speed')
  int? speed;

  VehiclePerformanceDetails({this.time, this.latitude, this.longitude, this.speed});

   factory VehiclePerformanceDetails.fromJson(Map<String, dynamic> json) => _$VehiclePerformanceDetailsFromJson(json);

   Map<String, dynamic> toJson() => _$VehiclePerformanceDetailsToJson(this);
}