// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_map_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpMapDto _$EmpMapDtoFromJson(Map<String, dynamic> json) => EmpMapDto(
      malesCount: (json['malesCount'] as num?)?.toInt(),
      femalesCount: (json['femalesCount'] as num?)?.toInt(),
      freeLncerLocations: (json['freeLncerLocations'] as List<dynamic>?)
          ?.map((e) => FreeLncerLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmpMapDtoToJson(EmpMapDto instance) => <String, dynamic>{
      'malesCount': instance.malesCount,
      'femalesCount': instance.femalesCount,
      'freeLncerLocations': instance.freeLncerLocations,
    };

FreeLncerLocation _$FreeLncerLocationFromJson(Map<String, dynamic> json) =>
    FreeLncerLocation(
      id: (json['id'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      name: json['name'] as String?,
      icone: json['icone'] as String?,
      gender: json['gender'] as bool?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$FreeLncerLocationToJson(FreeLncerLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityId': instance.cityId,
      'jobId': instance.jobId,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'icone': instance.icone,
      'gender': instance.gender,
      'isActive': instance.isActive,
    };
