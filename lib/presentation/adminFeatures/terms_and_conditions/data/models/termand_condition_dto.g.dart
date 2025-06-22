// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'termand_condition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermandConditionDto _$TermandConditionDtoFromJson(Map<String, dynamic> json) =>
    TermandConditionDto(
      id: (json['id'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      conditionEn: json['conditionEn'] as String?,
      conditionAr: json['conditionAr'] as String?,
    );

Map<String, dynamic> _$TermandConditionDtoToJson(
        TermandConditionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'conditionEn': instance.conditionEn,
      'conditionAr': instance.conditionAr,
    };
