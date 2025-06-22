// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_focus_attendance_time_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFocusAttendanceTimeParams _$AddFocusAttendanceTimeParamsFromJson(
        Map<String, dynamic> json) =>
    AddFocusAttendanceTimeParams(
      id: (json['id'] as num?)?.toInt(),
      focusPointId: (json['focusPointId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      attendanceTypeId: (json['attendanceTypeId'] as num?)?.toInt(),
      requredCount: (json['requredCount'] as num?)?.toInt(),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$AddFocusAttendanceTimeParamsToJson(
        AddFocusAttendanceTimeParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'focusPointId': instance.focusPointId,
      'shiftId': instance.shiftId,
      'attendanceTypeId': instance.attendanceTypeId,
      'requredCount': instance.requredCount,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
