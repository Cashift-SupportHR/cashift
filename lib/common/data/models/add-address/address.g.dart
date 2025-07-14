// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      id: (json['id'] as num?)?.toInt(),
      langitude: json['langitude'] as String?,
      latitude: json['latitude'] as String?,
      details: json['details'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'langitude': instance.langitude,
      'latitude': instance.latitude,
      'details': instance.details,
      'name': instance.name,
    };
