// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_conditions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractConditionsDto _$ContractConditionsDtoFromJson(
        Map<String, dynamic> json) =>
    ContractConditionsDto(
      id: (json['id'] as num?)?.toInt(),
      conditionNumber: json['conditionNumber'] as String?,
      maxHours: (json['maxHours'] as num?)?.toInt(),
      isAddLastHours: json['isAddLastHours'] as bool?,
      lastHours: (json['lastHours'] as num?)?.toInt(),
      isAllowEditTime: json['isAllowEditTime'] as bool?,
      startAllowMinutes: (json['startAllowMinutes'] as num?)?.toInt(),
      endAllowMinutes: (json['endAllowMinutes'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      allowEditDateOpp: json['allowEditDateOpp'] as bool?,
    );

Map<String, dynamic> _$ContractConditionsDtoToJson(
        ContractConditionsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conditionNumber': instance.conditionNumber,
      'maxHours': instance.maxHours,
      'isAddLastHours': instance.isAddLastHours,
      'lastHours': instance.lastHours,
      'isAllowEditTime': instance.isAllowEditTime,
      'startAllowMinutes': instance.startAllowMinutes,
      'endAllowMinutes': instance.endAllowMinutes,
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'jobId': instance.jobId,
      'allowEditDateOpp': instance.allowEditDateOpp,
    };
