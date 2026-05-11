import 'package:froom/froom.dart';

import '../../../data/models/attendance/attendance_shift_dto.dart';


@entity
class AttendanceShift {
  @primaryKey
  final int id;
  final String crmEmpId;
  final String projectName;
  final String projectId;
  final String jobName;
  final String shiftFrom;
  final String shiftTo;
  final String employeeChar;
  final String nameEmployee;
  final String cityName;
  final bool canSkipQr;
  final bool startOverTime;

  AttendanceShift(
      {required this.id,
      required this.crmEmpId,
      required this.projectName,
      required this.projectId,
      required this.jobName,
      required this.shiftFrom,
      required this.shiftTo,
      required this.employeeChar,
      required this.nameEmployee,
      required this.cityName,
      required this.canSkipQr,
      required this.startOverTime});

  factory AttendanceShift.fromDto(AttendanceShiftDto dto) {
    return AttendanceShift(
      id: dto.id!,
      crmEmpId: dto.crmEmpId!,
      projectName: dto.projectName!,
      projectId: dto.projectId!,
      jobName: dto.jobName!,
      shiftFrom: dto.shiftFrom!,
      shiftTo: dto.shiftTo!,
      employeeChar: dto.employeeChar!,
      nameEmployee: dto.nameEmployee!,
      cityName: dto.cityName!,
      canSkipQr: dto.canSkipQr!,
      startOverTime: dto.startOverTime!,
    );
  }
}
