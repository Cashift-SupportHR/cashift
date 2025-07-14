// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_focus_points_received_devices_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFocusPointsReceivedDevicesParams
    _$AddFocusPointsReceivedDevicesParamsFromJson(Map<String, dynamic> json) =>
        AddFocusPointsReceivedDevicesParams(
          freeLanceApplyFocusPointsId:
              (json['freeLanceApplyFocusPointsId'] as num?)?.toInt(),
          focusPointsDeviceSettingId:
              (json['focusPointsDeviceSettingId'] as num?)?.toInt(),
          haveComment: (json['haveComment'] as num?)?.toInt(),
          description: json['description'] as String?,
          attachmentFile: json['attachmentFile'] as String?,
          descriptionAttachment: json['descriptionAttachment'] as String?,
        );

Map<String, dynamic> _$AddFocusPointsReceivedDevicesParamsToJson(
        AddFocusPointsReceivedDevicesParams instance) =>
    <String, dynamic>{
      'freeLanceApplyFocusPointsId': instance.freeLanceApplyFocusPointsId,
      'focusPointsDeviceSettingId': instance.focusPointsDeviceSettingId,
      'haveComment': instance.haveComment,
      'description': instance.description,
      'attachmentFile': instance.attachmentFile,
      'descriptionAttachment': instance.descriptionAttachment,
    };
