// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_setting_focus_point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceSettingFocusPointDto _$DeviceSettingFocusPointDtoFromJson(
        Map<String, dynamic> json) =>
    DeviceSettingFocusPointDto(
      alertSetting: json['alertSetting'] as String?,
      dangerSetting: json['dangerSetting'] as String?,
      successSetting: json['successSetting'] as String?,
    );

Map<String, dynamic> _$DeviceSettingFocusPointDtoToJson(
        DeviceSettingFocusPointDto instance) =>
    <String, dynamic>{
      'alertSetting': instance.alertSetting,
      'dangerSetting': instance.dangerSetting,
      'successSetting': instance.successSetting,
    };
