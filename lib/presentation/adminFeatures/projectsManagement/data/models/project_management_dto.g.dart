// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_management_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectManagementDto _$ProjectManagementDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectManagementDto(
      id: (json['id'] as num?)?.toInt(),
      projectCode: json['projectCode'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      cityName: json['cityName'] as String?,
      addressName: json['addressName'] as String?,
      typeAttendance: json['typeAttendance'] as String?,
    );

Map<String, dynamic> _$ProjectManagementDtoToJson(
        ProjectManagementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'projectCode': instance.projectCode,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'cityName': instance.cityName,
      'addressName': instance.addressName,
      'typeAttendance': instance.typeAttendance,
    };
