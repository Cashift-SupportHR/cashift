// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_type_terms_and_condition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundTypeTermsAndConditionDto _$RoundTypeTermsAndConditionDtoFromJson(
        Map<String, dynamic> json) =>
    RoundTypeTermsAndConditionDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      roundTypeId: (json['roundTypeId'] as num?)?.toInt(),
      roundTypeName: json['roundTypeName'] as String?,
    );

Map<String, dynamic> _$RoundTypeTermsAndConditionDtoToJson(
        RoundTypeTermsAndConditionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roundTypeId': instance.roundTypeId,
      'roundTypeName': instance.roundTypeName,
    };
