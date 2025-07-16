import 'package:json_annotation/json_annotation.dart';

part 'driver_violation_dto.g.dart';

@JsonSerializable()
class DriverViolationDto {
  @JsonKey(name: "vehicleEvents")
  final List<VehicleEvents>? vehicleEvents;
  @JsonKey(name: "count")
  final int? count;

  DriverViolationDto ({
    this.vehicleEvents,
    this.count,
  });

  factory DriverViolationDto.fromJson(Map<String, dynamic> json) {
    return _$DriverViolationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverViolationDtoToJson(this);
  }
}

@JsonSerializable()
class VehicleEvents {
  @JsonKey(name: "eventIndexCode")
  final String? eventIndexCode;
  @JsonKey(name: "eventType")
  final String? eventType;
  @JsonKey(name: "mobilevehicleIndexCode")
  final int? mobilevehicleIndexCode;
  @JsonKey(name: "latitude")
  final String? latitude;
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "speed")
  final int? speed;
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "isAllowPicture")
  final bool? isAllowPicture;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "companyName")
  final String? companyName;
  @JsonKey(name: "address")
  final String? address;

  VehicleEvents ({
    this.eventIndexCode,
    this.eventType,
    this.mobilevehicleIndexCode,
    this.latitude,
    this.longitude,
    this.speed,
    this.time,
    this.isAllowPicture,
    this.companyId,
    this.companyName,
    this.address,
  });

  factory VehicleEvents.fromJson(Map<String, dynamic> json) {
    return _$VehicleEventsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehicleEventsToJson(this);
  }
}


