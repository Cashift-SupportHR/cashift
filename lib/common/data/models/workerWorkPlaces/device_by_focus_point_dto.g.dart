// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_by_focus_point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceByFocusPointDto _$DeviceByFocusPointDtoFromJson(
        Map<String, dynamic> json) =>
    DeviceByFocusPointDto(
      countDevice: (json['countDevice'] as num?)?.toInt(),
      countCar: (json['countCar'] as num?)?.toInt(),
      listDevices: (json['listDevices'] as List<dynamic>?)
          ?.map((e) => ListDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeviceByFocusPointDtoToJson(
        DeviceByFocusPointDto instance) =>
    <String, dynamic>{
      'countDevice': instance.countDevice,
      'countCar': instance.countCar,
      'listDevices': instance.listDevices,
    };
