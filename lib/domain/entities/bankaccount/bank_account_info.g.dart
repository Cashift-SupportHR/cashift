// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountInfo _$BankAccountInfoFromJson(Map<String, dynamic> json) =>
    BankAccountInfo(
      id: json['id'] as int,
      bankId: json['bankId'] as int,
      bankName: json['bankName'] as String,
      iban: json['iban'] as String,
    );

Map<String, dynamic> _$BankAccountInfoToJson(BankAccountInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankId': instance.bankId,
      'bankName': instance.bankName,
      'iban': instance.iban,
    };
