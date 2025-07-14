// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_auto_attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeAutoAttendanceDto _$TimeAutoAttendanceDtoFromJson(
        Map<String, dynamic> json) =>
    TimeAutoAttendanceDto(
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
      radius: json['radius'] as String?,
      projectName: json['projectName'] as String?,
      isAutoAttendance: json['isAutoAttendance'] as bool?,
      employeeAttendanceTime: json['employeeAttendanceTime'] == null
          ? null
          : EmployeeAttendanceTime.fromJson(
              json['employeeAttendanceTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimeAutoAttendanceDtoToJson(
        TimeAutoAttendanceDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'radius': instance.radius,
      'projectName': instance.projectName,
      'isAutoAttendance': instance.isAutoAttendance,
      'employeeAttendanceTime': instance.employeeAttendanceTime,
    };

EmployeeAttendanceTime _$EmployeeAttendanceTimeFromJson(
        Map<String, dynamic> json) =>
    EmployeeAttendanceTime(
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$EmployeeAttendanceTimeToJson(
        EmployeeAttendanceTime instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
