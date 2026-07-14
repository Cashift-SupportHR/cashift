import 'package:json_annotation/json_annotation.dart';

part 'my_order_dto.g.dart';

@JsonSerializable()
class MyOrderDto {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "pageCount")
  final int? pageCount;
  @JsonKey(name: "pageSize")
  final int? pageSize;
  @JsonKey(name: "rowCount")
  final int? rowCount;
  @JsonKey(name: "firstRowOnPage")
  final int? firstRowOnPage;
  @JsonKey(name: "lastRowOnPage")
  final int? lastRowOnPage;
  @JsonKey(name: "results")
  final List<MyOrderItemDto>? results;

  MyOrderDto({
    this.currentPage,
    this.pageCount,
    this.pageSize,
    this.rowCount,
    this.firstRowOnPage,
    this.lastRowOnPage,
    this.results,
  });

  factory MyOrderDto.fromJson(Map<String, dynamic> json) => _$MyOrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderDtoToJson(this);
}

@JsonSerializable()
class MyOrderItemDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "orderDetails")
  final String? orderDetails;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "companyName")
  final String? companyName;
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
  @JsonKey(name: "floorNumber")
  final int? floorNumber;
  @JsonKey(name: "hasElevator")
  final bool? hasElevator;
  @JsonKey(name: "floorPrice")
  final num? floorPrice;
  @JsonKey(name: "totalPrice")
  final num? totalPrice;
  @JsonKey(name: "floorNote")
  final String? floorNote;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "statusName")
  final String? statusName;
  @JsonKey(name: "key")
  final String? key;
  @JsonKey(name: "progressSteps")
  final List<MyOrderProgressStepDto>? progressSteps;
  @JsonKey(name: "warehouseId")
  final int? warehouseId;
  @JsonKey(name: "warehouseName")
  final String? warehouseName;
  @JsonKey(name: "warehouseLatitude")
  final double? warehouseLatitude;
  @JsonKey(name: "warehouseLongitude")
  final double? warehouseLongitude;
  @JsonKey(name: "warehouseMapUrl")
  final String? warehouseMapUrl;
  @JsonKey(name: "freelancerId")
  final int? freelancerId;
  @JsonKey(name: "freelancerName")
  final String? freelancerName;
  @JsonKey(name: "freelancerPhone")
  final String? freelancerPhone;
  @JsonKey(name: "merchantId")
  final String? merchantId;
  @JsonKey(name: "merchantName")
  final String? merchantName;
  @JsonKey(name: "reservedByFreelancerId")
  final int? reservedByFreelancerId;
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
  final List<MyOrderStatusHistoryDto>? statusHistory;

  MyOrderItemDto({
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

  factory MyOrderItemDto.fromJson(Map<String, dynamic> json) => _$MyOrderItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderItemDtoToJson(this);
}

@JsonSerializable()
class MyOrderProgressStepDto {
  @JsonKey(name: "step")
  final int? step;
  @JsonKey(name: "key")
  final String? key;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "isDone")
  final bool? isDone;

  MyOrderProgressStepDto({
    this.step,
    this.key,
    this.title,
    this.isDone,
  });

  factory MyOrderProgressStepDto.fromJson(Map<String, dynamic> json) => _$MyOrderProgressStepDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderProgressStepDtoToJson(this);
}

@JsonSerializable()
class MyOrderStatusHistoryDto {
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

  MyOrderStatusHistoryDto({
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

  factory MyOrderStatusHistoryDto.fromJson(Map<String, dynamic> json) => _$MyOrderStatusHistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderStatusHistoryDtoToJson(this);
}
