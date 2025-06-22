// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'punishment_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PunishmentTypeDto _$PunishmentTypeDtoFromJson(Map<String, dynamic> json) =>
    PunishmentTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PunishmentTypeDtoToJson(PunishmentTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
