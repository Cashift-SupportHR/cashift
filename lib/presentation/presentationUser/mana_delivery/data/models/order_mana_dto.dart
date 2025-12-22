import 'package:json_annotation/json_annotation.dart';

part 'order_mana_dto.g.dart';

@JsonSerializable()
class OrderManaDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "customerName")
  final String? customerName;
  @JsonKey(name: "customerPhone")
  final String? customerPhone;
  @JsonKey(name: "customerAddress")
  final String? customerAddress;
  @JsonKey(name: "customerNotes")
  final String? customerNotes;
  @JsonKey(name: "cityId")
  final int? cityId;
  @JsonKey(name: "cityName")
  final String? cityName;
  @JsonKey(name: "districtId")
  final int? districtId;
  @JsonKey(name: "districtName")
  final String? districtName;
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;
  @JsonKey(name: "mapUrl")
  final String? mapUrl;
  @JsonKey(name: "baseServicePrice")
  final num? baseServicePrice;
  @JsonKey(name: "floorPrice")
  final num? floorPrice;
  @JsonKey(name: "totalPrice")
  final num? totalPrice;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "statusName")
  final String? statusName;
  @JsonKey(name: "warehouseId")
  final int? warehouseId;
  @JsonKey(name: "warehouseName")
  final String? warehouseName;
  @JsonKey(name: "freelancerId")
  final String? freelancerId;
  @JsonKey(name: "freelancerName")
  final String? freelancerName;
  @JsonKey(name: "freelancerPhone")
  final String? freelancerPhone;
  @JsonKey(name: "merchantId")
  final String? merchantId;
  @JsonKey(name: "merchantName")
  final String? merchantName;
  @JsonKey(name: "reservedAt")
  final String? reservedAt;
  @JsonKey(name: "reservationExpiresAt")
  final String? reservationExpiresAt;
  @JsonKey(name: "isReservationExpired")
  final bool? isReservationExpired;
  @JsonKey(name: "assignedAt")
  final String? assignedAt;
  @JsonKey(name: "pickedUpAt")
  final String? pickedUpAt;
  @JsonKey(name: "deliveredAt")
  final String? deliveredAt;
  @JsonKey(name: "completedAt")
  final String? completedAt;
  @JsonKey(name: "canceledAt")
  final String? canceledAt;
  @JsonKey(name: "cancellationReason")
  final String? cancellationReason;
  @JsonKey(name: "addedDate")
  final String? addedDate;
  @JsonKey(name: "modifiedDate")
  final String? modifiedDate;
  @JsonKey(name: "statusHistory")
  final List<StatusHistory>? statusHistory;

  OrderManaDto ({
    this.id,
    this.orderNumber,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.customerNotes,
    this.cityId,
    this.cityName,
    this.districtId,
    this.districtName,
    this.latitude,
    this.longitude,
    this.mapUrl,
    this.baseServicePrice,
    this.floorPrice,
    this.totalPrice,
    this.status,
    this.statusName,
    this.warehouseId,
    this.warehouseName,
    this.freelancerId,
    this.freelancerName,
    this.freelancerPhone,
    this.merchantId,
    this.merchantName,
    this.reservedAt,
    this.reservationExpiresAt,
    this.isReservationExpired,
    this.assignedAt,
    this.pickedUpAt,
    this.deliveredAt,
    this.completedAt,
    this.canceledAt,
    this.cancellationReason,
    this.addedDate,
    this.modifiedDate,
    this.statusHistory,
  });

  factory OrderManaDto.fromJson(Map<String, dynamic> json) {
    return _$OrderManaDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderManaDtoToJson(this);
  }
}

@JsonSerializable()
class StatusHistory {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "deliveryOrderId")
  final int? deliveryOrderId;
  @JsonKey(name: "fromStatus")
  final int? fromStatus;
  @JsonKey(name: "fromStatusName")
  final String? fromStatusName;
  @JsonKey(name: "toStatus")
  final int? toStatus;
  @JsonKey(name: "toStatusName")
  final String? toStatusName;
  @JsonKey(name: "changedAt")
  final String? changedAt;
  @JsonKey(name: "changedByUserId")
  final String? changedByUserId;
  @JsonKey(name: "changedByUserName")
  final String? changedByUserName;
  @JsonKey(name: "notes")
  final String? notes;

  StatusHistory ({
    this.id,
    this.deliveryOrderId,
    this.fromStatus,
    this.fromStatusName,
    this.toStatus,
    this.toStatusName,
    this.changedAt,
    this.changedByUserId,
    this.changedByUserName,
    this.notes,
  });

  factory StatusHistory.fromJson(Map<String, dynamic> json) {
    return _$StatusHistoryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StatusHistoryToJson(this);
  }
}


