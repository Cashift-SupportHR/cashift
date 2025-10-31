// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_logistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarLogisticsDto _$CarLogisticsDtoFromJson(Map<String, dynamic> json) =>
    CarLogisticsDto(
      id: (json['id'] as num?)?.toInt(),
      carSizeName: json['carSizeName'] as String?,
      maxPassengers: (json['maxPassengers'] as num?)?.toInt(),
      maxCartons: (json['maxCartons'] as num?)?.toInt(),
      iconKey: json['iconKey'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CarLogisticsDtoToJson(CarLogisticsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carSizeName': instance.carSizeName,
      'maxPassengers': instance.maxPassengers,
      'maxCartons': instance.maxCartons,
      'iconKey': instance.iconKey,
      'description': instance.description,
    };
