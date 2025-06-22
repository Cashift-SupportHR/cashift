// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_components_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleComponentsDto _$VehicleComponentsDtoFromJson(
        Map<String, dynamic> json) =>
    VehicleComponentsDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$VehicleComponentsDtoToJson(
        VehicleComponentsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
