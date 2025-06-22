// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_opportunity_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeesOpportunityParams _$EmployeesOpportunityParamsFromJson(
        Map<String, dynamic> json) =>
    EmployeesOpportunityParams(
      approvelLevelId: (json['approvelLevelId'] as num?)?.toInt(),
      actionType: (json['actionType'] as num?)?.toInt(),
      oppId: (json['oppId'] as num?)?.toInt(),
      isAllEmployees: (json['iaAllEmployees'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$EmployeesOpportunityParamsToJson(
        EmployeesOpportunityParams instance) =>
    <String, dynamic>{
      'approvelLevelId': instance.approvelLevelId,
      'actionType': instance.actionType,
      'oppId': instance.oppId,
      'companyId': instance.companyId,
      'iaAllEmployees': instance.isAllEmployees,
      'title': instance.title,
    };
