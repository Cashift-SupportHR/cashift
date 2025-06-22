// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_working_period_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWorkingPeriodParams _$AddWorkingPeriodParamsFromJson(
        Map<String, dynamic> json) =>
    AddWorkingPeriodParams(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
      shiftHeadId: (json['shiftHeadId'] as num?)?.toInt(),
      shiftHeadName: json['shiftHeadName'] as String?,
      shiftEn: json['shiftEn'] as String?,
      shiftAr: json['shiftAr'] as String?,
      hoursCount: (json['hoursCount'] as num?)?.toInt(),
      startTime: json['startTime'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      contractualNumber: (json['contractualNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddWorkingPeriodParamsToJson(
        AddWorkingPeriodParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'jobId': instance.jobId,
      'jobName': instance.jobName,
      'shiftHeadId': instance.shiftHeadId,
      'shiftHeadName': instance.shiftHeadName,
      'shiftEn': instance.shiftEn,
      'shiftAr': instance.shiftAr,
      'hoursCount': instance.hoursCount,
      'startTime': instance.startTime,
      'contractualNumber': instance.contractualNumber,
    };
