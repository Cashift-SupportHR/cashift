// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDto _$CityDtoFromJson(Map<String, dynamic> json) => CityDto(
      id: (json['id'] as num?)?.toInt(),
      cityName: json['cityName'] as String?,
    );

Map<String, dynamic> _$CityDtoToJson(CityDto instance) => <String, dynamic>{
      'id': instance.id,
      'cityName': instance.cityName,
    };
