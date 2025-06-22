// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityDetailsDto _$OpportunityDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    OpportunityDetailsDto(
      id: (json['id'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      companyLogo: json['companyLogo'] as String?,
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
      menuEmployees: (json['listApply'] as List<dynamic>?)
          ?.map((e) => MenuEmployeesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OpportunityDetailsDtoToJson(
        OpportunityDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      'conditions': instance.conditions,
      'listApply': instance.menuEmployees,
    };

MenuEmployeesDto _$MenuEmployeesDtoFromJson(Map<String, dynamic> json) =>
    MenuEmployeesDto(
      id: (json['id'] as num?)?.toInt(),
      employeeName: json['employeeName'] as String?,
      qualification: json['qualification'] as String?,
      cityName: json['cityName'] as String?,
      idNumber: json['idNumber'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      statusName: json['statusName'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MenuEmployeesDtoToJson(MenuEmployeesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeName': instance.employeeName,
      'qualification': instance.qualification,
      'cityName': instance.cityName,
      'idNumber': instance.idNumber,
      'phoneNumber': instance.phoneNumber,
      'statusName': instance.statusName,
      'status': instance.status,
    };
