// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_user_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeUserPasswordParams _$ChangeUserPasswordParamsFromJson(
  Map<String, dynamic> json,
) => ChangeUserPasswordParams(
  email: json['email'] as String?,
  password: json['password'] as String?,
  confirmPassword: json['confirmPassword'] as String?,
);

Map<String, dynamic> _$ChangeUserPasswordParamsToJson(
  ChangeUserPasswordParams instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};
