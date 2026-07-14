// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_mana_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderManaDto _$OrderManaDtoFromJson(Map<String, dynamic> json) => OrderManaDto(
  id: (json['id'] as num?)?.toInt(),
  orderNumber: json['orderNumber'] as String?,
  customerName: json['customerName'] as String?,
  customerPhone: json['customerPhone'] as String?,
  customerAddress: json['customerAddress'] as String?,
  customerNotes: json['customerNotes'] as String?,
  cityId: (json['cityId'] as num?)?.toInt(),
  cityName: json['cityName'] as String?,
  districtId: (json['districtId'] as num?)?.toInt(),
  districtName: json['districtName'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  mapUrl: json['mapUrl'] as String?,
  baseServicePrice: json['baseServicePrice'] as num?,
  floorPrice: json['floorPrice'] as num?,
  totalPrice: json['totalPrice'] as num?,
  status: (json['status'] as num?)?.toInt(),
  statusName: json['statusName'] as String?,
  warehouseId: (json['warehouseId'] as num?)?.toInt(),
  warehouseName: json['warehouseName'] as String?,
  freelancerId: json['freelancerId'] as String?,
  freelancerName: json['freelancerName'] as String?,
  freelancerPhone: json['freelancerPhone'] as String?,
  merchantId: json['merchantId'] as String?,
  merchantName: json['merchantName'] as String?,
  reservedAt: json['reservedAt'] as String?,
  reservationExpiresAt: json['reservationExpiresAt'] as String?,
  isReservationExpired: json['isReservationExpired'] as bool?,
  assignedAt: json['assignedAt'] as String?,
  pickedUpAt: json['pickedUpAt'] as String?,
  deliveredAt: json['deliveredAt'] as String?,
  completedAt: json['completedAt'] as String?,
  canceledAt: json['canceledAt'] as String?,
  cancellationReason: json['cancellationReason'] as String?,
  addedDate: json['addedDate'] as String?,
  modifiedDate: json['modifiedDate'] as String?,
  statusHistory: (json['statusHistory'] as List<dynamic>?)
      ?.map((e) => StatusHistory.fromJson(e as Map<String, dynamic>))
      .toList(),
  floorNote: json['floorNote'] as String?,
);

Map<String, dynamic> _$OrderManaDtoToJson(OrderManaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'customerAddress': instance.customerAddress,
      'customerNotes': instance.customerNotes,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'mapUrl': instance.mapUrl,
      'baseServicePrice': instance.baseServicePrice,
      'floorPrice': instance.floorPrice,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'statusName': instance.statusName,
      'warehouseId': instance.warehouseId,
      'warehouseName': instance.warehouseName,
      'freelancerId': instance.freelancerId,
      'freelancerName': instance.freelancerName,
      'freelancerPhone': instance.freelancerPhone,
      'merchantId': instance.merchantId,
      'merchantName': instance.merchantName,
      'reservedAt': instance.reservedAt,
      'reservationExpiresAt': instance.reservationExpiresAt,
      'isReservationExpired': instance.isReservationExpired,
      'assignedAt': instance.assignedAt,
      'pickedUpAt': instance.pickedUpAt,
      'deliveredAt': instance.deliveredAt,
      'completedAt': instance.completedAt,
      'canceledAt': instance.canceledAt,
      'cancellationReason': instance.cancellationReason,
      'addedDate': instance.addedDate,
      'modifiedDate': instance.modifiedDate,
      'floorNote': instance.floorNote,
      'statusHistory': instance.statusHistory,
    };

StatusHistory _$StatusHistoryFromJson(Map<String, dynamic> json) =>
    StatusHistory(
      id: (json['id'] as num?)?.toInt(),
      deliveryOrderId: (json['deliveryOrderId'] as num?)?.toInt(),
      fromStatus: (json['fromStatus'] as num?)?.toInt(),
      fromStatusName: json['fromStatusName'] as String?,
      toStatus: (json['toStatus'] as num?)?.toInt(),
      toStatusName: json['toStatusName'] as String?,
      changedAt: json['changedAt'] as String?,
      changedByUserId: json['changedByUserId'] as String?,
      changedByUserName: json['changedByUserName'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$StatusHistoryToJson(StatusHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliveryOrderId': instance.deliveryOrderId,
      'fromStatus': instance.fromStatus,
      'fromStatusName': instance.fromStatusName,
      'toStatus': instance.toStatus,
      'toStatusName': instance.toStatusName,
      'changedAt': instance.changedAt,
      'changedByUserId': instance.changedByUserId,
      'changedByUserName': instance.changedByUserName,
      'notes': instance.notes,
    };
