// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanTypes _$BanTypesFromJson(Map<String, dynamic> json) => BanTypes(
  description: json['description'] as String?,
  listBlockType: (json['listBlockType'] as List<dynamic>?)
      ?.map((e) => ValueItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BanTypesToJson(BanTypes instance) => <String, dynamic>{
  'description': instance.description,
  'listBlockType': instance.listBlockType,
};
