// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dues_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DuesItem _$DuesItemFromJson(Map<String, dynamic> json) => DuesItem(
      id: (json['id'] as num?)?.toInt(),
      money: (json['money'] as num?)?.toDouble(),
      statusName: json['statusName'] as String?,
      projectName: json['projectName'] as String?,
      workingDate: json['workingDate'] as String?,
      jobId: (json['jobId'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
      city: json['city'] as String?,
      collectedDay: json['collectedDay'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      freeLanceApplyId: (json['freeLanceApplyId'] as num?)?.toInt(),
      amount: json['amount'] as num?,
      totalShiftHourse: json['totalShiftHourse'] as num?,
      totalShiftMinutes: json['totalShiftMinutes'] as num?,
    );

Map<String, dynamic> _$DuesItemToJson(DuesItem instance) => <String, dynamic>{
      'id': instance.id,
      'money': instance.money,
      'statusName': instance.statusName,
      'projectName': instance.projectName,
      'workingDate': instance.workingDate,
      'jobId': instance.jobId,
      'statusCode': instance.statusCode,
      'jobName': instance.jobName,
      'city': instance.city,
      'collectedDay': instance.collectedDay,
      'address': instance.address,
      'description': instance.description,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'freeLanceApplyId': instance.freeLanceApplyId,
      'amount': instance.amount,
      'totalShiftHourse': instance.totalShiftHourse,
      'totalShiftMinutes': instance.totalShiftMinutes,
    };
