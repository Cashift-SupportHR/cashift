// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_attendance_notifications_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAttendanceNotificationsPrams _$AddAttendanceNotificationsPramsFromJson(
        Map<String, dynamic> json) =>
    AddAttendanceNotificationsPrams(
      id: (json['id'] as num?)?.toInt(),
      attendanceNotifiTypeId: (json['attendanceNotifiTypeId'] as num?)?.toInt(),
      discription: json['discription'] as String?,
      attNotifiFrom: json['attNotifiFrom'] as String?,
      attNotifiTo: json['attNotifiTo'] as String?,
      reuestDate: json['reuestDate'] as String?,
    );

Map<String, dynamic> _$AddAttendanceNotificationsPramsToJson(
        AddAttendanceNotificationsPrams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attendanceNotifiTypeId': instance.attendanceNotifiTypeId,
      'discription': instance.discription,
      'attNotifiFrom': instance.attNotifiFrom,
      'attNotifiTo': instance.attNotifiTo,
      'reuestDate': instance.reuestDate,
    };
