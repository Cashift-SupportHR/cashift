import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/data/models/vehicle_component_handover_dto.dart';

import 'custody_handover_dto.dart';

part 'receive_vehicle_details_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ReceiveVehicleDetailsDto {
  @JsonKey(name: 'vehicleHandoverImages')
  List<String>? vehicleHandoverImages;
  @JsonKey(name: 'vehiclesComponentsHandovers')
  List<VehicleComponentHandoverDto>? vehiclesComponentsHandovers;
  @JsonKey(name: 'vehiclesCustodiesHandovers')
  List<CustodyHandoverDto>? vehiclesCustodiesHandovers;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'vehicleId')
  int? vehicleId;
  @JsonKey(name: 'vehicleBrand')
  String? vehicleBrand;
  @JsonKey(name: 'vehicleModel')
  String? vehicleModel;
  @JsonKey(name: 'vehiclePlateNumber')
  String? vehiclePlateNumber;
  @JsonKey(name: 'vehicleHandoverDate')
  String? vehicleHandoverDate;
  @JsonKey(name: 'vehicleHandoverTime')
  String? vehicleHandoverTime;
  @JsonKey(name: 'freelancerInfoId')
  int? freelancerInfoId;
  @JsonKey(name: 'freelancerName')
  String? freelancerName;
  @JsonKey(name: 'vehicleImage')
  String? vehicleImage;
  @JsonKey(name: 'isComplete')
  bool? isComplete;
  @JsonKey(name: 'companyId')
  int? companyId;
  @JsonKey(name: 'vehicleTrueComponentsCount')
  int? vehicleTrueComponentsCount;
  @JsonKey(name: 'vehicleTrueCustodiesCount')
  int? vehicleTrueCustodiesCount;
  @JsonKey(name: 'companyName')
  String? companyName;
  @JsonKey(name: 'projectId')
  int? projectId;
  @JsonKey(name: 'roundTripId')
  int? roundTripId;
  @JsonKey(name: 'projectName')
  String? projectName;
  @JsonKey(name: 'licenseExpiryDate')
  String? licenseExpiryDate;
  @JsonKey(name: 'licenseNumber')
  String? licenseNumber;
  @JsonKey(name: 'specifications')
  String? specifications;

  ReceiveVehicleDetailsDto({this.roundTripId,this.vehicleTrueComponentsCount,this.vehicleTrueCustodiesCount, this.vehicleHandoverImages, this.vehiclesComponentsHandovers, this.vehiclesCustodiesHandovers, this.id, this.vehicleId, this.vehicleBrand, this.vehicleModel, this.vehiclePlateNumber, this.vehicleHandoverDate, this.vehicleHandoverTime, this.freelancerInfoId, this.freelancerName, this.vehicleImage, this.isComplete, this.companyId, this.companyName, this.projectId, this.projectName, this.licenseExpiryDate, this.licenseNumber, this.specifications});

   factory ReceiveVehicleDetailsDto.fromJson(Map<String, dynamic> json) => _$ReceiveVehicleDetailsDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ReceiveVehicleDetailsDtoToJson(this);
}

