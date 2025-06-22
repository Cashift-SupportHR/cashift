// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_uniform_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobUniformTypeDto _$JobUniformTypeDtoFromJson(Map<String, dynamic> json) =>
    JobUniformTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$JobUniformTypeDtoToJson(JobUniformTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
