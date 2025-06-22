// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_evaluations_employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobEvaluationsEmployeeDto _$JobEvaluationsEmployeeDtoFromJson(
        Map<String, dynamic> json) =>
    JobEvaluationsEmployeeDto(
      nameAr: json['nameAr'] as String?,
      evalkey: (json['evalkey'] as num?)?.toInt(),
      val: (json['val'] as num?)?.toInt(),
      evaluationCount: (json['evaluationCount'] as num?)?.toInt(),
      evaluationName: json['evaluationName'] as String?,
      totalWorkHours: json['totalWorkHours'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$JobEvaluationsEmployeeDtoToJson(
        JobEvaluationsEmployeeDto instance) =>
    <String, dynamic>{
      'nameAr': instance.nameAr,
      'evalkey': instance.evalkey,
      'val': instance.val,
      'evaluationCount': instance.evaluationCount,
      'evaluationName': instance.evaluationName,
      'totalWorkHours': instance.totalWorkHours,
      'percentage': instance.percentage,
      'date': instance.date,
    };
