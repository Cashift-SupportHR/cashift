// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_type_violation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTypeViolationParams _$AddTypeViolationParamsFromJson(
        Map<String, dynamic> json) =>
    AddTypeViolationParams(
      id: (json['id'] as num?)?.toInt(),
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      violationAmount: (json['violationAmount'] as num?)?.toDouble(),
      projectId: (json['projectId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      scheduleViolationsTypeId:
          (json['scheduleViolationsTypeId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddTypeViolationParamsToJson(
        AddTypeViolationParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'violationAmount': instance.violationAmount,
      'projectId': instance.projectId,
      'companyId': instance.companyId,
      'scheduleViolationsTypeId': instance.scheduleViolationsTypeId,
    };
