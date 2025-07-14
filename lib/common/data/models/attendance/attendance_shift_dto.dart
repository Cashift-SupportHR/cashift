import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/data/models/attendance/present_type.dart';

import 'attendance_config_dto.dart';

part 'attendance_shift_dto.g.dart'; 
//{"allowFingerPrint":1,"jobName":"مراقب أمن","cityName":"الرياض","crmEmpId":"105031","projectName":"مشروع المترو - الرياض","projectId":"F9E324F9-A8B7-EB11-A31A-005056BA707A","nameEmployee":"خاتم ماجد ثامر الشيباني","shiftFrom":"08:00 صباحا","shiftTo":"04:00 مساءا","employeeChar":"فى انتظار التسجيل"},"isSuccess":false}
@JsonSerializable(ignoreUnannotated: false)
class AttendanceShiftDto {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'crmEmpId')
  final  String? crmEmpId;
  @JsonKey(name: 'idNumber')
  final  String? idNumber;
  @JsonKey(name: 'projectName')
  final  String? projectName;
  @JsonKey(name: 'projectId')
  final  String? projectId;
  @JsonKey(name: 'jobName')
  final  String? jobName;
  @JsonKey(name: 'shiftFrom')
  final  String? shiftFrom;
  @JsonKey(name: 'shiftTo')
  final  String? shiftTo;
  @JsonKey(name: 'employeeChar')
  final  String? employeeChar;
  @JsonKey(name: 'nameEmployee')
  final  String? nameEmployee;
  @JsonKey(name: 'cityName')
  final  String? cityName;
  @JsonKey(name: 'allowFingerPrint')
  final  bool? canSkipQr;
  @JsonKey(name: 'isAttendance')
  final  bool? startOverTime;
  @JsonKey(name: 'candidateId')
  String? candidateId;
  @JsonKey(name: 'toTimeHoure')
  int? toTimeHoure;
  @JsonKey(name: 'toTimeMinute')
  int? toTimeMinute;
  @JsonKey(name: 'fromTimeHoure')
  int? fromTimeHoure;
  @JsonKey(name: 'fromTimeMinute')
  int? fromTimeMinute;
  @JsonKey(name: 'employeeType')
  String? employeeType;
  @JsonKey(name: 'presentType')
  List<PresentType>? presentType;
  @JsonKey(name: 'startTimeDateTime')
  String? startTimeDateTime;
  @JsonKey(name: 'startShiftTimeHoure')
  int? startShiftTimeHoure;
  @JsonKey(name: 'endTimeDateTime')
  String? endTimeDateTime;
  @JsonKey(name: 'femailShiftHour')
  int? femailShiftHour;
  @JsonKey(name: 'fingerprintlocation')
  String? fingerprintlocation;
  @JsonKey(name: 'sex')
  int? sex;
  @JsonKey(name: 'femaleShiftFromMinuts')
  int? femaleShiftFromMinuts;
  @JsonKey(name: 'femaleShiftFromHour')
  int? femaleShiftFromHour;
  @JsonKey(name: 'fingerType')
  int? fingerType;
  @JsonKey(name: 'shiftId')
  int? shiftId;
  @JsonKey(name: 'isAutoAttendance')
  bool? isAutoAttendance;
  @JsonKey(name: 'allowFaceRecognition')
  bool? allowFaceRecognition;
  @JsonKey(name: 'attendanceConfig')
  AttendanceConfigDto? attendanceConfigDto;

  @JsonKey(name: 'isAllowToTrack')
  final bool? isAllowToTrack;
  AttendanceShiftDto({this.crmEmpId,this.idNumber,  this.projectName, this.projectId, this.jobName, this.shiftFrom, this.shiftTo ,this.employeeChar,
  this.cityName, this.nameEmployee, this.canSkipQr, this.startOverTime,this.id, this.candidateId, this.toTimeHoure, this.toTimeMinute, this.fromTimeHoure, this.fromTimeMinute, this.employeeType, this.presentType, this.startTimeDateTime, this.startShiftTimeHoure, this.endTimeDateTime,
    this.femailShiftHour,
    this.fingerprintlocation,
    this.sex,
    this.femaleShiftFromMinuts,
    this.femaleShiftFromHour,
    this.fingerType,
    this.shiftId,
    this.isAutoAttendance,
    this.allowFaceRecognition,
    this.attendanceConfigDto,this.isAllowToTrack
  });

   factory AttendanceShiftDto.fromJson(Map<String, dynamic> json) => _$AttendanceShiftDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AttendanceShiftDtoToJson(this);

   bool isCheckIn()=>employeeChar=="1" ;
}




