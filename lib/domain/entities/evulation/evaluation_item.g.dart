// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationItem _$EvaluationItemFromJson(Map<String, dynamic> json) =>
    EvaluationItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$EvaluationItemToJson(EvaluationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
    };
