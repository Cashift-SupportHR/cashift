import '../../data/models/delivery_order_dto.dart';

class DeliveryOrderEntity {
  final int? id;
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
    );
  }

  static List<DeliveryOrderEntity> fromDtoList(
      List<DeliveryOrderDto> dtos,
      ) =>
      dtos
          .map((dto) => DeliveryOrderEntity.fromDto(dto))
          .toList();
}
