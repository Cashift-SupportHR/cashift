// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: (json['id'] as num?)?.toInt(),
      langitude: json['langitude'] as String?,
      latitude: json['latitude'] as String?,
      details: json['details'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'langitude': instance.langitude,
      'latitude': instance.latitude,
      'details': instance.details,
      'name': instance.name,
    };
