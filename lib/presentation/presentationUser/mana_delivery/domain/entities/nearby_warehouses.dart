import '../../data/models/nearby_warehouses_dto.dart';

class NearbyWarehousesEntity {
  final int? id;
  final String? name;
  final double? distanceKm;
  final double? latitude;
  final double? longitude;
  final String? mapUrl;
  final String? fullAddress;
  final String? managerPhone;
  final String? cityName;
  final String? districtName;

  NearbyWarehousesEntity({
    this.id,
    this.name,
    this.distanceKm,
    this.latitude,
    this.longitude,
    this.mapUrl,
    this.fullAddress,
    this.managerPhone,
    this.cityName,
    this.districtName,
  });

  /// 🔁 تحويل من DTO إلى Entity
  factory NearbyWarehousesEntity.fromDto(NearbyWarehousesDto dto) {
    return NearbyWarehousesEntity(
      id: dto.id,
      name: dto.name,
      distanceKm: dto.distanceKm,
      latitude: dto.latitude,
      longitude: dto.longitude,
      mapUrl: dto.mapUrl,
      fullAddress: dto.fullAddress,
      managerPhone: dto.managerPhone,
      cityName: dto.cityName,
      districtName: dto.districtName,
    );
  }

  /// 🔁 تحويل List<DTO> إلى List<Entity>
  static List<NearbyWarehousesEntity> fromDtoList(
      List<NearbyWarehousesDto> dtos,
      ) =>
      dtos
          .map((dto) => NearbyWarehousesEntity.fromDto(dto))
          .toList();
}
