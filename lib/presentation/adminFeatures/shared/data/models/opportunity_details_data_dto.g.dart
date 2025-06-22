// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_details_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityDetailsDataDto _$OpportunityDetailsDataDtoFromJson(
        Map<String, dynamic> json) =>
    OpportunityDetailsDataDto(
      id: (json['id'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      companyLogo: json['companyLogo'] as String?,
      totalCount: (json['totalCount'] as num?)?.toInt(),
      completeFreeLanceInfoByCompanyAprovelLevelName:
          json['completeFreeLanceInfoByCompanyAprovelLevelName'] as String?,
      jobName: json['jobName'] as String?,
      workingHours: (json['workingHours'] as num?)?.toInt(),
      startShiftDate: json['startShiftDate'] as String?,
      endShiftDate: json['endShiftDate'] as String?,
      requiredCount: (json['requiredCount'] as num?)?.toInt(),
      actualNumber: (json['actualNumber'] as num?)?.toInt(),
      salaries: (json['salaries'] as num?)?.toDouble(),
      description: json['description'] as String?,
      projectName: json['projectName'] as String?,
      registerAttendance: json['registerAttendance'] as String?,
      addedDate: json['addedDate'] as String?,
      timeJob: json['timeJob'] as String?,
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      activeApplicantsCount: json['activeApplicantsCount'] == null
          ? null
          : ActiveApplicantsCountDto.fromJson(
              json['activeApplicantsCount'] as Map<String, dynamic>),
      waitingApprovalApplicantsCount: json['waitingApprovalApplicantsCount'] ==
              null
          ? null
          : WaitingApprovalApplicantsCountDto.fromJson(
              json['waitingApprovalApplicantsCount'] as Map<String, dynamic>),
      paidOffApplicantsCount: json['paidOffApplicantsCount'] == null
          ? null
          : PaidOffApplicantsCountDto.fromJson(
              json['paidOffApplicantsCount'] as Map<String, dynamic>),
      cancelledApplicantsCount: json['cancelledApplicantsCount'] == null
          ? null
          : CancelledApplicantsCountDto.fromJson(
              json['cancelledApplicantsCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpportunityDetailsDataDtoToJson(
        OpportunityDetailsDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalCount': instance.totalCount,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
      'jobName': instance.jobName,
      'workingHours': instance.workingHours,
      'startShiftDate': instance.startShiftDate,
      'endShiftDate': instance.endShiftDate,
      'requiredCount': instance.requiredCount,
      'actualNumber': instance.actualNumber,
      'salaries': instance.salaries,
      'description': instance.description,
      'projectName': instance.projectName,
      'registerAttendance': instance.registerAttendance,
      'addedDate': instance.addedDate,
      'timeJob': instance.timeJob,
      'completeFreeLanceInfoByCompanyAprovelLevelName':
          instance.completeFreeLanceInfoByCompanyAprovelLevelName,
      'conditions': instance.conditions,
      'activeApplicantsCount': instance.activeApplicantsCount,
      'waitingApprovalApplicantsCount': instance.waitingApprovalApplicantsCount,
      'paidOffApplicantsCount': instance.paidOffApplicantsCount,
      'cancelledApplicantsCount': instance.cancelledApplicantsCount,
    };

ActiveApplicantsCountDto _$ActiveApplicantsCountDtoFromJson(
        Map<String, dynamic> json) =>
    ActiveApplicantsCountDto(
      count: (json['count'] as num?)?.toInt(),
      subtitle: json['subtitle'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ActiveApplicantsCountDtoToJson(
        ActiveApplicantsCountDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'percentage': instance.percentage,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };

WaitingApprovalApplicantsCountDto _$WaitingApprovalApplicantsCountDtoFromJson(
        Map<String, dynamic> json) =>
    WaitingApprovalApplicantsCountDto(
      count: (json['count'] as num?)?.toInt(),
      subtitle: json['subtitle'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$WaitingApprovalApplicantsCountDtoToJson(
        WaitingApprovalApplicantsCountDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'percentage': instance.percentage,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };

PaidOffApplicantsCountDto _$PaidOffApplicantsCountDtoFromJson(
        Map<String, dynamic> json) =>
    PaidOffApplicantsCountDto(
      subtitle: json['subtitle'] as String?,
      count: (json['count'] as num?)?.toInt(),
      percentage: (json['percentage'] as num?)?.toDouble(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$PaidOffApplicantsCountDtoToJson(
        PaidOffApplicantsCountDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'percentage': instance.percentage,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };

CancelledApplicantsCountDto _$CancelledApplicantsCountDtoFromJson(
        Map<String, dynamic> json) =>
    CancelledApplicantsCountDto(
      count: (json['count'] as num?)?.toInt(),
      subtitle: json['subtitle'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CancelledApplicantsCountDtoToJson(
        CancelledApplicantsCountDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'percentage': instance.percentage,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };
