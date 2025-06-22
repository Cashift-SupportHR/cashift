// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_home_location_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddHomeLocationParams _$AddHomeLocationParamsFromJson(
        Map<String, dynamic> json) =>
    AddHomeLocationParams(
      districtid: (json['districtid'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      districtName: json['districtName'] as String?,
      cityName: json['cityName'] as String?,
    );

Map<String, dynamic> _$AddHomeLocationParamsToJson(
        AddHomeLocationParams instance) =>
    <String, dynamic>{
      'districtid': instance.districtid,
      'cityId': instance.cityId,
      'lat': instance.lat,
      'lng': instance.lng,
    };
