// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_conditions_requests_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsAndConditionsRequestsDto _$TermsAndConditionsRequestsDtoFromJson(
        Map<String, dynamic> json) =>
    TermsAndConditionsRequestsDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TermsAndConditionsRequestsDtoToJson(
        TermsAndConditionsRequestsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
