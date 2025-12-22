
import '../../data/models/order_mana_dto.dart';

class OrderManaEntity {
  final int? id;
  final String? orderNumber;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? customerNotes;
  final int? cityId;
  final String? cityName;
  final int? districtId;
  final String? districtName;
  final double? latitude;
  final double? longitude;
  final String? mapUrl;
  final num? baseServicePrice;
  final num? floorPrice;
  final num? totalPrice;
  final int? status;
  final String? statusName;
  final int? warehouseId;
  final String? warehouseName;
  final String? freelancerId;
  final String? freelancerName;
  final String? freelancerPhone;
  final String? merchantId;
  final String? merchantName;
  final String? reservedAt;
  final String? reservationExpiresAt;
  final bool? isReservationExpired;
  final String? assignedAt;
  final String? pickedUpAt;
  final String? deliveredAt;
  final String? completedAt;
  final String? canceledAt;
  final String? cancellationReason;
  final String? addedDate;
  final String? modifiedDate;
  final List<StatusHistoryEntity>? statusHistory;

  OrderManaEntity({
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

  factory OrderManaEntity.fromDto(OrderManaDto dto) {
    return OrderManaEntity(
      id: dto.id,
      orderNumber: dto.orderNumber,
      customerName: dto.customerName,
      customerPhone: dto.customerPhone,
      customerAddress: dto.customerAddress,
      customerNotes: dto.customerNotes,
      cityId: dto.cityId,
      cityName: dto.cityName,
      districtId: dto.districtId,
      districtName: dto.districtName,
      latitude: dto.latitude,
      longitude: dto.longitude,
      mapUrl: dto.mapUrl,
      baseServicePrice: dto.baseServicePrice,
      floorPrice: dto.floorPrice,
      totalPrice: dto.totalPrice,
      status: dto.status,
      statusName: dto.statusName,
      warehouseId: dto.warehouseId,
      warehouseName: dto.warehouseName,
      freelancerId: dto.freelancerId,
      freelancerName: dto.freelancerName,
      freelancerPhone: dto.freelancerPhone,
      merchantId: dto.merchantId,
      merchantName: dto.merchantName,
      reservedAt: dto.reservedAt,
      reservationExpiresAt: dto.reservationExpiresAt,
      isReservationExpired: dto.isReservationExpired,
      assignedAt: dto.assignedAt,
      pickedUpAt: dto.pickedUpAt,
      deliveredAt: dto.deliveredAt,
      completedAt: dto.completedAt,
      canceledAt: dto.canceledAt,
      cancellationReason: dto.cancellationReason,
      addedDate: dto.addedDate,
      modifiedDate: dto.modifiedDate,
      statusHistory: dto.statusHistory == null
          ? null
          : StatusHistoryEntity.fromDtoList(dto.statusHistory!),
    );
  }

  static List<OrderManaEntity> fromDtoList(List<OrderManaDto> dtos) =>
      dtos.map((dto) => OrderManaEntity.fromDto(dto)).toList();
}

class StatusHistoryEntity {
  final int? id;
  final int? deliveryOrderId;
  final int? fromStatus;
  final String? fromStatusName;
  final int? toStatus;
  final String? toStatusName;
  final String? changedAt;
  final String? changedByUserId;
  final String? changedByUserName;
  final String? notes;

  StatusHistoryEntity({
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

  factory StatusHistoryEntity.fromDto(StatusHistory dto) {
    return StatusHistoryEntity(
      id: dto.id,
      deliveryOrderId: dto.deliveryOrderId,
      fromStatus: dto.fromStatus,
      fromStatusName: dto.fromStatusName,
      toStatus: dto.toStatus,
      toStatusName: dto.toStatusName,
      changedAt: dto.changedAt,
      changedByUserId: dto.changedByUserId,
      changedByUserName: dto.changedByUserName,
      notes: dto.notes,
    );
  }

  static List<StatusHistoryEntity> fromDtoList(
      List<StatusHistory> dtos,
      ) =>
      dtos.map((dto) => StatusHistoryEntity.fromDto(dto)).toList();
}
