// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => ProjectDto(
      id: (json['id'] as num).toInt(),
      projectName: json['projectName'] as String?,
      address: json['address'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$ProjectDtoToJson(ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'logo': instance.logo,
      'address': instance.address,
    };
