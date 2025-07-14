
import '../../data/models/gas_station_trip_dto.dart';
import '../../data/models/index.dart';

class GasStationTrip {
  int? fillingStationId;
  String? fillingStationNameAr;
  String? fillingStationNameEn;
  double? latitude;
  double? longitude;

  GasStationTrip({
    this.fillingStationId,
    this.fillingStationNameAr,
    this.fillingStationNameEn,
    this.latitude,
    this.longitude,
  });

  factory GasStationTrip.fromDto(GasStationTripDto dto) => GasStationTrip(
        fillingStationId: dto.fillingStationId,
        fillingStationNameAr: dto.fillingStationNameAr,
        fillingStationNameEn: dto.fillingStationNameEn,
        latitude: dto.latitude,
        longitude: dto.longtude, // Mapping fixed typo
      );

  static List<GasStationTrip> fromDtoList(List<GasStationTripDto> json) {
    return json.map((e) => GasStationTrip.fromDto(e)).toList();
  }
}
