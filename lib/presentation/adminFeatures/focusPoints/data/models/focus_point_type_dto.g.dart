// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_point_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusPointTypeDto _$FocusPointTypeDtoFromJson(Map<String, dynamic> json) =>
    FocusPointTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FocusPointTypeDtoToJson(FocusPointTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
