// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user_manager_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUserManagerDto _$InfoUserManagerDtoFromJson(Map<String, dynamic> json) =>
    InfoUserManagerDto(
      name: json['name'] as String?,
      userName: json['userName'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      roleName: json['roleName'] as String?,
      roleNameInfo: json['roleNameInfo'] as String?,
      companyNameInfo: json['companyNameInfo'] as String?,
      projectNameInfo: json['projectNameInfo'] as String?,
      shiftNameInfo: json['shiftNameInfo'] as String?,
      brandNameInfo: json['brandNameInfo'] as String?,
      areaNameInfo: json['areaNameInfo'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => RoleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      namePlaceHolder: json['namePlaceHolder'] as String?,
      userNamePlaceHolder: json['userNamePlaceHolder'] as String?,
      phonePlaceHolder: json['phonePlaceHolder'] as String?,
      passwordPlaceHolder: json['passwordPlaceHolder'] as String?,
      confirmPasswordPlaceHolder: json['confirmPasswordPlaceHolder'] as String?,
      roleNamePlaceHolder: json['roleNamePlaceHolder'] as String?,
      roleNameInfoPlaceHolder: json['roleNameInfoPlaceHolder'] as String?,
      companyNameInfoPlaceHolder: json['companyNameInfoPlaceHolder'] as String?,
      projectNameInfoPlaceHolder: json['projectNameInfoPlaceHolder'] as String?,
      shiftNameInfoPlaceHolder: json['shiftNameInfoPlaceHolder'] as String?,
      brandNameInfoPlaceHolder: json['areaNameInfoPlaceHolder'] as String?,
      areaNameInfoPlaceHolder: json['brandNameInfoPlaceHolder'] as String?,
    );

Map<String, dynamic> _$InfoUserManagerDtoToJson(InfoUserManagerDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userName': instance.userName,
      'phone': instance.phone,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'roleName': instance.roleName,
      'roleNameInfo': instance.roleNameInfo,
      'companyNameInfo': instance.companyNameInfo,
      'projectNameInfo': instance.projectNameInfo,
      'shiftNameInfo': instance.shiftNameInfo,
      'brandNameInfo': instance.brandNameInfo,
      'areaNameInfo': instance.areaNameInfo,
      'namePlaceHolder': instance.namePlaceHolder,
      'userNamePlaceHolder': instance.userNamePlaceHolder,
      'phonePlaceHolder': instance.phonePlaceHolder,
      'passwordPlaceHolder': instance.passwordPlaceHolder,
      'confirmPasswordPlaceHolder': instance.confirmPasswordPlaceHolder,
      'roleNamePlaceHolder': instance.roleNamePlaceHolder,
      'roleNameInfoPlaceHolder': instance.roleNameInfoPlaceHolder,
      'companyNameInfoPlaceHolder': instance.companyNameInfoPlaceHolder,
      'projectNameInfoPlaceHolder': instance.projectNameInfoPlaceHolder,
      'shiftNameInfoPlaceHolder': instance.shiftNameInfoPlaceHolder,
      'brandNameInfoPlaceHolder': instance.areaNameInfoPlaceHolder,
      'areaNameInfoPlaceHolder': instance.brandNameInfoPlaceHolder,
      'roles': instance.roles,
    };

RoleDto _$RoleDtoFromJson(Map<String, dynamic> json) => RoleDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      level: (json['level'] as num?)?.toInt(),
      isProject: json['isProject'] as bool?,
      isCompany: json['isCompany'] as bool?,
      isShift: json['isShift'] as bool?,
      isBrand: json['isBrand'] as bool?,
      isArea: json['isArea'] as bool?,
      isMultiProject: json['isMultiProject'] as bool?,
      isMultiShift: json['isMultiShift'] as bool?,
    );

Map<String, dynamic> _$RoleDtoToJson(RoleDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'level': instance.level,
      'isProject': instance.isProject,
      'isCompany': instance.isCompany,
      'isShift': instance.isShift,
      'isBrand': instance.isBrand,
      'isArea': instance.isArea,
      'isMultiProject': instance.isMultiProject,
      'isMultiShift': instance.isMultiShift,
    };
