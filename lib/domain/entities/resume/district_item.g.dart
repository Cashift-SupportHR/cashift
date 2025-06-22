// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictItem _$DistrictItemFromJson(Map<String, dynamic> json) => DistrictItem(
      id: (json['id'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DistrictItemToJson(DistrictItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityId': instance.cityId,
      'name': instance.name,
    };
