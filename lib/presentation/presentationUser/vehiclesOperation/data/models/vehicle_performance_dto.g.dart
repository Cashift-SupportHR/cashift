// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_performance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiclePerformanceDto _$VehiclePerformanceDtoFromJson(
        Map<String, dynamic> json) =>
    VehiclePerformanceDto(
      detailsList: (json['details'] as List<dynamic>?)
          ?.map((e) =>
              VehiclePerformanceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      maxSpeed: (json['maxSpeed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehiclePerformanceDtoToJson(
        VehiclePerformanceDto instance) =>
    <String, dynamic>{
      'maxSpeed': instance.maxSpeed,
      'count': instance.count,
      'details': instance.detailsList,
    };

VehiclePerformanceDetails _$VehiclePerformanceDetailsFromJson(
        Map<String, dynamic> json) =>
    VehiclePerformanceDetails(
      time: json['time'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehiclePerformanceDetailsToJson(
        VehiclePerformanceDetails instance) =>
    <String, dynamic>{
      'time': instance.time,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'speed': instance.speed,
    };
