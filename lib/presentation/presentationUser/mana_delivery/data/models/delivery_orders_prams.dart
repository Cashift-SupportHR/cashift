import 'package:json_annotation/json_annotation.dart';

part 'delivery_orders_prams.g.dart';

@JsonSerializable()
class DeliveryOrdersPrams {
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "lng")
  final double? lng;

  DeliveryOrdersPrams ({
    this.lat,
    this.lng,
  });

  factory DeliveryOrdersPrams.fromJson(Map<String, dynamic> json) {
    return _$DeliveryOrdersPramsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeliveryOrdersPramsToJson(this);
  }
}


