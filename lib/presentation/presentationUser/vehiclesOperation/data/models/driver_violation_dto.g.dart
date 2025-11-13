// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_violation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverViolationDto _$DriverViolationDtoFromJson(Map<String, dynamic> json) =>
    DriverViolationDto(
      vehicleEvents: (json['vehicleEvents'] as List<dynamic>?)
          ?.map((e) => VehicleEvents.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DriverViolationDtoToJson(DriverViolationDto instance) =>
    <String, dynamic>{
      'vehicleEvents': instance.vehicleEvents,
      'count': instance.count,
    };

VehicleEvents _$VehicleEventsFromJson(Map<String, dynamic> json) =>
    VehicleEvents(
      eventIndexCode: json['eventIndexCode'] as String?,
      eventType: json['eventType'] as String?,
      mobilevehicleIndexCode: (json['mobilevehicleIndexCode'] as num?)?.toInt(),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      speed: (json['speed'] as num?)?.toInt(),
      time: json['time'] as String?,
      isAllowPicture: json['isAllowPicture'] as bool?,
      companyId: (json['companyId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$VehicleEventsToJson(VehicleEvents instance) =>
    <String, dynamic>{
      'eventIndexCode': instance.eventIndexCode,
      'eventType': instance.eventType,
      'mobilevehicleIndexCode': instance.mobilevehicleIndexCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'speed': instance.speed,
      'time': instance.time,
      'isAllowPicture': instance.isAllowPicture,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'address': instance.address,
    };
