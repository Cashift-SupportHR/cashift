// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evulation_params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvulationParamsDto _$EvulationParamsDtoFromJson(Map<String, dynamic> json) =>
    EvulationParamsDto(
      evaluations: (json['evaluations'] as List<dynamic>)
          .map((e) => EvaluationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$EvulationParamsDtoToJson(EvulationParamsDto instance) =>
    <String, dynamic>{
      'evaluations': instance.evaluations,
      'comment': instance.comment,
    };
