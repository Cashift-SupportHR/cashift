// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmAttendance _$ConfirmAttendanceFromJson(Map<String, dynamic> json) =>
    ConfirmAttendance(
      applayId: (json['applayId'] as num?)?.toInt(),
      iconLogo: json['iconLogo'] as String?,
      isCurrent: (json['isCurrent'] as num?)?.toInt(),
      statusId: (json['statusId'] as num?)?.toInt(),
      status: json['status'] as String?,
      opportunitiesStrartTime: json['opportunitiesStrartTime'] as String?,
      opportunitiesEndTime: json['opportunitiesEndTime'] as String?,
      workingDateTime: json['workingDateTime'] as String?,
      workingDate: json['workingDate'] as String?,
      startShiftDate: json['startShiftDate'] as String?,
      endShiftDate: json['endShiftDate'] as String?,
      jobName: json['jobName'] as String?,
      salary: (json['salary'] as num?)?.toDouble(),
      projectId: (json['projectId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ConfirmAttendanceToJson(ConfirmAttendance instance) =>
    <String, dynamic>{
      'applayId': instance.applayId,
      'iconLogo': instance.iconLogo,
      'isCurrent': instance.isCurrent,
      'statusId': instance.statusId,
      'status': instance.status,
      'opportunitiesStrartTime': instance.opportunitiesStrartTime,
      'opportunitiesEndTime': instance.opportunitiesEndTime,
      'workingDateTime': instance.workingDateTime,
      'workingDate': instance.workingDate,
      'startShiftDate': instance.startShiftDate,
      'endShiftDate': instance.endShiftDate,
      'jobName': instance.jobName,
      'salary': instance.salary,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'address': instance.address,
      'description': instance.description,
    };
