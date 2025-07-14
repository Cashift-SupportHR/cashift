// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceConfigDto _$AttendanceConfigDtoFromJson(Map<String, dynamic> json) =>
    AttendanceConfigDto(
      moveFace: json['moveFace'] as bool?,
      location: json['location'] as bool?,
      qrcode: json['qrcode'] as bool?,
      eyeCheck: json['eyeCheck'] as bool?,
      smile: json['smile'] as bool?,
    );

Map<String, dynamic> _$AttendanceConfigDtoToJson(
        AttendanceConfigDto instance) =>
    <String, dynamic>{
      'moveFace': instance.moveFace,
      'location': instance.location,
      'qrcode': instance.qrcode,
      'eyeCheck': instance.eyeCheck,
      'smile': instance.smile,
    };
