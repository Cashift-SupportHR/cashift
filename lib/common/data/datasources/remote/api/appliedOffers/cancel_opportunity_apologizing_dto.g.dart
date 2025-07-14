// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_opportunity_apologizing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelOpportunityApologizingDto _$CancelOpportunityApologizingDtoFromJson(
        Map<String, dynamic> json) =>
    CancelOpportunityApologizingDto(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      attentionMessage: json['attentionMessage'] as String?,
      attentionMessageStatus: json['attentionMessageStatus'] as bool?,
      terms: (json['terms'] as List<dynamic>?)
          ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CancelOpportunityApologizingDtoToJson(
        CancelOpportunityApologizingDto instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'attentionMessage': instance.attentionMessage,
      'attentionMessageStatus': instance.attentionMessageStatus,
      'terms': instance.terms,
    };

Term _$TermFromJson(Map<String, dynamic> json) => Term(
      icon: json['icon'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$TermToJson(Term instance) => <String, dynamic>{
      'icon': instance.icon,
      'text': instance.text,
    };
