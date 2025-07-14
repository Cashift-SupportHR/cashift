// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_cash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobCash _$JobCashFromJson(Map<String, dynamic> json) => JobCash(
      projectId: (json['projectId'] as num?)?.toInt(),
      money: (json['money'] as num?)?.toDouble(),
      freeLanceApplyId: (json['freeLanceApplyId'] as num?)?.toInt(),
      statusName: json['statusName'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      jobName: json['jobName'] as String?,
      city: json['city'] as String?,
      freelanceName: json['freelanceName'] as String?,
    );

Map<String, dynamic> _$JobCashToJson(JobCash instance) => <String, dynamic>{
      'projectId': instance.projectId,
      'freeLanceApplyId': instance.freeLanceApplyId,
      'money': instance.money,
      'statusName': instance.statusName,
      'statusCode': instance.statusCode,
      'projectName': instance.projectName,
      'jobName': instance.jobName,
      'city': instance.city,
      'freelanceName': instance.freelanceName,
    };
