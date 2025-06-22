// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_notifi_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceNotifiTypeDto _$AttendanceNotifiTypeDtoFromJson(
        Map<String, dynamic> json) =>
    AttendanceNotifiTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      iconePath: json['iconePath'] as String?,
    );

Map<String, dynamic> _$AttendanceNotifiTypeDtoToJson(
        AttendanceNotifiTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'iconePath': instance.iconePath,
    };
