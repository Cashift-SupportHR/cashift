// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderDto _$MyOrderDtoFromJson(Map<String, dynamic> json) => MyOrderDto(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  pageCount: (json['pageCount'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  rowCount: (json['rowCount'] as num?)?.toInt(),
  firstRowOnPage: (json['firstRowOnPage'] as num?)?.toInt(),
  lastRowOnPage: (json['lastRowOnPage'] as num?)?.toInt(),
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => MyOrderItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MyOrderDtoToJson(MyOrderDto instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageCount': instance.pageCount,
      'pageSize': instance.pageSize,
      'rowCount': instance.rowCount,
      'firstRowOnPage': instance.firstRowOnPage,
      'lastRowOnPage': instance.lastRowOnPage,
      'results': instance.results,
    };

MyOrderItemDto _$MyOrderItemDtoFromJson(
  Map<String, dynamic> json,
) => MyOrderItemDto(
  id: (json['id'] as num?)?.toInt(),
  orderNumber: json['orderNumber'] as String?,
  orderDetails: json['orderDetails'] as String?,
  companyId: (json['companyId'] as num?)?.toInt(),
  companyName: json['companyName'] as String?,
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
  floorNumber: (json['floorNumber'] as num?)?.toInt(),
  hasElevator: json['hasElevator'] as bool?,
  floorPrice: json['floorPrice'] as num?,
  totalPrice: json['totalPrice'] as num?,
  floorNote: json['floorNote'] as String?,
  status: (json['status'] as num?)?.toInt(),
  statusName: json['statusName'] as String?,
  key: json['key'] as String?,
  progressSteps: (json['progressSteps'] as List<dynamic>?)
      ?.map((e) => MyOrderProgressStepDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  warehouseId: (json['warehouseId'] as num?)?.toInt(),
  warehouseName: json['warehouseName'] as String?,
  warehouseLatitude: (json['warehouseLatitude'] as num?)?.toDouble(),
  warehouseLongitude: (json['warehouseLongitude'] as num?)?.toDouble(),
  warehouseMapUrl: json['warehouseMapUrl'] as String?,
  freelancerId: (json['freelancerId'] as num?)?.toInt(),
  freelancerName: json['freelancerName'] as String?,
  freelancerPhone: json['freelancerPhone'] as String?,
  merchantId: json['merchantId'] as String?,
  merchantName: json['merchantName'] as String?,
  reservedByFreelancerId: (json['reservedByFreelancerId'] as num?)?.toInt(),
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
      ?.map((e) => MyOrderStatusHistoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MyOrderItemDtoToJson(MyOrderItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'orderDetails': instance.orderDetails,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
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
      'floorNumber': instance.floorNumber,
      'hasElevator': instance.hasElevator,
      'floorPrice': instance.floorPrice,
      'totalPrice': instance.totalPrice,
      'floorNote': instance.floorNote,
      'status': instance.status,
      'statusName': instance.statusName,
      'key': instance.key,
      'progressSteps': instance.progressSteps,
      'warehouseId': instance.warehouseId,
      'warehouseName': instance.warehouseName,
      'warehouseLatitude': instance.warehouseLatitude,
      'warehouseLongitude': instance.warehouseLongitude,
      'warehouseMapUrl': instance.warehouseMapUrl,
      'freelancerId': instance.freelancerId,
      'freelancerName': instance.freelancerName,
      'freelancerPhone': instance.freelancerPhone,
      'merchantId': instance.merchantId,
      'merchantName': instance.merchantName,
      'reservedByFreelancerId': instance.reservedByFreelancerId,
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
      'statusHistory': instance.statusHistory,
    };

MyOrderProgressStepDto _$MyOrderProgressStepDtoFromJson(
  Map<String, dynamic> json,
) => MyOrderProgressStepDto(
  step: (json['step'] as num?)?.toInt(),
  key: json['key'] as String?,
  title: json['title'] as String?,
  isDone: json['isDone'] as bool?,
);

Map<String, dynamic> _$MyOrderProgressStepDtoToJson(
  MyOrderProgressStepDto instance,
) => <String, dynamic>{
  'step': instance.step,
  'key': instance.key,
  'title': instance.title,
  'isDone': instance.isDone,
};

MyOrderStatusHistoryDto _$MyOrderStatusHistoryDtoFromJson(
  Map<String, dynamic> json,
) => MyOrderStatusHistoryDto(
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

Map<String, dynamic> _$MyOrderStatusHistoryDtoToJson(
  MyOrderStatusHistoryDto instance,
) => <String, dynamic>{
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
