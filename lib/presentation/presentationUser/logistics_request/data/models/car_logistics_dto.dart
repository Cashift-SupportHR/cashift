import 'package:json_annotation/json_annotation.dart';

part 'car_logistics_dto.g.dart';

@JsonSerializable()
class CarLogisticsDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "carSizeName")
  final String? carSizeName;
  @JsonKey(name: "maxPassengers")
  final int? maxPassengers;
  @JsonKey(name: "maxCartons")
  final int? maxCartons;
  @JsonKey(name: "iconKey")
  final String? iconKey;
  @JsonKey(name: "description")
  final String? description;

  CarLogisticsDto ({
    this.id,
    this.carSizeName,
    this.maxPassengers,
    this.maxCartons,
    this.iconKey,
    this.description,
  });

  factory CarLogisticsDto.fromJson(Map<String, dynamic> json) {
    return _$CarLogisticsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CarLogisticsDtoToJson(this);
  }
}


