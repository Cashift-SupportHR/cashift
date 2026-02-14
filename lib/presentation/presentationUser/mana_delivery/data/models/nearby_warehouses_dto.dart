import 'package:json_annotation/json_annotation.dart';

part 'nearby_warehouses_dto.g.dart';

@JsonSerializable()
class NearbyWarehousesDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "distanceKm")
  final double? distanceKm;
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;
  @JsonKey(name: "mapUrl")
  final String? mapUrl;
  @JsonKey(name: "fullAddress")
  final String? fullAddress;
  @JsonKey(name: "managerPhone")
  final String? managerPhone;
  @JsonKey(name: "cityName")
  final String? cityName;
  @JsonKey(name: "districtName")
  final String? districtName;

  NearbyWarehousesDto ({
    this.id,
    this.name,
    this.distanceKm,
    this.latitude,
    this.longitude,
    this.mapUrl,
    this.fullAddress,
    this.managerPhone,
    this.cityName,
    this.districtName,
  });

  factory NearbyWarehousesDto.fromJson(Map<String, dynamic> json) {
    return _$NearbyWarehousesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NearbyWarehousesDtoToJson(this);
  }
}


