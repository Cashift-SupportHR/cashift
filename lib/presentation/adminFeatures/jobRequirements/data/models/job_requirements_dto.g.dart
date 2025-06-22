// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_requirements_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobRequirementsDto _$JobRequirementsDtoFromJson(Map<String, dynamic> json) =>
    JobRequirementsDto(
      id: (json['id'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
      jobId: (json['jobId'] as num?)?.toInt(),
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
    );

Map<String, dynamic> _$JobRequirementsDtoToJson(JobRequirementsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobId': instance.jobId,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'jobName': instance.jobName,
    };
