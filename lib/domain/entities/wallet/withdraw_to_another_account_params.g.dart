// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_to_another_account_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawToAnotherAccountParams _$WithdrawToAnotherAccountParamsFromJson(
        Map<String, dynamic> json) =>
    WithdrawToAnotherAccountParams(
      companyId: json['companyId'] as int?,
      idNumber: json['idNumber'] as String?,
      type: json['transferType'] as int?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$WithdrawToAnotherAccountParamsToJson(
        WithdrawToAnotherAccountParams instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'idNumber': instance.idNumber,
      'transferType': instance.type,
      'id': instance.id,
    };
