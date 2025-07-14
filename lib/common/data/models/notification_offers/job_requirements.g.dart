// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_requirements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobRequirements _$JobRequirementsFromJson(Map<String, dynamic> json) =>
    JobRequirements(
      projectId: (json['projectId'] as num?)?.toInt(),
      ageFrom: (json['ageFrom'] as num?)?.toInt(),
      ageTo: (json['ageTo'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      lengthFrom: (json['lengthFrom'] as num?)?.toInt(),
      lengthTo: (json['lengthTo'] as num?)?.toInt(),
      wieghtFrom: (json['wieghtFrom'] as num?)?.toInt(),
      wieghtTo: (json['wieghtTo'] as num?)?.toInt(),
      hoursCount: (json['hoursCount'] as num?)?.toInt(),
      specialization: json['specialization'] as String?,
    );

Map<String, dynamic> _$JobRequirementsToJson(JobRequirements instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'gender': instance.gender,
      'lengthFrom': instance.lengthFrom,
      'lengthTo': instance.lengthTo,
      'wieghtFrom': instance.wieghtFrom,
      'wieghtTo': instance.wieghtTo,
      'hoursCount': instance.hoursCount,
      'specialization': instance.specialization,
    };
