// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arrival_departure_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArrivalDepartureTypeDto _$ArrivalDepartureTypeDtoFromJson(
        Map<String, dynamic> json) =>
    ArrivalDepartureTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$ArrivalDepartureTypeDtoToJson(
        ArrivalDepartureTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'icon': instance.icon,
    };
