// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_phone_number_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePhoneNumberParams _$ChangePhoneNumberParamsFromJson(
        Map<String, dynamic> json) =>
    ChangePhoneNumberParams(
      freeLanceInfoId: (json['FreeLanceInfoId'] as num?)?.toInt(),
      newPhoneNumber: json['NewPhoneNumber'] as String?,
      attachmentFile: _$JsonConverterFromJson<String, File>(
          json['AttachmentFile'], const FileJsonConverter().fromJson),
      notificationType: (json['NotificationType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChangePhoneNumberParamsToJson(
        ChangePhoneNumberParams instance) =>
    <String, dynamic>{
      'FreeLanceInfoId': instance.freeLanceInfoId,
      'NewPhoneNumber': instance.newPhoneNumber,
      'AttachmentFile': _$JsonConverterToJson<String, File>(
          instance.attachmentFile, const FileJsonConverter().toJson),
      'NotificationType': instance.notificationType,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
