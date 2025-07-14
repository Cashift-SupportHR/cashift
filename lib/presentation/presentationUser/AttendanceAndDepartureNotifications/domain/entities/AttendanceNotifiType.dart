
import '../../data/models/index.dart';

/// id : 2
/// name : "تيست"
/// code : "test"
/// iconePath : "d"

class AttendanceNotifiType {
  AttendanceNotifiType({
      this.id, 
      this.name, 
      this.code, 
      this.iconePath,});


  int? id;
  String? name;
  String? code;
  String? iconePath;

  factory AttendanceNotifiType.fromDto(AttendanceNotifiTypeDto json) {
    return AttendanceNotifiType(
      id: json.id,
      name: json.name,
      code: json.code,
      iconePath: json.iconePath,

    );
  }

}