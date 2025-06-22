// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_provider_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletProviderItem _$WalletProviderItemFromJson(Map<String, dynamic> json) =>
    WalletProviderItem(
      id: (json['id'] as num?)?.toInt(),
      providerName: json['providerName'] as String?,
      providerLogo: json['providerLogo'] as String?,
      providerCode: json['providerCode'] as String?,
    );

Map<String, dynamic> _$WalletProviderItemToJson(WalletProviderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'providerName': instance.providerName,
      'providerLogo': instance.providerLogo,
      'providerCode': instance.providerCode,
    };
