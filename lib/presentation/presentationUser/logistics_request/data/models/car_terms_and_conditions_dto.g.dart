// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_terms_and_conditions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarTermsAndConditionsDto _$CarTermsAndConditionsDtoFromJson(
  Map<String, dynamic> json,
) => CarTermsAndConditionsDto(
  id: (json['id'] as num?)?.toInt(),
  versionTag: json['versionTag'] as String?,
  title: json['title'] as String?,
  content: json['content'] as String?,
  effectiveFromUtc: json['effectiveFromUtc'] as String?,
  effectiveToUtc: json['effectiveToUtc'] as String?,
  isActive: json['isActive'] as bool?,
);

Map<String, dynamic> _$CarTermsAndConditionsDtoToJson(
  CarTermsAndConditionsDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'versionTag': instance.versionTag,
  'title': instance.title,
  'content': instance.content,
  'effectiveFromUtc': instance.effectiveFromUtc,
  'effectiveToUtc': instance.effectiveToUtc,
  'isActive': instance.isActive,
};
