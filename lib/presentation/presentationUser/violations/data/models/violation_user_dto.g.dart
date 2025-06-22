// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationUserDto _$ViolationUserDtoFromJson(Map<String, dynamic> json) =>
    ViolationUserDto(
      id: (json['id'] as num?)?.toInt(),
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      status: json['status'] as String?,
      companyName: json['companyName'] as String?,
      violationName: json['violationName'] as String?,
      typesOfViolationName: json['typesOfViolationName'] as String?,
      adminDescription: json['adminDescription'] as String?,
      applyDescription: json['applyDescription'] as String?,
      actionButton: json['actionButton'] as bool?,
      opporunityName: json['opporunityName'] as String?,
      projectName: json['projectName'] as String?,
      startShiftDate: json['startShiftDate'] as String?,
      endShiftDate: json['endShiftDate'] as String?,
      typeApprove: json['typeApprove'] as String?,
      amountViolation: (json['amountViolation'] as num?)?.toDouble(),
      filePath: json['filePath'] as String?,
    );

Map<String, dynamic> _$ViolationUserDtoToJson(ViolationUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'violationName': instance.violationName,
      'typesOfViolationName': instance.typesOfViolationName,
      'adminDescription': instance.adminDescription,
      'applyDescription': instance.applyDescription,
      'actionButton': instance.actionButton,
      'opporunityName': instance.opporunityName,
      'projectName': instance.projectName,
      'startShiftDate': instance.startShiftDate,
      'endShiftDate': instance.endShiftDate,
      'typeApprove': instance.typeApprove,
      'amountViolation': instance.amountViolation,
      'filePath': instance.filePath,
      'status': instance.status,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
    };
