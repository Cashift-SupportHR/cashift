// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_general_violation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddGeneralViolationParams _$AddGeneralViolationParamsFromJson(
        Map<String, dynamic> json) =>
    AddGeneralViolationParams(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      scheduleViolationId: (json['scheduleViolationId'] as num?)?.toInt(),
      scheduleEmployeeWorkId: (json['scheduleEmployeeWorkId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddGeneralViolationParamsToJson(
        AddGeneralViolationParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'companyId': instance.companyId,
      'shiftId': instance.shiftId,
      'scheduleViolationId': instance.scheduleViolationId,
      'scheduleEmployeeWorkId': instance.scheduleEmployeeWorkId,
    };
