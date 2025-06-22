// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban_employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanEmployeeDto _$BanEmployeeDtoFromJson(Map<String, dynamic> json) =>
    BanEmployeeDto(
      id: (json['id'] as num?)?.toInt(),
      freelanceId: (json['freelanceId'] as num?)?.toInt(),
      freelanceName: json['freelanceName'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      description: json['description'] as String?,
      evaluationPerCompany: (json['evaluationPerCompany'] as num?)?.toInt(),
      totalEvaluationPerCompany:
          (json['totalEvaluationPerCompany'] as num?)?.toInt(),
      evaluationPerProject: (json['evaluationPerProject'] as num?)?.toInt(),
      totalEvaluationPerProject:
          (json['totalEvaluationPerProject'] as num?)?.toInt(),
    )
      ..freelanceLogo = json['freelanceLogo'] as String?
      ..freelanceNotes = json['freelanceNotes'] as String?;

Map<String, dynamic> _$BanEmployeeDtoToJson(BanEmployeeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'freelanceLogo': instance.freelanceLogo,
      'freelanceNotes': instance.freelanceNotes,
      'freelanceId': instance.freelanceId,
      'freelanceName': instance.freelanceName,
      'projectId': instance.projectId,
      'companyId': instance.companyId,
      'projectName': instance.projectName,
      'description': instance.description,
      'evaluationPerCompany': instance.evaluationPerCompany,
      'totalEvaluationPerCompany': instance.totalEvaluationPerCompany,
      'evaluationPerProject': instance.evaluationPerProject,
      'totalEvaluationPerProject': instance.totalEvaluationPerProject,
    };
