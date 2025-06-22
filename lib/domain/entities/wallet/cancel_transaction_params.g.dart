// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_transaction_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelTransactionParams _$CancelTransactionParamsFromJson(
        Map<String, dynamic> json) =>
    CancelTransactionParams(
      companyId: (json['companyId'] as num?)?.toInt(),
      headId: (json['headId'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CancelTransactionParamsToJson(
        CancelTransactionParams instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'headId': instance.headId,
      'type': instance.type,
    };
