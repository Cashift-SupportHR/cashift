import '../../data/models/car_logistics_dto.dart';

class CarLogisticsEntity {
  final int? id;
  final String? carSizeName;
  final int? maxPassengers;
  final int? maxCartons;
  final String? iconKey;
  final String? description;

  CarLogisticsEntity({
    this.id,
    this.carSizeName,
    this.maxPassengers,
    this.maxCartons,
    this.iconKey,
    this.description,
  });

  factory CarLogisticsEntity.fromDto(CarLogisticsDto dto) {
    return CarLogisticsEntity(
      id: dto.id,
      carSizeName: dto.carSizeName,
      maxPassengers: dto.maxPassengers,
      maxCartons: dto.maxCartons,
      iconKey: dto.iconKey,
      description: dto.description,
    );
  }

  static List<CarLogisticsEntity> fromDtoList(List<CarLogisticsDto> dtos) =>
      dtos.map((dto) => CarLogisticsEntity.fromDto(dto)).toList();
}
