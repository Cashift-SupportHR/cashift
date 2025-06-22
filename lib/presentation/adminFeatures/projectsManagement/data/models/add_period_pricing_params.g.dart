// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_period_pricing_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPeriodPricingParams _$AddPeriodPricingParamsFromJson(
        Map<String, dynamic> json) =>
    AddPeriodPricingParams(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      seasonseId: (json['seasonseId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      fromDay: (json['fromDay'] as num?)?.toInt(),
      toDay: (json['toDay'] as num?)?.toInt(),
      salary: (json['salary'] as num?)?.toInt(),
      setAsDefault: json['setAsDefault'] as bool?,
      isAllowEditPrice: json['isAllowEditPrice'] as bool?,
      jobId: (json['jobId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddPeriodPricingParamsToJson(
        AddPeriodPricingParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'seasonseId': instance.seasonseId,
      'projectId': instance.projectId,
      'shiftId': instance.shiftId,
      'fromDay': instance.fromDay,
      'toDay': instance.toDay,
      'salary': instance.salary,
      'setAsDefault': instance.setAsDefault,
      'isAllowEditPrice': instance.isAllowEditPrice,
      'jobId': instance.jobId,
    };
