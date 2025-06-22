// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_conditions_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsAndConditionsPrams _$TermsAndConditionsPramsFromJson(
        Map<String, dynamic> json) =>
    TermsAndConditionsPrams(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      conditionEn: json['conditionEn'] as String?,
      conditionAr: json['conditionAr'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TermsAndConditionsPramsToJson(
        TermsAndConditionsPrams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      if (instance.projectId case final value?) 'projectId': value,
      'conditionEn': instance.conditionEn,
      'conditionAr': instance.conditionAr,
    };
