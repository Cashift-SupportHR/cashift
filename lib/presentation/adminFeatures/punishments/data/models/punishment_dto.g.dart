// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'punishment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PunishmentDto _$PunishmentDtoFromJson(Map<String, dynamic> json) =>
    PunishmentDto(
      id: json['id'] as int?,
      companyName: json['companyName'] as String?,
      violationTypeName: json['violationTypeName'] as String?,
      typesOfViolationName: json['typesOfViolationName'] as String?,
      amountViolation: (json['amountViolation'] as num?)?.toDouble(),
      totalViolationDays: json['totalViolationDays'] as int?,
      logo: json['logo'] as String?,
      typesOfViolation: json['typesOfViolation'] as int?,
    );

Map<String, dynamic> _$PunishmentDtoToJson(PunishmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'violationTypeName': instance.violationTypeName,
      'typesOfViolationName': instance.typesOfViolationName,
      'amountViolation': instance.amountViolation,
      'totalViolationDays': instance.totalViolationDays,
      'logo': instance.logo,
      'typesOfViolation': instance.typesOfViolation,
    };
