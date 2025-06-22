// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_condition_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractConditionParams _$ContractConditionParamsFromJson(
        Map<String, dynamic> json) =>
    ContractConditionParams(
      projectId: (json['projectId'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContractConditionParamsToJson(
        ContractConditionParams instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'jobId': instance.jobId,
    };
