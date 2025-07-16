import '../../../../../main_index.dart';
import '../../../../shared/components/texts/list_row_texts_icons_v2.dart';
import '../../data/models/receive_vehicle_details_dto.dart';
import 'custody_handover.dart';
import 'vehicle_component_handover.dart';

class ReceiveVehicleDetails {
  List<String>? vehicleHandoverImages;
  List<VehicleComponentHandover>? vehiclesComponentsHandovers;
  List<CustodyHandover>? vehiclesCustodiesHandovers;
  int? id;
  int? vehicleId;
  int? roundTripId;
  String? vehicleBrand;
  String? vehicleModel;
  String? vehiclePlateNumber;
  String? vehicleHandoverDate;
  String? vehicleHandoverTime;
  int? freelancerInfoId;
  String? freelancerName;
  String? vehicleImage;
  bool? isComplete;
  int? companyId;
  String? companyName;
  int? projectId;
  int? vehicleTrueCustodiesCount;
  int? vehicleTrueComponentsCount;
  String? projectName;
  String? licenseExpiryDate;
  String? licenseNumber;
  String? specifications;

  ReceiveVehicleDetails({
    this.vehicleHandoverImages,
    this.vehiclesComponentsHandovers,
    this.vehiclesCustodiesHandovers,
    this.id,
    this.vehicleTrueComponentsCount,
    this.vehicleTrueCustodiesCount,
    this.vehicleId,
    this.roundTripId,
    this.vehicleBrand,
    this.vehicleModel,
    this.vehiclePlateNumber,
    this.vehicleHandoverDate,
    this.vehicleHandoverTime,
    this.freelancerInfoId,
    this.freelancerName,
    this.vehicleImage,
    this.isComplete,
    this.companyId,
    this.companyName,
    this.projectId,
    this.projectName,
    this.licenseExpiryDate,
    this.licenseNumber,
    this.specifications,
  });

  factory ReceiveVehicleDetails.fromDto(ReceiveVehicleDetailsDto json) =>
      ReceiveVehicleDetails(
        vehicleHandoverImages: json.vehicleHandoverImages,
        vehiclesComponentsHandovers: VehicleComponentHandover.fromDtoList(
            json.vehiclesComponentsHandovers ?? []),
        vehiclesCustodiesHandovers:
            CustodyHandover.fromDtoList(json.vehiclesCustodiesHandovers ?? []),
        id: json.id,
        vehicleId: json.vehicleId,
        roundTripId: json.roundTripId,
        vehicleBrand: json.vehicleBrand,
        vehicleModel: json.vehicleModel,
        vehiclePlateNumber: json.vehiclePlateNumber,
        vehicleHandoverDate: json.vehicleHandoverDate,
        vehicleHandoverTime: json.vehicleHandoverTime,
        freelancerInfoId: json.freelancerInfoId,
        freelancerName: json.freelancerName,
        vehicleImage: json.vehicleImage,
        isComplete: json.isComplete,
        companyId: json.companyId,
        companyName: json.companyName,
        projectId: json.projectId,
        projectName: json.projectName,
        licenseExpiryDate: json.licenseExpiryDate,
        licenseNumber: json.licenseNumber,
        specifications: json.specifications,
      );

  static List<ReceiveVehicleDetails> fromDtoList(
      List<ReceiveVehicleDetailsDto> dtos) {
    return dtos.map((e) => ReceiveVehicleDetails.fromDto(e)).toList();
  }

  List<ListRowTextItem> basicInfo(AppLocalizations strings) {
    return [
      ListRowTextItem(
        title: strings.vehicle_type,
        value: vehicleBrand ?? '',
      ),
      ListRowTextItem(
        title: strings.company_name,
        value: companyName ?? '',
      ),
      ListRowTextItem(
        title: strings.project_name,
        value: projectName ?? '',
      ),
      ListRowTextItem(
        title: strings.model_name,
        value: vehicleModel ?? '',
      ),
      ListRowTextItem(
        title: strings.model_year,
        value: vehiclePlateNumber ?? '',
      ),
    ];
  }

  List<ListRowTextItem> plateAndLicenseInfo(AppLocalizations strings) {
    return [
      ListRowTextItem(
        title: strings.plate_number,
        value: vehiclePlateNumber ?? '',
      ),
      ListRowTextItem(
        title: strings.license_number,
        value: licenseNumber ?? '',
      ),
      ListRowTextItem(
        title: strings.license_expiry_date,
        value: licenseExpiryDate ?? '',
      ),
    ];
  }

  List<ListRowTextItem> additionalSpecifications(AppLocalizations strings) {
    return [
      ListRowTextItem(
        title: strings.additional_specifications,
        value: specifications ?? '',
      ),
    ];
  }
}
