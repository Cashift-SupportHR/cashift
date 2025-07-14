// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_skills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobSkills _$JobSkillsFromJson(Map<String, dynamic> json) => JobSkills(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$JobSkillsToJson(JobSkills instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
    };
