

import '../../../data/models/attendance/attendance_config_dto.dart';

abstract class RegisterAttendanceRequest {
  AttendanceConfigDto attendanceConfigDto();

  bool allowedToDetectFace(){
      return attendanceConfigDto().eyeCheck ==true||
       attendanceConfigDto().smile ==true||
       attendanceConfigDto().eyeCheck ==true||
       attendanceConfigDto().moveFace ==true ;
    }
    bool allowedToDetectQr(){
      return attendanceConfigDto().qrcode==true ;
    }
    bool allowedToDetectLocation(){
      return attendanceConfigDto().location==true ;
    }

    bool allowToTrack();
   RegisterAttendanceRequest();
}


