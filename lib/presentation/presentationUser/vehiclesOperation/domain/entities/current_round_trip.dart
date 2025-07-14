
import 'package:shiftapp/presentation/adminFeatures/areapolygones/data/models/add_vehicle_zone_params.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/domain/entities/vehicle_violation_args.dart';

import '../../data/models/index.dart';

class CurrentRoundTrip {
  int? id;
  int? vehiclesZoneId;
  String? vehiclesZoneName;
  int? numberOfViolations;
  int? roundTypeId;
  String? roundTypeName;
  bool? isAllowToTrackTime;
  String? startRound;
  List<VehicleZoneLatLng>? latlngs;
  String? roundTypeCode;
  bool? isRequiredPubup;
  String? pubupMessage;
  double? stationLatitude;
  double? stationLongitude;

  CurrentRoundTrip({

    this.id, this.vehiclesZoneId, this.vehiclesZoneName, this.numberOfViolations, this.roundTypeId, this.roundTypeName, this.isAllowToTrackTime, this.startRound, this.latlngs,    this.roundTypeCode,
    this.isRequiredPubup,
    this.pubupMessage,
    this.stationLatitude,
    this.stationLongitude,});

   factory CurrentRoundTrip.fromDto(CurrentRoundTripDto json) => CurrentRoundTrip(
      id: json.id,
      vehiclesZoneId: json.vehiclesZoneId,
      vehiclesZoneName: json.vehiclesZoneName,
      numberOfViolations: json.numberOfViolations,
      roundTypeId: json.roundTypeId,
      roundTypeName: json.roundTypeName,
      isAllowToTrackTime: json.isAllowToTrackTime,
      startRound: json.startRound,
      latlngs: json.latlngs,
     roundTypeCode: json.roundTypeCode,
     isRequiredPubup: json.isRequiredPubup,
     pubupMessage: json.pubupMessage,
     stationLatitude: json.stationLatitue,
     stationLongitude: json.stationLongtude,
  );

  AddVehicleViolationArgs getVehicleViolationArgs() {
    return AddVehicleViolationArgs(
      roundTripId: id,
    );
  }
}

