// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_of_commerce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeOfCommerce _$TypeOfCommerceFromJson(Map<String, dynamic> json) =>
    TypeOfCommerce(
      descrition: json['descrition'] as String?,
      name: json['name'] as String?,
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TypeOfCommerceToJson(TypeOfCommerce instance) =>
    <String, dynamic>{
      'descrition': instance.descrition,
      'name': instance.name,
      'type': instance.type,
    };
