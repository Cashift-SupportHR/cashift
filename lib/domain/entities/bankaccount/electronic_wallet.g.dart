// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electronic_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectronicWallet _$ElectronicWalletFromJson(Map<String, dynamic> json) =>
    ElectronicWallet(
      id: (json['id'] as num?)?.toInt(),
      providerId: (json['providerId'] as num?)?.toInt(),
      providerName: json['providerName'] as String?,
      providerImage: json['providerImage'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ElectronicWalletToJson(ElectronicWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'providerId': instance.providerId,
      'providerName': instance.providerName,
      'providerImage': instance.providerImage,
      'phone': instance.phone,
    };
