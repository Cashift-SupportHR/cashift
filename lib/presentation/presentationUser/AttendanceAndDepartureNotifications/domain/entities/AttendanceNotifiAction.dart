
import '../../data/models/index.dart';

/// attendanceNotifiActionName : "تيست2"
/// attendanceNotifiTypeName : "تيست"
/// id : 2
/// attendanceNotifiActionId : 11
/// attendanceNotifiTypeId : 2
/// discription : "test"
/// attNotifiFrom : "05:30:00"
/// attNotifiTo : "05:30:00"
/// reuestDate : "2021-11-18T00:00:00"

class AttendanceNotifiAction {
  AttendanceNotifiAction({
      this.attendanceNotifiActionName, 
      this.attendanceNotifiTypeName, 
      this.id, 
      this.attendanceNotifiActionId, 
      this.attendanceNotifiTypeId, 
      this.discription, 
      this.attNotifiFrom, 
      this.attNotifiTo, 
      this.reuestDate,});

  String? attendanceNotifiActionName;
  String? attendanceNotifiTypeName;
  int? id;
  int? attendanceNotifiActionId;
  int? attendanceNotifiTypeId;
  String? discription;
  String? attNotifiFrom;
  String? attNotifiTo;
  String? reuestDate;


  factory AttendanceNotifiAction.fromDto(AttendanceNotifiActionDto json) {
    return AttendanceNotifiAction(
      id: json.id,
      attendanceNotifiActionName: json.attendanceNotifiActionName,
      attendanceNotifiTypeName: json.attendanceNotifiTypeName,
      attendanceNotifiActionId: json.attendanceNotifiActionId,
      discription: json.discription,
      attNotifiFrom: json.attNotifiFrom,
      attNotifiTo: json.attNotifiTo,
      reuestDate: json.reuestDate,
    );
  }

}