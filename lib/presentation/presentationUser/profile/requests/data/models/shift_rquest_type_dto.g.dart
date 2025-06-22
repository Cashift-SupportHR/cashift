// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_rquest_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftRquestTypeDto _$ShiftRquestTypeDtoFromJson(Map<String, dynamic> json) =>
    ShiftRquestTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ShiftRquestTypeDtoToJson(ShiftRquestTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
