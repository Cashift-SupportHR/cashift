// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bank_info_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBankInfoParams _$AddBankInfoParamsFromJson(Map<String, dynamic> json) =>
    AddBankInfoParams(
      bankId: (json['bankId'] as num).toInt(),
      iban: json['iban'] as String,
    );

Map<String, dynamic> _$AddBankInfoParamsToJson(AddBankInfoParams instance) =>
    <String, dynamic>{
      'bankId': instance.bankId,
      'iban': instance.iban,
    };
