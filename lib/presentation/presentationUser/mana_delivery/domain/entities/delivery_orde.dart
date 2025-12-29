import '../../data/models/delivery_order_dto.dart';

class DeliveryOrderEntity {
  final int? id;
  final int? status;
  final String? orderNumber;
  final String? customerAddress;
  final String? cityName;
  final String? districtName;
  final double? latitude;
  final double? longitude;
  final num? totalPrice;
  final String? addedDate;
  final num? distanceKm;
  final String? receiveFrom;
  final String? orderDetails;
  final String? statusName;

  DeliveryOrderEntity({
    this.id,
    this.orderNumber,
    this.customerAddress,
    this.cityName,
    this.districtName,
    this.latitude,
    this.longitude,
    this.totalPrice,
    this.addedDate,
    this.distanceKm,
    this.receiveFrom,
    this.orderDetails,
    this.status,
    this.statusName,
  });

  factory DeliveryOrderEntity.fromDto(DeliveryOrderDto dto) {
    return DeliveryOrderEntity(
      id: dto.id,
      orderNumber: dto.orderNumber,
      customerAddress: dto.customerAddress,
      cityName: dto.cityName,
      districtName: dto.districtName,
      latitude: dto.latitude,
      longitude: dto.longitude,
      totalPrice: dto.totalPrice,
      addedDate: dto.addedDate,
      distanceKm: dto.distanceKm,
      receiveFrom: dto.receiveFrom,
      orderDetails: dto.orderDetails,
      status: dto.status,
      statusName: dto.statusName,
    );
  }

  static List<DeliveryOrderEntity> fromDtoList(
      List<DeliveryOrderDto> dtos,
      ) =>
      dtos
          .map((dto) => DeliveryOrderEntity.fromDto(dto))
          .toList();
}
