// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_by_exchange_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceByExchangeParams _$BalanceByExchangeParamsFromJson(
        Map<String, dynamic> json) =>
    BalanceByExchangeParams(
      companyId: (json['companyId'] as num?)?.toInt(),
      exchangeId: (json['exchangeId'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      headId: (json['headId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BalanceByExchangeParamsToJson(
        BalanceByExchangeParams instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'exchangeId': instance.exchangeId,
      'type': instance.type,
      'headId': instance.headId,
    };
