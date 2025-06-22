// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_opportunity_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeOpportunityTypeDto _$EmployeeOpportunityTypeDtoFromJson(
        Map<String, dynamic> json) =>
    EmployeeOpportunityTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$EmployeeOpportunityTypeDtoToJson(
        EmployeeOpportunityTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'code': instance.code,
      'icon': instance.icon,
    };
