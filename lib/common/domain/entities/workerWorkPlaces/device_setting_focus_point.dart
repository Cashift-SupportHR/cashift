
import '../../../data/models/workerWorkPlaces/index.dart';

class DeviceSettingFocusPoint {
  String? alertSetting;
  String? dangerSetting;
  String? successSetting;

  DeviceSettingFocusPoint({
      this.alertSetting, 
      this.dangerSetting, 
      this.successSetting,});

  factory DeviceSettingFocusPoint.fromDto(DeviceSettingFocusPointDto json) {
    return DeviceSettingFocusPoint(
      alertSetting: json.alertSetting,
      dangerSetting: json.dangerSetting,
      successSetting: json.successSetting,
    );
  }

}