// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_details_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceDetailsQuery _$BalanceDetailsQueryFromJson(Map<String, dynamic> json) =>
    BalanceDetailsQuery(
      statusId: (json['statusId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      headId: (json['headId'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BalanceDetailsQueryToJson(
        BalanceDetailsQuery instance) =>
    <String, dynamic>{
      'statusId': instance.statusId,
      'companyId': instance.companyId,
      'headId': instance.headId,
      'type': instance.type,
    };
