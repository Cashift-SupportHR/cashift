// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityItem _$CityItemFromJson(Map<String, dynamic> json) => CityItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$CityItemToJson(CityItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
    };
