// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingDetailsDto _$PricingDetailsDtoFromJson(Map<String, dynamic> json) =>
    PricingDetailsDto(
      id: (json['id'] as num?)?.toInt(),
      seasonseId: (json['seasonseId'] as num?)?.toInt(),
      seasonseName: json['seasonseName'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
      fromDay: (json['fromDay'] as num?)?.toInt(),
      toDay: (json['toDay'] as num?)?.toInt(),
      salary: (json['salary'] as num?)?.toDouble(),
      setAsDefault: json['setAsDefault'] as bool?,
      isAllowEditPrice: json['isAllowEditPrice'] as bool?,
      jobId: (json['jobId'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
    );

Map<String, dynamic> _$PricingDetailsDtoToJson(PricingDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seasonseId': instance.seasonseId,
      'seasonseName': instance.seasonseName,
      'projectId': instance.projectId,
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
      'fromDay': instance.fromDay,
      'toDay': instance.toDay,
      'salary': instance.salary,
      'setAsDefault': instance.setAsDefault,
      'isAllowEditPrice': instance.isAllowEditPrice,
      'jobId': instance.jobId,
      'jobName': instance.jobName,
    };
