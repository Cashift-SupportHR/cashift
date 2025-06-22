// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complet_opportunity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletOpportunityDto _$CompletOpportunityDtoFromJson(
        Map<String, dynamic> json) =>
    CompletOpportunityDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              CompletedOpportunityData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompletOpportunityDtoToJson(
        CompletOpportunityDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'totalPages': instance.totalPages,
    };

CompletedOpportunityData _$CompletedOpportunityDataFromJson(
        Map<String, dynamic> json) =>
    CompletedOpportunityData(
      id: (json['id'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      typeOpportunty: json['typeOpportunty'] as String?,
      typeOfOpportunty: json['typeOfOpportunty'] as String?,
      freelanceId: (json['freelanceId'] as num?)?.toInt(),
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
      endAllowMinutes: json['endAllowMinutes'] as String?,
      startShiftTime: json['startShiftTime'] as String?,
      oppId: (json['oppId'] as num?)?.toInt(),
      isAllowUpdateStatus: json['isAllowUpdateStatus'] as bool?,
      deservedAmount: (json['deservedAmount'] as num?)?.toInt(),
      totalDeductMoneyClearanceCertificate:
          (json['totalDeductMoneyClearanceCertificate'] as num?)?.toInt(),
      ammountViolations: (json['ammountViolations'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompletedOpportunityDataToJson(
        CompletedOpportunityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shiftId': instance.shiftId,
      'typeOpportunty': instance.typeOpportunty,
      'typeOfOpportunty': instance.typeOfOpportunty,
      'freelanceId': instance.freelanceId,
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
      'deservedAmount': instance.deservedAmount,
      'totalDeductMoneyClearanceCertificate':
          instance.totalDeductMoneyClearanceCertificate,
      'ammountViolations': instance.ammountViolations,
    };
