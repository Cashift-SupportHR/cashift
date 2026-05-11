// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_mana_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsManaDto _$TermsManaDtoFromJson(Map<String, dynamic> json) => TermsManaDto(
      termsType: (json['termsType'] as num?)?.toInt(),
      termsVersion: json['termsVersion'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
    );

Map<String, dynamic> _$TermsManaDtoToJson(TermsManaDto instance) =>
    <String, dynamic>{
      'termsType': instance.termsType,
      'termsVersion': instance.termsVersion,
      'title': instance.title,
      'content': instance.content,
      'lastUpdated': instance.lastUpdated,
    };
