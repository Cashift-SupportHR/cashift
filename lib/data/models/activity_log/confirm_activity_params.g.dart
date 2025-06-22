// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_activity_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmActivityParams _$ConfirmActivityParamsFromJson(
        Map<String, dynamic> json) =>
    ConfirmActivityParams(
      id: (json['id'] as num?)?.toInt(),
      statusId: (json['statusId'] as num?)?.toInt(),
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longtude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ConfirmActivityParamsToJson(
        ConfirmActivityParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusId': instance.statusId,
      'description': instance.description,
      'latitude': instance.latitude,
      'longtude': instance.longitude,
    };
