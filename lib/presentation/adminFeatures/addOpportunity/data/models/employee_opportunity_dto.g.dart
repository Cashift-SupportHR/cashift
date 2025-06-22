// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_opportunity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeOpportunityDto _$EmployeeOpportunityDtoFromJson(
        Map<String, dynamic> json) =>
    EmployeeOpportunityDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      cityName: json['cityName'] as String?,
      isFavorite: json['isFavorite'] as bool?,
      icon: json['icon'] as String?,
      checked: json['checked'] as bool?,
    );

Map<String, dynamic> _$EmployeeOpportunityDtoToJson(
        EmployeeOpportunityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'cityName': instance.cityName,
      'isFavorite': instance.isFavorite,
      'icon': instance.icon,
      'checked': instance.checked,
    };
