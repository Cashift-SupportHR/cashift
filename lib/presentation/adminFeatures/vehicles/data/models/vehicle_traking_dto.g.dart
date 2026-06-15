// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_traking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleTrakingDto _$VehicleTrakingDtoFromJson(Map<String, dynamic> json) =>
    VehicleTrakingDto(
      vehicleEventsCount: (json['vehicleEventsCount'] as num?)?.toInt(),
      drivers: (json['drivers'] as List<dynamic>?)
          ?.map((e) => Driver.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicleEvents: (json['vehicleEvents'] as List<dynamic>?)
          ?.map((e) => VehicleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicleGPSDetails: json['vehicleGPSDetails'] == null
          ? null
          : VehicleGPSDetails.fromJson(
              json['vehicleGPSDetails'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VehicleTrakingDtoToJson(VehicleTrakingDto instance) =>
    <String, dynamic>{
      'vehicleEventsCount': instance.vehicleEventsCount,
      'drivers': instance.drivers,
      'vehicleEvents': instance.vehicleEvents,
      'vehicleGPSDetails': instance.vehicleGPSDetails,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
  freelancerInfoId: (json['freelancerInfoId'] as num?)?.toInt(),
  freelancerInfoName: json['freelancerInfoName'] as String?,
  projectId: (json['projectId'] as num?)?.toInt(),
  projectName: json['projectName'] as String?,
  shiftId: (json['shiftId'] as num?)?.toInt(),
  shiftName: json['shiftName'] as String?,
);

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
  'freelancerInfoId': instance.freelancerInfoId,
  'freelancerInfoName': instance.freelancerInfoName,
  'projectId': instance.projectId,
  'projectName': instance.projectName,
  'shiftId': instance.shiftId,
  'shiftName': instance.shiftName,
};

VehicleEvent _$VehicleEventFromJson(Map<String, dynamic> json) => VehicleEvent(
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

Map<String, dynamic> _$VehicleEventToJson(VehicleEvent instance) =>
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

VehicleGPSDetails _$VehicleGPSDetailsFromJson(Map<String, dynamic> json) =>
    VehicleGPSDetails(
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxSpeed: (json['maxSpeed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehicleGPSDetailsToJson(VehicleGPSDetails instance) =>
    <String, dynamic>{
      'details': instance.details,
      'maxSpeed': instance.maxSpeed,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  time: json['time'] as String?,
  speed: (json['speed'] as num?)?.toInt(),
  direction: (json['direction'] as num?)?.toInt(),
);

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'time': instance.time,
  'speed': instance.speed,
  'direction': instance.direction,
};
