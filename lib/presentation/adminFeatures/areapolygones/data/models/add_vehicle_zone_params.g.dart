// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_zone_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddVehicleZoneParams _$AddVehicleZoneParamsFromJson(
        Map<String, dynamic> json) =>
    AddVehicleZoneParams(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      expectedHours: (json['expectedHours'] as num?)?.toInt(),
      expectedMinutes: (json['expectedMinutes'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      vehicleId: (json['vehicleId'] as num?)?.toInt(),
      latlngs: (json['latlngs'] as List<dynamic>?)
          ?.map((e) => VehicleZoneLatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddVehicleZoneParamsToJson(
        AddVehicleZoneParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'expectedHours': instance.expectedHours,
      'expectedMinutes': instance.expectedMinutes,
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'shiftId': instance.shiftId,
      'vehicleId': instance.vehicleId,
      if (instance.latlngs case final value?) 'latlngs': value,
    };

VehicleZoneLatLng _$VehicleZoneLatLngFromJson(Map<String, dynamic> json) =>
    VehicleZoneLatLng(
      lat: json['lat'] as num?,
      lng: json['lng'] as num?,
    );

Map<String, dynamic> _$VehicleZoneLatLngToJson(VehicleZoneLatLng instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
