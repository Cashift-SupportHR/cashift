import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

@entity
class AttendanceOfflineQuery {
  @PrimaryKey(autoGenerate: true)
   int? id;
    int? presentId;
    String? projectId;
    double? latitude;
    double? longitude;
    String? checkedDateTime;
    int? attendanceType;
      bool? isMock;
      bool? isSafeDevice;
AttendanceOfflineQuery({this.id, this.presentId, this.projectId, this.latitude, this.longitude, this.checkedDateTime, this.attendanceType,this.isSafeDevice,this.isMock});

   factory AttendanceOfflineQuery.fromJson(Map<String, dynamic> json) {
    return AttendanceOfflineQuery(
      id: json['id'] as int?,
      presentId: json['presentId'] as int?,
      projectId: json['projectId'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longtude'] as double?,
      checkedDateTime: json['checkedDateTime'] as String?,
      attendanceType: json['attendanceType'] as int?,
      isMock: json['isMock'] as bool?,
      isSafeDevice: json['isSafeDevice'] as bool?,
    );
   }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'presentId': presentId,
      'projectId': projectId,
      'latitude': latitude,
      'longtude': longitude,
      'checkedDateTime': checkedDateTime,
      'attendanceType': attendanceType,
      'isMock': isMock,
      'isSafeDevice': isSafeDevice,
    };
   }
}

