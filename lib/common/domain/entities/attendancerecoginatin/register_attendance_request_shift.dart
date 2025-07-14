
import 'package:shiftapp/common/data/models/attendance/attendance_config_dto.dart';

import '../../../data/models/attendance/index.dart';
import 'attendance_model.dart';


 class RegisterAttendanceRequestShift extends RegisterAttendanceRequest{
  final AttendanceShiftDto shift ;
  final int presentId;
  RegisterAttendanceRequestShift({required this.shift,required this.presentId});


  @override
  AttendanceConfigDto attendanceConfigDto() {
    return shift.attendanceConfigDto??AttendanceConfigDto();
  }

  @override
  bool allowToTrack() {
   return shift.isAllowToTrack==true ;
  }
}
