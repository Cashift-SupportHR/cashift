import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';

import '../../../../../utils/app_utils.dart';
import '../../data/models/download_vehicle_violation_picture_params.dart';
import '../../data/models/driver_violation_dto.dart';
import '../../data/models/index.dart';

class DriverViolation {
  String? eventType;
  String? latitude;
  String? longitude;
  int? speed;
  String? time;
  String? eventIndexCode;
  int? mobilevehicleIndexCode;
  bool? isAllowPicture;

  DriverViolation({
    this.eventType,
    this.latitude,
    this.longitude,
    this.speed,
    this.time,
    this.eventIndexCode,
    this.mobilevehicleIndexCode,
    this.isAllowPicture,
  });

  factory DriverViolation.fromDto(DriverViolationDto dto) => DriverViolation(
    eventType: dto.eventType,
    latitude: dto.latitude,
    longitude: dto.longitude,
    speed: dto.speed,
    time: dto.time,
    eventIndexCode: dto.eventIndexCode,
    mobilevehicleIndexCode: dto.mobilevehicleIndexCode,
    isAllowPicture: dto.isAllowPicture,
  );

  static List<DriverViolation> fromDtoList(List<DriverViolationDto> dtos) =>
      dtos.map((dto) => DriverViolation.fromDto(dto)).toList();

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
}
