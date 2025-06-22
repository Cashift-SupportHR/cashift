// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shifts_by_project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftsByProjectDto _$ShiftsByProjectDtoFromJson(Map<String, dynamic> json) =>
    ShiftsByProjectDto(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      shiftName: json['shiftName'] as String?,
    );

Map<String, dynamic> _$ShiftsByProjectDtoToJson(ShiftsByProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'jobId': instance.jobId,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'shiftName': instance.shiftName,
    };
