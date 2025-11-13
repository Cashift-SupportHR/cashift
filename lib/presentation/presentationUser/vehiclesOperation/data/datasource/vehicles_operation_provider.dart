import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../data/models/api_response.dart';
import '../../../../../network/source/user_endpoint.dart';
import '../../../../adminFeatures/maintenanceAndBreakdowns/data/models/maintenance_dto.dart';
import '../../../../adminFeatures/vehicles/data/models/vehicle_details_dto.dart';
import '../../../../adminFeatures/vehicles/data/models/vehicle_image_face_dto.dart';
import '../../../../adminFeatures/vehicles/data/models/vehicle_violation_data_dto.dart';
import '../../../../adminFeatures/vehicles/data/models/vehicle_violation_dto.dart';
import '../../../../shared/models/common_list_item_dto.dart';
import '../models/add_round_trip_fill_station_prams.dart';
import '../models/confirm_receive_vehicle_params.dart';
import '../models/download_vehicle_violation_picture_params.dart';
import '../models/driver_violation_dto.dart';
import '../models/gas_station_trip_dto.dart';
import '../models/index.dart';
import '../models/receive_vehicle_details_dto.dart';
import '../models/receive_vehicle_prams.dart';
import '../models/vehicle_performance_dto.dart';
import '../models/vehicle_received_images_params.dart';

@Injectable()
class ReceiveVehiclesAPI {
  final UserEndpoint api;

  ReceiveVehiclesAPI(this.api);

  Future<ApiResponse<VehicleDetailsDto>> fetchVehicleByCode(String code) async {
    return await api.fetchVehicleByCode(code);
  }

  Future<ApiResponse<List<VehicleComponentsDto>>>
  fetchVehicleComponents() async {
    return await api.fetchVehicleComponents();
  }

  Future<ApiResponse<List<VehicleComponentsDto>>> fetchVehicleCustodies(
    int vehicleId,
  ) async {
    return await api.fetchVehicleCustodies(vehicleId);
  }

  Future<ApiResponse<ReceiveVehicleDto>> fetchReceiveVehicle(
    ReceiveVehiclePrams receiveVehiclePrams,
  ) async {
    return await api.fetchReceiveVehicle(receiveVehiclePrams);
  }

  Future<ApiResponse<CreateVehicleHandoverDto>> createVehicleHandover(
    CreateVehicleHandoverPrams createVehicleHandoverPrams,
  ) async {
    return await api.createVehicleHandover(createVehicleHandoverPrams);
  }

  Future<ApiResponse> addImageAndDescriptionsComponents(
    AddImageAndDescriptionsComponentsPrams
    addImageAndDescriptionsComponentsPrams,
    File? file,
  ) async {
    return await api.addImageAndDescriptionsComponents(
      addImageAndDescriptionsComponentsPrams,
      file: file,
    );
  }

  Future<ApiResponse> addImageAndDescriptionsCustodies(
    AddImageAndDescriptionsComponentsPrams
    addImageAndDescriptionsComponentsPrams,
    File? file,
  ) async {
    return await api.addImageAndDescriptionsCustodies(
      addImageAndDescriptionsComponentsPrams,
      file: file,
    );
  }

  Future<ApiResponse> addComponents(
    AddComponentsPrams addComponentsPrams,
  ) async {
    print(
      addComponentsPrams.vehicleComponentsStatuses
          ?.map((e) => e.toJson())
          .toList(),
    );
    return await api.addComponents(addComponentsPrams);
  }

  Future<ApiResponse> addCustodies(
    @Body() AddCustodiesPrams addCustodiesPrams,
  ) async {
    return await api.addCustodies(addCustodiesPrams);
  }

  Future<ApiResponse<List<CommonListItemDto>>>
  fetchAllFreeLancerVehiclesZones() async {
    return await api.fetchAllFreeLancerVehiclesZones();
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchAllRoundTypes() async {
    return await api.fetchAllRoundTypes();
  }

  Future<ApiResponse<List<RoundTypeTermsAndConditionDto>>>
  fetchRoundTypeTermsAndCondition(@Query('RoundTypeId') int roundTypeId) {
    return api.fetchRoundTypeTermsAndCondition(roundTypeId);
  }

  Future<ApiResponse> addRoundTrip(
    AddRoundTripParams addRoundTripParams,
  ) async {
    return await api.addRoundTrip(addRoundTripParams);
  }

  Future<ApiResponse> endRoundTrip(int tripId) async {
    return await api.endRoundTrip(tripId);
  }

  Future<ApiResponse<CurrentRoundTripDto>> fetchCurrentTrip() async {
    return await api.fetchCurrentTrip();
  }

  Future<ApiResponse> addRoundTripDetails(
    @Body() AddRoundTripDetailsParams params,
  ) async {
    return await api.addRoundTripDetails(params);
  }

  Future<ApiResponse<List<RoundTripDetailsDto>>> fetchRoundTripDetails(
    int roundTripId,
  ) async {
    return await api.fetchRoundTripDetails(roundTripId);
  }

  Future<ApiResponse<ReceiveVehicleDetailsDto>> fetchReceiveVehicleDetails(
    int id,
  ) async {
    return await api.fetchReceiveVehicleDetails(id);
  }

  Future<ApiResponse> confirmRejectReceiveVehicle(
    ConfirmReceiveVehicleParams params,
  ) async {
    return await api.confirmRejectReceiveVehicle(params);
  }

  Future<ApiResponse> addRoundTripFillStation(
    AddRoundTripFillStationPrams params,
  ) async {
    return await api.addRoundTripFillStation(params);
  }

  Future<ApiResponse<List<GasStationTripDto>>> fetchGasStationTrip(
    int roundId,
  ) async {
    return await api.fetchGasStationTrip(roundId);
  }

  Future<ApiResponse> addVehicleHandoverImages(
    VehicleReceivedImagesParams params,
  ) {
    FormData formData = FormData.fromMap(params.toJson());
    print('addVehicleHandoverImages ${params.toJson()}');
    formData.files.addAll(
      params.images.map((file) => MapEntry("images", file)),
    );
    return api.addVehicleHandoverImages(formData);
  }

  Future<ApiResponse<VehiclePerformanceDto>> fetchVehiclePerformance(int id) {
    return api.fetchVehiclePerformance(id);
  }

  Future<ApiResponse<DriverViolationDto>> fetchDriverViolations(int id) {
    return api.fetchDriverViolations(id);
  }

  Future<ApiResponse<String>> downloadVehicleViolationPicture(
    DownloadVehicleViolationPictureParams params,
  ) {
    return api.downloadVehicleViolationPicture(params);
  }

  Future<ApiResponse<ContractViolationDataDto>> fetchRoundViolation(
    int roundTripId,
  ) {
    return api.fetchRoundViolation(roundTripId);
  }

  Future<ApiResponse<MaintenanceDataDto>> fetchRoundsMaintenance(
    int roundTripId,
  ) {
    return api.fetchRoundsMaintenance(roundTripId);
  }
}
