// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_by_phone_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserByPhoneDto _$UserByPhoneDtoFromJson(Map<String, dynamic> json) =>
    UserByPhoneDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      idNumber: json['idNumber'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserByPhoneDtoToJson(UserByPhoneDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'idNumber': instance.idNumber,
      'password': instance.password,
    };
