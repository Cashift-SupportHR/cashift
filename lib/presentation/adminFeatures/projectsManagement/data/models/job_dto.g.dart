// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDto _$JobDtoFromJson(Map<String, dynamic> json) => JobDto(
      id: (json['id'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
    );

Map<String, dynamic> _$JobDtoToJson(JobDto instance) => <String, dynamic>{
      'id': instance.id,
      'jobName': instance.jobName,
    };
