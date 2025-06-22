// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_employe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectEmployeDto _$ProjectEmployeDtoFromJson(Map<String, dynamic> json) =>
    ProjectEmployeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectEmployeDtoToJson(ProjectEmployeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
