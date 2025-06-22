// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_period_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingPeriodDto _$WorkingPeriodDtoFromJson(Map<String, dynamic> json) =>
    WorkingPeriodDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      startTime: json['startTime'] as String?,
    );

Map<String, dynamic> _$WorkingPeriodDtoToJson(WorkingPeriodDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startTime': instance.startTime,
    };
