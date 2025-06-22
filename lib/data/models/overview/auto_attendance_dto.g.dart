// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoAttendanceDto _$AutoAttendanceDtoFromJson(Map<String, dynamic> json) =>
    AutoAttendanceDto(
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
      typeAttendance: (json['typeAttendance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AutoAttendanceDtoToJson(AutoAttendanceDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'typeAttendance': instance.typeAttendance,
    };
