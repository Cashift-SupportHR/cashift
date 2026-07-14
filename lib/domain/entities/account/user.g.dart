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
  refreshToken: json['refreshToken'] as String?,
  tokenExpiresAt: json['tokenExpiresAt'] == null
      ? null
      : DateTime.parse(json['tokenExpiresAt'] as String),
  refreshTokenExpiresAt: json['refreshTokenExpiresAt'] == null
      ? null
      : DateTime.parse(json['refreshTokenExpiresAt'] as String),
  isAdmin: json['isAdmin'] as bool?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'profileImagePath': instance.profileImagePath,
  'isCompeleteProfile': instance.isCompeleteProfile,
  'phone': instance.phone,
  'token': instance.token,
  'refreshToken': instance.refreshToken,
  'tokenExpiresAt': instance.tokenExpiresAt?.toIso8601String(),
  'refreshTokenExpiresAt': instance.refreshTokenExpiresAt?.toIso8601String(),
  'isAdmin': instance.isAdmin,
};
