// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_opp_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeOppParams _$EmployeeOppParamsFromJson(Map<String, dynamic> json) =>
    EmployeeOppParams(
      approvelLevelId: (json['approvelLevelId'] as num?)?.toInt(),
      actionType: (json['actionType'] as num?)?.toInt(),
      oppId: (json['oppId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmployeeOppParamsToJson(EmployeeOppParams instance) =>
    <String, dynamic>{
      'approvelLevelId': instance.approvelLevelId,
      'actionType': instance.actionType,
      'oppId': instance.oppId,
      'companyId': instance.companyId,
    };
