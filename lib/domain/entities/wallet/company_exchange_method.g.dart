// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_exchange_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyExchangeMethod _$CompanyExchangeMethodFromJson(
        Map<String, dynamic> json) =>
    CompanyExchangeMethod(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      companyId: json['companyId'] as String?,
    )..balance = json['balance'] as num?;

Map<String, dynamic> _$CompanyExchangeMethodToJson(
        CompanyExchangeMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'companyId': instance.companyId,
      'balance': instance.balance,
    };
