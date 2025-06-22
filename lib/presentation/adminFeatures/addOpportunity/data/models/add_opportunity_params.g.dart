// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_opportunity_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOpportunityParams _$AddOpportunityParamsFromJson(
        Map<String, dynamic> json) =>
    AddOpportunityParams(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      contractConditionsId: (json['contractConditionsId'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      workingData: json['workingData'],
      requiredCount: (json['requiredCount'] as num?)?.toInt(),
      autoApprove: json['autoApprove'] as bool?,
      shiftId: (json['shiftId'] as num?)?.toInt(),
      reserveNumber: (json['reserveNumber'] as num?)?.toInt(),
      startAllowMinutes: (json['startAllowMinutes'] as num?)?.toInt(),
      endAllowMinutes: (json['endAllowMinutes'] as num?)?.toInt(),
      isAllowEditTime: json['isAllowEditTime'] as bool?,
      calcOppId: (json['calcOppId'] as num?)?.toInt(),
      startShiftTime: json['startShiftTime'] as String?,
      hoursCount: (json['hoursCount'] as num?)?.toInt(),
      isAllowEditPrice: json['isAllowEditPrice'] as bool?,
      salary: (json['salary'] as num?)?.toDouble(),
      isAcceptAllEmployeeByApprovalLevel:
          (json['isAcceptAllEmployeeByApprovalLevel'] as num?)?.toInt(),
      completeFreeLanceInfoByCompanyAprovelLevelId:
          (json['completeFreeLanceInfoByCompanyAprovelLevelId'] as num?)
              ?.toInt(),
      attendanceTypeId: (json['attendanceTypeId'] as num?)?.toInt(),
      freeLancerIds: (json['freeLancerIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$AddOpportunityParamsToJson(
        AddOpportunityParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'contractConditionsId': instance.contractConditionsId,
      'jobId': instance.jobId,
      'workingData': instance.workingData,
      'requiredCount': instance.requiredCount,
      'autoApprove': instance.autoApprove,
      'shiftId': instance.shiftId,
      'reserveNumber': instance.reserveNumber,
      'startAllowMinutes': instance.startAllowMinutes,
      'endAllowMinutes': instance.endAllowMinutes,
      'isAllowEditTime': instance.isAllowEditTime,
      'calcOppId': instance.calcOppId,
      'startShiftTime': instance.startShiftTime,
      'hoursCount': instance.hoursCount,
      'isAllowEditPrice': instance.isAllowEditPrice,
      'salary': instance.salary,
      'isAcceptAllEmployeeByApprovalLevel':
          instance.isAcceptAllEmployeeByApprovalLevel,
      'completeFreeLanceInfoByCompanyAprovelLevelId':
          instance.completeFreeLanceInfoByCompanyAprovelLevelId,
      'attendanceTypeId': instance.attendanceTypeId,
      'freeLancerIds': instance.freeLancerIds,
    };
