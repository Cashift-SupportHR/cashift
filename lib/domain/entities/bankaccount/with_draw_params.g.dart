// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'with_draw_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithDrawParams _$WithDrawParamsFromJson(Map<String, dynamic> json) =>
    WithDrawParams(
      projectId: json['projectId'] as int,
      bankCode: json['bankCode'] as String,
      transactionType: json['transactionType'] as int,
      transferId: json['transferId'] as int?,
    );

Map<String, dynamic> _$WithDrawParamsToJson(WithDrawParams instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'bankCode': instance.bankCode,
      'transactionType': instance.transactionType,
      'transferId': instance.transferId,
    };
