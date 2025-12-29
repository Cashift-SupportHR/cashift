import 'package:json_annotation/json_annotation.dart';

part 'delivery_order_dto.g.dart';

@JsonSerializable()
class DeliveryOrderDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "customerAddress")
  final String? customerAddress;
  @JsonKey(name: "cityName")
  final String? cityName;
  @JsonKey(name: "districtName")
  final String? districtName;
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;
  @JsonKey(name: "totalPrice")
  final num? totalPrice;
  @JsonKey(name: "addedDate")
  final String? addedDate;
  @JsonKey(name: "distanceKm")
  final num? distanceKm;
  @JsonKey(name: "receiveFrom")
  final String? receiveFrom;
  @JsonKey(name: "orderDetails")
  final String? orderDetails;
  @JsonKey(name: "statusName")
  final String? statusName;

  DeliveryOrderDto ({
    this.id,
    this.orderNumber,
    this.statusName,
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
  });

  factory DeliveryOrderDto.fromJson(Map<String, dynamic> json) {
    return _$DeliveryOrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeliveryOrderDtoToJson(this);
  }
}


