// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_covenant_focus_point_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCovenantFocusPointParams _$AddCovenantFocusPointParamsFromJson(
        Map<String, dynamic> json) =>
    AddCovenantFocusPointParams(
      id: json['id'] as int?,
      focusPointId: json['focusPointId'] as int?,
      deviceId: json['deviceId'] as int?,
      name: json['name'] as String?,
      deviceNumber: json['deviceNumber'] as String?,
      deviceTypeName: json['deviceTypeName'] as String?,
    );

Map<String, dynamic> _$AddCovenantFocusPointParamsToJson(
        AddCovenantFocusPointParams instance) =>
    <String, dynamic>{
      'focusPointId': instance.focusPointId,
      'id': instance.id,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'deviceNumber': instance.deviceNumber,
      'deviceTypeName': instance.deviceTypeName,
    };
