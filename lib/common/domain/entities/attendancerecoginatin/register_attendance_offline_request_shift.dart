

import 'package:shiftapp/common/data/models/attendance/attendance_config_dto.dart';

import 'attendance_model.dart';
class RegisterAttendanceOfflineRequestShift extends RegisterAttendanceRequest{
  final bool isDTA;
  final int type;
  RegisterAttendanceOfflineRequestShift({ required this.isDTA, required this.type});

  @override
  bool allowedToDetectFace() {
    return false;
  }

  @override
  bool allowedToDetectQr() {
    return true;
  }

  @override
  AttendanceConfigDto attendanceConfigDto() {
    return attendanceConfigDto();
  }

  @override
  bool allowToTrack() {
    return false ;
  }

}