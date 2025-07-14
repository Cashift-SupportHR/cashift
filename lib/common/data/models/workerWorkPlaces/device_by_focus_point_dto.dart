import 'package:json_annotation/json_annotation.dart';

import 'list_device.dart';

part 'device_by_focus_point_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class DeviceByFocusPointDto {
  @JsonKey(name: 'countDevice')
  int? countDevice;
  @JsonKey(name: 'countCar')
  int? countCar;
  @JsonKey(name: 'listDevices')
  List<ListDevice>? listDevices;

  DeviceByFocusPointDto({this.countDevice, this.countCar, this.listDevices});

   factory DeviceByFocusPointDto.fromJson(Map<String, dynamic> json) => _$DeviceByFocusPointDtoFromJson(json);

   Map<String, dynamic> toJson() => _$DeviceByFocusPointDtoToJson(this);
}


