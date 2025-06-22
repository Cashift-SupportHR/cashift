// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_wallet_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminWalletPrams _$AdminWalletPramsFromJson(Map<String, dynamic> json) =>
    AdminWalletPrams(
      filterId: (json['filterId'] as num?)?.toInt(),
      dateFilter: json['dateFilter'] as String?,
      nameFilter: json['nameFilter'] as String?,
      tabId: (json['tabId'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AdminWalletPramsToJson(AdminWalletPrams instance) =>
    <String, dynamic>{
      'filterId': instance.filterId,
      'tabId': instance.tabId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'nameFilter': instance.nameFilter,
      'dateFilter': instance.dateFilter,
    };
