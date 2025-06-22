// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModelDto _$JobModelDtoFromJson(Map<String, dynamic> json) => JobModelDto(
      id: (json['id'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$JobModelDtoToJson(JobModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobName': instance.jobName,
      'icon': instance.icon,
    };
