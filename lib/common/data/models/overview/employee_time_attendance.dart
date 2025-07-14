import 'package:json_annotation/json_annotation.dart'; 

part 'employee_time_attendance.g.dart';


@JsonSerializable(ignoreUnannotated: true)
class EmployeeAttendanceTime {
  @JsonKey(name: 'startTime')
  String? startTime;
  @JsonKey(name: 'endTime')
  String? endTime;

  EmployeeAttendanceTime({this.startTime, this.endTime});

   factory EmployeeAttendanceTime.fromJson(Map<String, dynamic> json) => _$EmployeeAttendanceTimeFromJson(json);

   Map<String, dynamic> toJson() => _$EmployeeAttendanceTimeToJson(this);
}

