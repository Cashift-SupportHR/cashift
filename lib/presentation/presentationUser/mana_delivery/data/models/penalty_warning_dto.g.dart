// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_warning_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PenaltyWarningDto _$PenaltyWarningDtoFromJson(Map<String, dynamic> json) =>
    PenaltyWarningDto(
      title: json['title'] as String?,
      message: json['message'] as String?,
      severity: json['severity'] as String?,
      confirmButtonText: json['confirmButtonText'] as String?,
      cancelButtonText: json['cancelButtonText'] as String?,
    );

Map<String, dynamic> _$PenaltyWarningDtoToJson(PenaltyWarningDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'severity': instance.severity,
      'confirmButtonText': instance.confirmButtonText,
      'cancelButtonText': instance.cancelButtonText,
    };
