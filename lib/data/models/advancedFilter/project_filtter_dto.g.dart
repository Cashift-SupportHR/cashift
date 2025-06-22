// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_filtter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectFiltterDto _$ProjectFiltterDtoFromJson(Map<String, dynamic> json) =>
    ProjectFiltterDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectFiltterDtoToJson(ProjectFiltterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
