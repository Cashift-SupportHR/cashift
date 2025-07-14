// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_electronic_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddElectronicWalletParams _$AddElectronicWalletParamsFromJson(
        Map<String, dynamic> json) =>
    AddElectronicWalletParams(
      id: (json['id'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      providerId: (json['providerId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddElectronicWalletParamsToJson(
        AddElectronicWalletParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'providerId': instance.providerId,
    };
