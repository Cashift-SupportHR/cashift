// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_user_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectUserRequestParams _$RejectUserRequestParamsFromJson(
        Map<String, dynamic> json) =>
    RejectUserRequestParams(
      statusId: (json['statusId'] as num?)?.toInt(),
      reason: json['reason'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RejectUserRequestParamsToJson(
        RejectUserRequestParams instance) =>
    <String, dynamic>{
      'statusId': instance.statusId,
      'reason': instance.reason,
      'id': instance.id,
    };
