// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_opportunity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedOpportunityDto _$CompletedOpportunityDtoFromJson(
        Map<String, dynamic> json) =>
    CompletedOpportunityDto(
      id: (json['id'] as num?)?.toInt(),
      typeOpportunty: json['typeOpportunty'] as String?,
      isAllowUpdateStatus: json['isAllowUpdateStatus'] as bool?,
      typeOfOpportunty: (json['typeOfOpportunty'] as num?)?.toInt(),
      freelanceName: json['freelanceName'] as String?,
      idNumber: json['idNumber'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      status: json['status'] as String?,
      statusId: (json['statusId'] as num?)?.toInt(),
      workingDate: json['workingDate'] as String?,
      startShiftDate: json['startShiftDate'] as String?,
      endShiftDate: json['endShiftDate'] as String?,
      workingDateTime: json['workingDateTime'] as String?,
      endWorkingDateTime: json['endWorkingDateTime'] as String?,
      workingStartDate: json['workingStartDate'] as String?,
      workingEndDate: json['workingEndDate'] as String?,
      jobName: json['jobName'] as String?,
      projectName: json['projectName'] as String?,
      address: json['address'] as String?,
      cityName: json['cityName'] as String?,
      description: json['description'] as String?,
      endAllowMinutes: (json['endAllowMinutes'] as num?)?.toInt(),
      startShiftTime: json['startShiftTime'] as String?,
      oppId: (json['oppId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompletedOpportunityDtoToJson(
        CompletedOpportunityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typeOpportunty': instance.typeOpportunty,
      'typeOfOpportunty': instance.typeOfOpportunty,
      'freelanceName': instance.freelanceName,
      'idNumber': instance.idNumber,
      'phoneNumber': instance.phoneNumber,
      'status': instance.status,
      'statusId': instance.statusId,
      'workingDate': instance.workingDate,
      'startShiftDate': instance.startShiftDate,
      'endShiftDate': instance.endShiftDate,
      'workingDateTime': instance.workingDateTime,
      'endWorkingDateTime': instance.endWorkingDateTime,
      'workingStartDate': instance.workingStartDate,
      'workingEndDate': instance.workingEndDate,
      'jobName': instance.jobName,
      'projectName': instance.projectName,
      'address': instance.address,
      'cityName': instance.cityName,
      'description': instance.description,
      'endAllowMinutes': instance.endAllowMinutes,
      'startShiftTime': instance.startShiftTime,
      'oppId': instance.oppId,
      'isAllowUpdateStatus': instance.isAllowUpdateStatus,
    };
