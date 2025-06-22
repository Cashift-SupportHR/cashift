// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_attandance_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpAttandancePrams _$EmpAttandancePramsFromJson(Map<String, dynamic> json) =>
    EmpAttandancePrams(
      scheduleEmployeeWorkId: (json['scheduleEmployeeWorkId'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      typeRequest: (json['typeRequest'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmpAttandancePramsToJson(EmpAttandancePrams instance) =>
    <String, dynamic>{
      'scheduleEmployeeWorkId': instance.scheduleEmployeeWorkId,
      'year': instance.year,
      'month': instance.month,
      'typeRequest': instance.typeRequest,
    };
