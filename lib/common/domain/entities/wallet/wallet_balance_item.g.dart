// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_balance_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletBalanceItem _$WalletBalanceItemFromJson(Map<String, dynamic> json) =>
    WalletBalanceItem(
      companyId: (json['companyId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      balance: json['balance'] as num?,
      status: json['status'] as bool?,
      typeTransfer: json['typeTransfer'] as String?,
    )
      ..id = (json['id'] as num?)?.toInt()
      ..logo = json['logo'] as String?
      ..date = json['dateOperation'] as String?
      ..employeeName = json['employeeName'] as String?
      ..statusName = json['statusName'] as String?
      ..type = (json['type'] as num?)?.toInt();

Map<String, dynamic> _$WalletBalanceItemToJson(WalletBalanceItem instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'id': instance.id,
      'companyName': instance.companyName,
      'logo': instance.logo,
      'dateOperation': instance.date,
      'employeeName': instance.employeeName,
      'typeTransfer': instance.typeTransfer,
      'statusName': instance.statusName,
      'balance': instance.balance,
      'status': instance.status,
      'type': instance.type,
    };
