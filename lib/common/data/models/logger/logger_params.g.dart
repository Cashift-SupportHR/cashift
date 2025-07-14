// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggerParams _$LoggerParamsFromJson(Map<String, dynamic> json) => LoggerParams(
      tagName: json['tagName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      error: json['error'] as String?,
      object: json['object'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$LoggerParamsToJson(LoggerParams instance) =>
    <String, dynamic>{
      'tagName': instance.tagName,
      'phoneNumber': instance.phoneNumber,
      'error': instance.error,
      'object': instance.object,
      'description': instance.description,
    };
