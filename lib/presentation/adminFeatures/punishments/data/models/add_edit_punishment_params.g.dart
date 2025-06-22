// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_punishment_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEditPunishmentParams _$AddEditPunishmentParamsFromJson(
        Map<String, dynamic> json) =>
    AddEditPunishmentParams(
      id: (json['id'] as num?)?.toInt(),
      violationTypeId: (json['violationTypeId'] as num?)?.toInt(),
      violationTypeName: json['violationTypeName'] as String?,
      typesOfViolation: (json['typesOfViolation'] as num?)?.toInt(),
      typesOfViolationName: json['typesOfViolationName'] as String?,
      amountViolation: (json['amountViolation'] as num?)?.toDouble(),
      totalViolationDays: (json['totalViolationDays'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddEditPunishmentParamsToJson(
        AddEditPunishmentParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violationTypeId': instance.violationTypeId,
      'violationTypeName': instance.violationTypeName,
      'typesOfViolation': instance.typesOfViolation,
      'typesOfViolationName': instance.typesOfViolationName,
      'amountViolation': instance.amountViolation,
      'totalViolationDays': instance.totalViolationDays,
    };
