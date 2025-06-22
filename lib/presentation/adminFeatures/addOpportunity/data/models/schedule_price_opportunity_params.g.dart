// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_price_opportunity_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulePriceOpportunityParams _$SchedulePriceOpportunityParamsFromJson(
        Map<String, dynamic> json) =>
    SchedulePriceOpportunityParams(
      comapnyId: (json['comapnyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      workDate: json['workDate'] as String?,
    );

Map<String, dynamic> _$SchedulePriceOpportunityParamsToJson(
        SchedulePriceOpportunityParams instance) =>
    <String, dynamic>{
      'comapnyId': instance.comapnyId,
      'projectId': instance.projectId,
      'jobId': instance.jobId,
      'shiftId': instance.shiftId,
      'workDate': instance.workDate,
    };
