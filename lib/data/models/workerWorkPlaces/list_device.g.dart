// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDevice _$ListDeviceFromJson(Map<String, dynamic> json) => ListDevice(
      id: json['id'] as int?,
      deviceName: json['deviceName'] as String?,
      typeDevice: json['typeDevice'] as String?,
      deviceNumber: json['deviceNumber'] as String?,
      alertMessage: json['alertMessage'] as String?,
      typeDeviceCode: json['typeDeviceCode'] as int?,
      deviceId: json['deviceId'] as int?,
    );

Map<String, dynamic> _$ListDeviceToJson(ListDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceName': instance.deviceName,
      'typeDevice': instance.typeDevice,
      'typeDeviceCode': instance.typeDeviceCode,
      'deviceNumber': instance.deviceNumber,
      'alertMessage': instance.alertMessage,
      'deviceId': instance.deviceId,
    };
