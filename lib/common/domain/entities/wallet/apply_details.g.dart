// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyDetails _$ApplyDetailsFromJson(Map<String, dynamic> json) => ApplyDetails(
      json['companyName'] as String?,
      json['jobName'] as String?,
      (json['money'] as num?)?.toInt(),
      json['startShiftDate'] as String?,
      json['loanType'] as String?,
      json['createdDate'] as String?,
      json['installment'] as num?,
      (json['numberInstall'] as num?)?.toInt(),
      json['endShiftDate'] as String?,
      json['totalLoanAmount'] as num?,
    );

Map<String, dynamic> _$ApplyDetailsToJson(ApplyDetails instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'jobName': instance.jobName,
      'money': instance.money,
      'startShiftDate': instance.startShiftDate,
      'endShiftDate': instance.endShiftDate,
      'loanType': instance.loanType,
      'numberInstall': instance.numberInstall,
      'installment': instance.installment,
      'totalLoanAmount': instance.totalLoanAmount,
      'createdDate': instance.createdDate,
    };
