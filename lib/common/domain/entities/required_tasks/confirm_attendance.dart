import 'package:json_annotation/json_annotation.dart'; 

part 'confirm_attendance.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class ConfirmAttendance {
  @JsonKey(name: 'applayId')
  int? applayId;
  @JsonKey(name: 'iconLogo')
  String? iconLogo;
  @JsonKey(name: 'isCurrent')
  int? isCurrent;
  @JsonKey(name: 'statusId')
  int? statusId;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'opportunitiesStrartTime')
  String? opportunitiesStrartTime;
  @JsonKey(name: 'opportunitiesEndTime')
  String? opportunitiesEndTime;
  @JsonKey(name: 'workingDateTime')
  String? workingDateTime;
  @JsonKey(name: 'workingDate')
  String? workingDate;
  @JsonKey(name: 'startShiftDate')
  String? startShiftDate;
  @JsonKey(name: 'endShiftDate')
  String? endShiftDate;
  @JsonKey(name: 'jobName')
  String? jobName;
  @JsonKey(name: 'salary')
  double? salary;
  @JsonKey(name: 'projectId')
  int? projectId;
  @JsonKey(name: 'projectName')
  String? projectName;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'description')
  String? description;

  ConfirmAttendance({this.applayId, this.iconLogo, this.isCurrent, this.statusId, this.status, this.opportunitiesStrartTime, this.opportunitiesEndTime, this.workingDateTime, this.workingDate, this.startShiftDate, this.endShiftDate, this.jobName, this.salary, this.projectId, this.projectName, this.address, this.description});

   factory ConfirmAttendance.fromJson(Map<String, dynamic> json) => _$ConfirmAttendanceFromJson(json);

   Map<String, dynamic> toJson() => _$ConfirmAttendanceToJson(this);
}

