
import '../../../../../domain/entities/shared/date_formatter.dart';
import '../../../../../utils/app_utils.dart';
import '../../data/models/download_vehicle_violation_picture_params.dart';
import '../../data/models/driver_violation_dto.dart';

class DriverViolation {
  final List<VehicleEventEntity>? vehicleEvents;
  final int? count;

  DriverViolation({
    this.vehicleEvents,
    this.count,
  });

  factory DriverViolation.fromDto(DriverViolationDto dto) {
    return DriverViolation(
      vehicleEvents: dto.vehicleEvents?.map((e) => VehicleEventEntity.fromDto(e)).toList(),
      count: dto.count,
    );
  }

  static List<DriverViolation> fromDtoList(List<DriverViolationDto> dtos) =>
      dtos.map((dto) => DriverViolation.fromDto(dto)).toList();
}

class VehicleEventEntity {
  final String? eventIndexCode;
  final String? eventType;
  final int? mobilevehicleIndexCode;
  final String? latitude;
  final String? longitude;
  final int? speed;
  final String? time;
  final bool? isAllowPicture;
  final int? companyId;
  final String? companyName;
  final String? address;

  VehicleEventEntity({
    this.eventIndexCode,
    this.eventType,
    this.mobilevehicleIndexCode,
    this.latitude,
    this.longitude,
    this.speed,
    this.time,
    this.isAllowPicture,
    this.companyId,
    this.companyName,
    this.address,
  });

  factory VehicleEventEntity.fromDto(VehicleEvents dto) {
    return VehicleEventEntity(
      eventIndexCode: dto.eventIndexCode,
      eventType: dto.eventType,
      mobilevehicleIndexCode: dto.mobilevehicleIndexCode,
      latitude: dto.latitude,
      longitude: dto.longitude,
      speed: dto.speed,
      time: dto.time,
      isAllowPicture: dto.isAllowPicture,
      companyId: dto.companyId,
      companyName: dto.companyName,
      address: dto.address,
    );
  }
  String get dateFormated => DateFormatter.repairApiDateTime(time ?? '');

  void openMap() {
    AppUtils.openMap(
      double.tryParse(latitude ?? '0') ?? 0.0,
      double.tryParse(longitude ?? '0') ?? 0.0,
    );
  }

  DownloadVehicleViolationPictureParams getDownloadViolationPictureParams() {
    return DownloadVehicleViolationPictureParams(
      eventIndexCode: eventIndexCode,
      mobileVehicleIndexCode: mobilevehicleIndexCode?.toString(),
    );
  }


  static List<VehicleEventEntity> fromDtoList(List<VehicleEvents> dtos) =>
      dtos.map((dto) => VehicleEventEntity.fromDto(dto)).toList();
}
