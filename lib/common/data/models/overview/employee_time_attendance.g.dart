// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_time_attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
