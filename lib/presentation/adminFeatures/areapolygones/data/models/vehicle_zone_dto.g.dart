// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_zone_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleZoneDto _$VehicleZoneDtoFromJson(Map<String, dynamic> json) =>
    VehicleZoneDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      expectedHours: (json['expectedHours'] as num?)?.toInt(),
      expectedMinutes: (json['expectedMinutes'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      shiftId: (json['shiftId'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
      vehicleId: (json['vehicleId'] as num?)?.toInt(),
      plateNumber: json['plateNumber'] as String?,
      latlngs: (json['latlngs'] as List<dynamic>?)
          ?.map((e) => VehicleZoneLatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleZoneDtoToJson(VehicleZoneDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'expectedHours': instance.expectedHours,
      'expectedMinutes': instance.expectedMinutes,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
      'vehicleId': instance.vehicleId,
      'plateNumber': instance.plateNumber,
      'latlngs': instance.latlngs,
    };
