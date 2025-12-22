// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOrderDto _$DeliveryOrderDtoFromJson(Map<String, dynamic> json) =>
    DeliveryOrderDto(
      id: (json['id'] as num?)?.toInt(),
      orderNumber: json['orderNumber'] as String?,
      customerAddress: json['customerAddress'] as String?,
      cityName: json['cityName'] as String?,
      districtName: json['districtName'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      totalPrice: json['totalPrice'] as num?,
      addedDate: json['addedDate'] as String?,
      distanceKm: json['distanceKm'] as num?,
      receiveFrom: json['receiveFrom'] as String?,
    );

Map<String, dynamic> _$DeliveryOrderDtoToJson(DeliveryOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'customerAddress': instance.customerAddress,
      'cityName': instance.cityName,
      'districtName': instance.districtName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'totalPrice': instance.totalPrice,
      'addedDate': instance.addedDate,
      'distanceKm': instance.distanceKm,
      'receiveFrom': instance.receiveFrom,
    };
