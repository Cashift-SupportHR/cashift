// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentBalance _$CurrentBalanceFromJson(Map<String, dynamic> json) =>
    CurrentBalance(
      totalBalance: json['totalBalance'] as num?,
      withdrawnBalance: json['withdrawnBalance'] as num?,
    );

Map<String, dynamic> _$CurrentBalanceToJson(CurrentBalance instance) =>
    <String, dynamic>{
      'totalBalance': instance.totalBalance,
      'withdrawnBalance': instance.withdrawnBalance,
    };
