// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_work_hazard_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWorkHazardParams _$AddWorkHazardParamsFromJson(Map<String, dynamic> json) =>
    AddWorkHazardParams(
      id: (json['id'] as num?)?.toInt(),
      hazardPriorityLevelId: (json['hazardPriorityLevelId'] as num?)?.toInt(),
      hazardTypeId: (json['hazardTypeId'] as num?)?.toInt(),
      hazardSatusId: (json['hazardSatusId'] as num?)?.toInt(),
      hazardStatusName: json['hazardStatusName'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AddWorkHazardParamsToJson(
        AddWorkHazardParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hazardPriorityLevelId': instance.hazardPriorityLevelId,
      'hazardTypeId': instance.hazardTypeId,
      'hazardSatusId': instance.hazardSatusId,
      'hazardStatusName': instance.hazardStatusName,
      'projectId': instance.projectId,
      'companyId': instance.companyId,
      'shiftId': instance.shiftId,
      'description': instance.description,
    };
