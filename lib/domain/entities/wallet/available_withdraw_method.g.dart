// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_withdraw_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableWithdrawMethod _$AvailableWithdrawMethodFromJson(
        Map<String, dynamic> json) =>
    AvailableWithdrawMethod(
      id: json['id'] as int?,
      name: json['name'] as String?,
      exchangeId: json['exchangeId'] as int?,
    )..code = json['code'] as String?;

Map<String, dynamic> _$AvailableWithdrawMethodToJson(
        AvailableWithdrawMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'exchangeId': instance.exchangeId,
    };
