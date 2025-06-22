// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_role_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantRoleDto _$ApplicantRoleDtoFromJson(Map<String, dynamic> json) =>
    ApplicantRoleDto(
      roleIndex: (json['roleIndex'] as num?)?.toInt(),
      roleKey: json['roleKey'] as String?,
      roleName: json['roleName'] as String?,
    );

Map<String, dynamic> _$ApplicantRoleDtoToJson(ApplicantRoleDto instance) =>
    <String, dynamic>{
      'roleIndex': instance.roleIndex,
      'roleKey': instance.roleKey,
      'roleName': instance.roleName,
    };
