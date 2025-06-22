// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeTypeDto _$EmployeeTypeDtoFromJson(Map<String, dynamic> json) =>
    EmployeeTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EmployeeTypeDtoToJson(EmployeeTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
