import 'package:json_annotation/json_annotation.dart'; 

part 'device_setting_focus_point_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class DeviceSettingFocusPointDto {
  @JsonKey(name: 'alertSetting')
  String? alertSetting;
  @JsonKey(name: 'dangerSetting')
  String? dangerSetting;
  @JsonKey(name: 'successSetting')
  String? successSetting;

  DeviceSettingFocusPointDto({this.alertSetting, this.dangerSetting, this.successSetting});

   factory DeviceSettingFocusPointDto.fromJson(Map<String, dynamic> json) => _$DeviceSettingFocusPointDtoFromJson(json);

   Map<String, dynamic> toJson() => _$DeviceSettingFocusPointDtoToJson(this);
}

