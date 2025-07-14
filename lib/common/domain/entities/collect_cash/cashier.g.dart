// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cashier _$CashierFromJson(Map<String, dynamic> json) => Cashier(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      cityName: json['cityName'] as String?,
      phone: json['phone'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longtude: (json['longtude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CashierToJson(Cashier instance) => <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'cityName': instance.cityName,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
    };
