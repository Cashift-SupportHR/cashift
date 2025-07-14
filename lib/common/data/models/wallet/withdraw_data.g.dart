// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawData _$WithdrawDataFromJson(Map<String, dynamic> json) => WithdrawData(
      (json['transferBalance'] as num?)?.toDouble(),
      (json['totalBalance'] as num?)?.toDouble(),
      (json['transferFee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WithdrawDataToJson(WithdrawData instance) =>
    <String, dynamic>{
      'transferBalance': instance.transferBalance,
      'totalBalance': instance.totalBalance,
      'transferFee': instance.transferFee,
    };
