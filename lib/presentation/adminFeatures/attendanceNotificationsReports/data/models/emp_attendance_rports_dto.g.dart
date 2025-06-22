// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_attendance_rports_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpAttendanceRportsDto _$EmpAttendanceRportsDtoFromJson(
        Map<String, dynamic> json) =>
    EmpAttendanceRportsDto(
      scheduleEmpAttendanceList: (json['scheduleEmpAttendanceList']
              as List<dynamic>?)
          ?.map((e) =>
              ScheduleEmpAttendanceListDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalScheduleEmpAttendance:
          (json['totalScheduleEmpAttendance'] as num?)?.toInt(),
      totalContractualNumber: (json['totalContractualNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmpAttendanceRportsDtoToJson(
        EmpAttendanceRportsDto instance) =>
    <String, dynamic>{
      'scheduleEmpAttendanceList': instance.scheduleEmpAttendanceList,
      'totalScheduleEmpAttendance': instance.totalScheduleEmpAttendance,
      'totalContractualNumber': instance.totalContractualNumber,
    };

ScheduleEmpAttendanceListDto _$ScheduleEmpAttendanceListDtoFromJson(
        Map<String, dynamic> json) =>
    ScheduleEmpAttendanceListDto(
      id: (json['id'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      freelancerId: (json['freelancerId'] as num?)?.toInt(),
      lastAttendanceId: (json['lastAttendanceId'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
      projectName: json['projectName'] as String?,
      freelancerName: json['freelancerName'] as String?,
      empStartShiftDate: json['empStartShiftDate'] as String?,
      empEndShiftDate: json['empEndShiftDate'] as String?,
      workHoursNumber: (json['workHoursNumber'] as num?)?.toInt(),
      employeeStatusId: (json['employeeStatusId'] as num?)?.toInt(),
      employeeStatusName: json['employeeStatusName'] as String?,
      attendanceStatus: json['attendanceStatus'] as String?,
    );

Map<String, dynamic> _$ScheduleEmpAttendanceListDtoToJson(
        ScheduleEmpAttendanceListDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shiftId': instance.shiftId,
      'projectId': instance.projectId,
      'freelancerId': instance.freelancerId,
      'lastAttendanceId': instance.lastAttendanceId,
      'shiftName': instance.shiftName,
      'projectName': instance.projectName,
      'freelancerName': instance.freelancerName,
      'empStartShiftDate': instance.empStartShiftDate,
      'empEndShiftDate': instance.empEndShiftDate,
      'workHoursNumber': instance.workHoursNumber,
      'employeeStatusId': instance.employeeStatusId,
      'employeeStatusName': instance.employeeStatusName,
      'attendanceStatus': instance.attendanceStatus,
    };
