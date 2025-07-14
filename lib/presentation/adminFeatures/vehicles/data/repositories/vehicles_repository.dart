import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/add_covenant_vehicle_params.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/add_vehicle_params.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/vehicle_image_params.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/domain/entities/index.dart';

import '../../../../../common/data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../domain/entities/vehicleTraking.dart';
import '../models/vehicle_event_picture_prams.dart';
import '../models/vehicle_traking_details_prams.dart';
import '../../../../shared/models/common_list_item.dart';
import '../../domain/entities/camera_search_results.dart';
import '../datasource/vehicles_provider.dart';
import '../models/index.dart';

@injectable
class VehiclesRepository {
  final VehiclesAPI _api;

  VehiclesRepository(this._api);

  Future<List<VehiclesDto>> fetchVehicles() async {
    final response = await _api.fetchVehicles();
    return response.payload!;
  }

  Future<List<InsuranceTypesDto>> fetchInsuranceTypes() async {
    final response = await _api.fetchInsuranceTypes();
    return response.payload!;
  }

  Future<List<InsurancesDto>> fetchInsurancesByVehicleId(int vehicleId) async {
    final response = await _api.fetchInsurancesByVehicleId(vehicleId);
    return response.payload!;
  }

  Future<VehicleDetails> fetchVehicleById(int id) async {
    final response = await _api.fetchVehicleById(id);
    return VehicleDetails.fromDto(response.payload!);
  }

  Future<ApiResponse> deleteVehicle(int id) async {
    return await _api.deleteVehicle(id);
  }

  Future<List<CommonListItem>> fetchVehiclesTypes() async {
    final data = await _api.fetchVehiclesTypes();
    return CommonListItem.fromDtoList(data.payload!);
  }

  Future<List<CommonListItem>> fetchVehiclesColors() async {
    final data = await _api.fetchVehiclesColors();
    return CommonListItem.fromDtoList(data.payload!);
  }

  Future<ApiResponse> deleteInsurance(int id) async {
    return await _api.deleteInsurance(id);
  }

  Future<int> addVehicle(AddVehicleParams params) async {
    print("params.vehicleImageFile ${params.toJson()}");
    final data = await _api.addVehicle(
      params.vehicleCode,
      params.model,
      params.yearOfManufacture,
      params.plateNumber,
      params.licenseNumber,
      params.licenseExpiryDate,
      params.specifications,
      params.vehicleImageFile!,
      params.vehicleBrandId,
      params.companyId,
      params.projectId,
      params.vehicleColorId,
      params.mobileVehicleIndexCode,
    );
    return data.payload?.id ?? 0;
  }

  Future<ApiResponse> addInsurance(AddInsurancePrams params) async {
    return await _api.addInsurance(
      params.insuranceNumber,
      params.insuranceProvider,
      params.insuranceExpiryDate,
      params.vehicleId,
      params.vehicleInsuranceTypeId,
      params.insuranceImage ?? File(""),
    );
  }

  Future<ApiResponse> editInsurance(AddInsurancePrams params) async {
    return await _api.editInsurance(
      params.id ?? 0,
      params.insuranceNumber ?? "",
      params.insuranceProvider ?? "",
      params.insuranceExpiryDate ?? "",
      params.vehicleId ?? 0,
      params.vehicleInsuranceTypeId ?? "",
      insuranceImage: params.insuranceImage,
    );
  }

  Future<ApiResponse> editVehicle(AddVehicleParams params) async {
    return await _api.editVehicle(
      params.id,
      params.vehicleCode,
      params.model,
      params.yearOfManufacture,
      params.plateNumber,
      params.licenseNumber,
      params.licenseExpiryDate,
      params.specifications,
      params.vehicleImage,
      params.vehicleBrandId,
      params.companyId,
      params.projectId,
      params.vehicleColorId,
      params.mobileVehicleIndexCode,
      vehicleImageFile: params.vehicleImageFile,
    );
  }

  Future<ApiResponse> addVehicleImages(VehicleImageParams params) async {
    return await _api.addVehicleImages(
      params.images,
      params.vehicleId,
    );
  }

  Future<List<VehicleImageFace>> fetchVehiclesImagesFaces() async {
    final response = await _api.fetchVehiclesImagesFaces();
    return VehicleImageFace.fromListDto(response.payload!);
  }

  Future<List<CovenantVehicle>> fetchCovenants(int id) async {
    final response = await _api.fetchCovenants(id);
    return CovenantVehicle.fromJsonList(response.payload!);
  }

  Future<ApiResponse> addCovenant(AddCovenantVehicleParams params) async {
    print("params.custodyImage ${params.toJson()}");
    return await _api.addCovenant(
      params.vehicleId,
      params.name,
      params.description,
      params.custodyImagePath,
      params.custodyImage!,
    );
  }

