// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      id: (json['id'] as num).toInt(),
      bankName: json['bankName'] as String,
      bankLogo: json['bankLogo'] as String?,
      isContractBank: json['isContractBank'] as bool?,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'bankName': instance.bankName,
      'bankLogo': instance.bankLogo,
      'isContractBank': instance.isContractBank,
    };
