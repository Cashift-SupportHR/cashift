// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_management_tab_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentManagementTabDto _$EmploymentManagementTabDtoFromJson(
        Map<String, dynamic> json) =>
    EmploymentManagementTabDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      totalFreelance: (json['totalFreelance'] as num?)?.toInt(),
      successApprovedLevel: (json['successApprovedLevel'] as List<dynamic>?)
          ?.map((e) => SuccessApprovedLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmploymentManagementTabDtoToJson(
        EmploymentManagementTabDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalFreelance': instance.totalFreelance,
      'successApprovedLevel': instance.successApprovedLevel,
    };

SuccessApprovedLevel _$SuccessApprovedLevelFromJson(
        Map<String, dynamic> json) =>
    SuccessApprovedLevel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      totalFreelance: (json['totalFreelance'] as num?)?.toInt(),
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$SuccessApprovedLevelToJson(
        SuccessApprovedLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalFreelance': instance.totalFreelance,
      'isDefault': instance.isDefault,
    };
