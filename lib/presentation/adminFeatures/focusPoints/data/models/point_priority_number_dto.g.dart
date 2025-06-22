// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_priority_number_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointPriorityNumberDto _$PointPriorityNumberDtoFromJson(
        Map<String, dynamic> json) =>
    PointPriorityNumberDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PointPriorityNumberDtoToJson(
        PointPriorityNumberDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
