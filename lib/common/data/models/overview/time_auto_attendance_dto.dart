import 'package:json_annotation/json_annotation.dart'; 

part 'time_auto_attendance_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class TimeAutoAttendanceDto {
  @JsonKey(name: 'latitude')
  String? latitude;
  @JsonKey(name: 'longtude')
  String? longtude;
  @JsonKey(name: 'radius')
  String? radius;
  @JsonKey(name: 'projectName')
  String? projectName;
  @JsonKey(name: 'isAutoAttendance')
  bool? isAutoAttendance;
  @JsonKey(name: 'employeeAttendanceTime')
  EmployeeAttendanceTime? employeeAttendanceTime;

  TimeAutoAttendanceDto({this.latitude, this.longtude, this.radius, this.projectName, this.isAutoAttendance, this.employeeAttendanceTime});

   factory TimeAutoAttendanceDto.fromJson(Map<String, dynamic> json) => _$TimeAutoAttendanceDtoFromJson(json);

   Map<String, dynamic> toJson() => _$TimeAutoAttendanceDtoToJson(this);
}

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

