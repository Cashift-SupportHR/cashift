// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_statuses_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeStatusesDto _$EmployeeStatusesDtoFromJson(Map<String, dynamic> json) =>
    EmployeeStatusesDto(
      code: json['code'] as String?,
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmployeeStatusesDtoToJson(
        EmployeeStatusesDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'id': instance.id,
    };
