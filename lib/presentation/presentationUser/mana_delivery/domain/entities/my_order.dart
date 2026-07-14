import '../../data/models/my_order_dto.dart';

class MyOrderEntity {
  final int? currentPage;
  final int? pageCount;
  final int? pageSize;
  final int? rowCount;
  final int? firstRowOnPage;
  final int? lastRowOnPage;
  final List<MyOrderItemEntity>? results;

  MyOrderEntity({
    this.currentPage,
    this.pageCount,
    this.pageSize,
    this.rowCount,
    this.firstRowOnPage,
    this.lastRowOnPage,
    this.results,
  });

  factory MyOrderEntity.fromDto(MyOrderDto dto) {
    return MyOrderEntity(
      currentPage: dto.currentPage,
      pageCount: dto.pageCount,
      pageSize: dto.pageSize,
      rowCount: dto.rowCount,
      firstRowOnPage: dto.firstRowOnPage,
      lastRowOnPage: dto.lastRowOnPage,
      results: dto.results?.map((e) => MyOrderItemEntity.fromDto(e)).toList(),
    );
  }
}

class MyOrderItemEntity {
  final int? id;
  final String? orderNumber;
  final String? orderDetails;
  final int? companyId;
  final String? companyName;
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
  final int? floorNumber;
  final bool? hasElevator;
  final num? floorPrice;
  final num? totalPrice;
  final String? floorNote;
  final int? status;
  final String? statusName;
  final String? key;
  final List<MyOrderProgressStepEntity>? progressSteps;
  final int? warehouseId;
  final String? warehouseName;
  final double? warehouseLatitude;
  final double? warehouseLongitude;
  final String? warehouseMapUrl;
  final int? freelancerId;
  final String? freelancerName;
  final String? freelancerPhone;
  final String? merchantId;
  final String? merchantName;
  final int? reservedByFreelancerId;
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
  final List<MyOrderStatusHistoryEntity>? statusHistory;

  MyOrderItemEntity({
    this.id,
    this.orderNumber,
    this.orderDetails,
    this.companyId,
    this.companyName,
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
    this.floorNumber,
    this.hasElevator,
    this.floorPrice,
    this.totalPrice,
    this.floorNote,
    this.status,
    this.statusName,
    this.key,
    this.progressSteps,
    this.warehouseId,
    this.warehouseName,
    this.warehouseLatitude,
    this.warehouseLongitude,
    this.warehouseMapUrl,
    this.freelancerId,
    this.freelancerName,
    this.freelancerPhone,
    this.merchantId,
    this.merchantName,
    this.reservedByFreelancerId,
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

  factory MyOrderItemEntity.fromDto(MyOrderItemDto dto) {
    return MyOrderItemEntity(
      id: dto.id,
      orderNumber: dto.orderNumber,
      orderDetails: dto.orderDetails,
      companyId: dto.companyId,
      companyName: dto.companyName,
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
      floorNumber: dto.floorNumber,
      hasElevator: dto.hasElevator,
      floorPrice: dto.floorPrice,
      totalPrice: dto.totalPrice,
      floorNote: dto.floorNote,
      status: dto.status,
      statusName: dto.statusName,
      key: dto.key,
      progressSteps: dto.progressSteps?.map((e) => MyOrderProgressStepEntity.fromDto(e)).toList(),
      warehouseId: dto.warehouseId,
      warehouseName: dto.warehouseName,
      warehouseLatitude: dto.warehouseLatitude,
      warehouseLongitude: dto.warehouseLongitude,
      warehouseMapUrl: dto.warehouseMapUrl,
      freelancerId: dto.freelancerId,
      freelancerName: dto.freelancerName,
      freelancerPhone: dto.freelancerPhone,
      merchantId: dto.merchantId,
      merchantName: dto.merchantName,
      reservedByFreelancerId: dto.reservedByFreelancerId,
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
      statusHistory: dto.statusHistory?.map((e) => MyOrderStatusHistoryEntity.fromDto(e)).toList(),
    );
  }

  static List<MyOrderItemEntity> fromDtoList(List<MyOrderItemDto> dtos) {
    return dtos.map((dto) => MyOrderItemEntity.fromDto(dto)).toList();
  }
}

class MyOrderProgressStepEntity {
  final int? step;
  final String? key;
  final String? title;
  final bool? isDone;

  MyOrderProgressStepEntity({
    this.step,
    this.key,
    this.title,
    this.isDone,
  });

  factory MyOrderProgressStepEntity.fromDto(MyOrderProgressStepDto dto) {
    return MyOrderProgressStepEntity(
      step: dto.step,
      key: dto.key,
      title: dto.title,
      isDone: dto.isDone,
    );
  }
}

class MyOrderStatusHistoryEntity {
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

  MyOrderStatusHistoryEntity({
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

  factory MyOrderStatusHistoryEntity.fromDto(MyOrderStatusHistoryDto dto) {
    return MyOrderStatusHistoryEntity(
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

  static List<MyOrderStatusHistoryEntity> fromDtoList(List<MyOrderStatusHistoryDto> dtos) {
    return dtos.map((dto) => MyOrderStatusHistoryEntity.fromDto(dto)).toList();
  }
}
