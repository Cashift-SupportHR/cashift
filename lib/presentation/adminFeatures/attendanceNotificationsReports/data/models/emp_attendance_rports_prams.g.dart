// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_attendance_rports_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpAttendanceRportsPrams _$EmpAttendanceRportsPramsFromJson(
        Map<String, dynamic> json) =>
    EmpAttendanceRportsPrams(
      projectId: (json['projectId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      startShiftDate: json['startShiftDate'] as String?,
      endShiftDate: json['endShiftDate'] as String?,
    );

Map<String, dynamic> _$EmpAttendanceRportsPramsToJson(
        EmpAttendanceRportsPrams instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'shiftId': instance.shiftId,
      'startShiftDate': instance.startShiftDate,
      'endShiftDate': instance.endShiftDate,
    };