  Future<ApiResponse> editCovenant(AddCovenantVehicleParams params) async {
    print("params.custodyImage ${params.toJson()}");
    return await _api.editCovenant(
      params.id,
      params.vehicleId,
      params.name,
      params.description,
      params.custodyImagePath,
      custodyImage: params.custodyImage,
    );
  }

  Future<ApiResponse> deleteCovenant(int id) async {
    return await _api.deleteCovenant(id);
  }

  Future<List<ContractViolation>> fetchVehicleViolations() async {
    final res = await _api.fetchVehicleViolations();
    return ContractViolation.fromDtoList(res.payload!);
  }

  Future<ContractViolation> fetchVehicleViolationsById(int id) async {
    final res = await _api.fetchVehicleViolationsById(id);
    return ContractViolation.fromDto(res.payload!);
  }

  Future<ApiResponse> addContractViolation(
      AddVehicleViolationParams params) async {
    return await _api.addContractViolation(params);
  }

  Future<List<CommonListItem>> fetchVehicleViolationTypes() async {
    final res = await _api.fetchVehicleViolationTypes();
    return CommonListItem.fromDtoList(res.payload!);
  }

  Future<ApiResponse> addContractViolationAttachments(
      AddVehicleViolationAttachmentParams params) async {
    return await _api.addContractViolationAttachments(
      params.files ?? [],
      params.id ?? 0,
    );
  }

  Future<List<CommonListItem>> fetchActionVehicleReceiveRequestStatues() async {
    final res = await _api.fetchActionVehicleReceiveRequestStatues();
    return CommonListItem.fromDtoList(res.payload!);
  }

  Future<List<CommonListItem>> fetchVehicleReceiveRequestTypesTabs() async {
    final res = await _api.fetchVehicleReceiveRequestTypesTabs();
    return CommonListItem.fromDtoList(res.payload!);
  }

  Future<List<VehicleReceiveRequest>> fetchVehicleReceiveRequestsByType(
      int type) async {
    final res = await _api.fetchVehicleReceiveRequestsByType(type);
    res.payload?.sort(
        (a, b) => a.vehicleHandoverTime!.compareTo(b.vehicleHandoverTime!));
    return VehicleReceiveRequest.fromDtoList(res.payload!);
  }

  Future<ApiResponse> actionVehicleReceiveRequest(
      ActionVehicleReceiveRequestParams params) async {
    final res = await _api.actionVehicleReceiveRequest(params);
    return res;
  }

  Future<ApiResponse> finalActionVehicleReceiveRequest(
      FinalActionVehicleReceiveRequestParams params) async {
    final res = await _api.finalActionVehicleReceiveRequest(params);
    return res;
  }

  Future<List<CommonListItem>> fetchVehicleEmployeeByProject(
      int projectId) async {
    final res = await _api.fetchVehicleEmployeeByProject(projectId);
    return CommonListItem.fromDtoList(res.payload!);
  }

  Future<ApiResponse<DownLoadFileDto>> qrCodeVehicle(int vehicleId) async {
    final response = await _api.qrCodeVehicle(vehicleId);
    return response;
  }

  Future<List<VehicleCamera>> fetchVehicleCameras(int vehicleId) async {
    final response = await _api.fetchVehicleCameras(vehicleId);
    return VehicleCamera.fromDtoList(response.payload!);
  }

  Future<VehicleCamera> fetchVehicleCameraById(int id) async {
    final response = await _api.fetchVehicleCameraById(id);
    return VehicleCamera.fromDto(response.payload!);
  }

  Future<ApiResponse> addVehicleCamera(AddVehicleCameraParams params) async {
    return await _api.addVehicleCamera(params);
  }

  Future<ApiResponse> deleteVehicleCamera(int id) async {
    return await _api.deleteVehicleCamera(id);
  }

  Future<ApiResponse> editVehicleCamera(AddVehicleCameraParams params) async {
    return await _api.editVehicleCamera(params);
  }

  Future<CameraSearchResults> fetchVehicleVideo(
      VehicleVideoParams params) async {
    final date = await _api.fetchVehicleVideo(params);
    return CameraSearchResults.fromDto(date.payload!);
  }

  Future<VehicleTrackingEntity> fetchVehicleTracingDetails(
      VehicleTrakingDetailsPrams prams) async {
    final res = await _api.fetchVehicleTracingDetails(prams);
    return VehicleTrackingEntity.fromDto(res.payload!);
  }

  Future<String> fetchVehicleEventPicture(
      VehicleEventPicturePrams prams) async {
    final res = await _api.fetchVehicleEventPicture(prams);
     return res.payload ?? "";
  }
}
