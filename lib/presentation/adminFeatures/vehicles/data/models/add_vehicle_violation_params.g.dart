// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_violation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddVehicleViolationParams _$AddVehicleViolationParamsFromJson(
        Map<String, dynamic> json) =>
    AddVehicleViolationParams(
      id: json['id'] as int?,
      details: json['details'] as String?,
      companyName: json['companyName'] as String?,
      streetName: json['streetName'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      contractViolationTypeId: json['contractViolationTypeId'] as int?,
    );

Map<String, dynamic> _$AddVehicleViolationParamsToJson(
        AddVehicleViolationParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'details': instance.details,
      'companyName': instance.companyName,
      'streetName': instance.streetName,
      'lat': instance.lat,
      'lng': instance.lng,
      'contractViolationTypeId': instance.contractViolationTypeId,
    };
