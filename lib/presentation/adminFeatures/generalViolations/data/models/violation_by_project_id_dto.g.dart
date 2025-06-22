// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_by_project_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationByProjectIdDto _$ViolationByProjectIdDtoFromJson(
        Map<String, dynamic> json) =>
    ViolationByProjectIdDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      violationAmount: json['violationAmount'] as num?,
      scheduleViolationsTypeId:
          (json['scheduleViolationsTypeId'] as num?)?.toInt(),
      scheduleViolationsTypeName: json['scheduleViolationsTypeName'] as String?,
      scheduleViolationsTypeCode: json['scheduleViolationsTypeCode'] as String?,
    );

Map<String, dynamic> _$ViolationByProjectIdDtoToJson(
        ViolationByProjectIdDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'violationAmount': instance.violationAmount,
      'scheduleViolationsTypeId': instance.scheduleViolationsTypeId,
      'scheduleViolationsTypeName': instance.scheduleViolationsTypeName,
      'scheduleViolationsTypeCode': instance.scheduleViolationsTypeCode,
    };
