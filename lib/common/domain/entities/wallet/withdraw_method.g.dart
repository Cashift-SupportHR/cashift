// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawMethod _$WithdrawMethodFromJson(Map<String, dynamic> json) =>
    WithdrawMethod(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      status: json['status'] as bool?,
      logo: json['logo'] as String?,
      fullName: json['fullName'] as String?,
      description: json['description'] as String?,
      exchangeId: (json['exchangeId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WithdrawMethodToJson(WithdrawMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'code': instance.code,
      'logo': instance.logo,
      'status': instance.status,
      'description': instance.description,
      'exchangeId': instance.exchangeId,
    };
