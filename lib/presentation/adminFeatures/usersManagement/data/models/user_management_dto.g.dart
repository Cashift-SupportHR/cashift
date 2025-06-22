// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_management_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserManagementDto _$UserManagementDtoFromJson(Map<String, dynamic> json) =>
    UserManagementDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phonNumber'] as String?,
      isActive: json['isActive'] as bool?,
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => CommonListItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      brands: (json['brands'] as List<dynamic>?)
          ?.map((e) => BrandDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      shifts: (json['shifts'] as List<dynamic>?)
          ?.map((e) =>
              ShiftByListProjectIdDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyId: (json['companyId'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      role: json['role'] == null
          ? null
          : UserManagementRoleDto.fromJson(
              json['role'] as Map<String, dynamic>),
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => UserAreaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$UserManagementDtoToJson(UserManagementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phonNumber': instance.phoneNumber,
      'isActive': instance.isActive,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'level': instance.level,
      'projects': instance.projects,
      'brands': instance.brands,
      'shifts': instance.shifts,
      'role': instance.role,
      'areas': instance.areas,
    };

UserManagementRoleDto _$UserManagementRoleDtoFromJson(
        Map<String, dynamic> json) =>
    UserManagementRoleDto(
      roleId: json['roleId'] as String?,
      roleName: json['roleName'] as String?,
    );

Map<String, dynamic> _$UserManagementRoleDtoToJson(
        UserManagementRoleDto instance) =>
    <String, dynamic>{
      'roleId': instance.roleId,
      'roleName': instance.roleName,
    };
