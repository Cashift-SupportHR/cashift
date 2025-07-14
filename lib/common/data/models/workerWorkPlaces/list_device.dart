import 'package:json_annotation/json_annotation.dart'; 

part 'list_device.g.dart';


@JsonSerializable(ignoreUnannotated: true)
class ListDevice {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'deviceName')
  String? deviceName;
  @JsonKey(name: 'typeDevice')
  String? typeDevice;
  @JsonKey(name: 'typeDeviceCode')
  int? typeDeviceCode;
  @JsonKey(name: 'deviceNumber')
  String? deviceNumber;
  @JsonKey(name: 'alertMessage')
  String? alertMessage;
  @JsonKey(name: 'deviceId')
  final  int? deviceId;

  ListDevice({this.id, this.deviceName, this.typeDevice, this.deviceNumber, this.alertMessage,this.typeDeviceCode,this.deviceId});

   factory ListDevice.fromJson(Map<String, dynamic> json) => _$ListDeviceFromJson(json);

   Map<String, dynamic> toJson() => _$ListDeviceToJson(this);
}

