// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'punishment_name_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PunishmentNameDto _$PunishmentNameDtoFromJson(Map<String, dynamic> json) =>
    PunishmentNameDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PunishmentNameDtoToJson(PunishmentNameDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
