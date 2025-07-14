// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      profileImagePath: json['profileImagePath'] as String?,
      isCompeleteProfile: json['isCompeleteProfile'] as bool?,
      phone: json['phone'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImagePath': instance.profileImagePath,
      'isCompeleteProfile': instance.isCompeleteProfile,
      'phone': instance.phone,
      'token': instance.token,
    };
