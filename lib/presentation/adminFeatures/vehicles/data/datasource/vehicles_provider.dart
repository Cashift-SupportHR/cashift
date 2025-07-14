import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
  import '../models/vehicle_event_picture_prams.dart';
import '../models/vehicle_traking_details_prams.dart';
import '../models/action_vehicle_receive_request_params.dart';
import '../models/add_vehicle_camera_params.dart';
import '../models/add_vehicle_violation_params.dart';
import '../models/camera_search_results_dto.dart';
import '../models/final_action_vehicle_receive_request_params.dart';
import '../models/vehicle_camera_dto.dart';
import '../models/vehicle_receive_request_dto.dart';
import '../models/vehicle_traking_dto.dart';
import '../models/vehicle_video_params.dart';
import '../models/vehicle_violation_dto.dart';
import '../models/covenant_vehicle_dto.dart';
import '../models/insurance_types_dto.dart';
import '../models/insurances_dto.dart';
import '../models/vehicle_image_face_dto.dart';
import '../models/vehicle_details_dto.dart';
import '../models/vehicles_dto.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class VehiclesAPI {
  final AdminEndpoint api;

  VehiclesAPI({required this.api});

  Future<ApiResponse<List<CommonListItemDto>>> fetchVehiclesTypes() {
    return api.fetchVehiclesTypes();
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchVehiclesColors() {
    return api.fetchVehiclesColors();
  }

  Future<ApiResponse<VehicleDetailsDto>> fetchVehicleById(int id) {
    return api.fetchVehicleById(id);
  }

  Future<ApiResponse<VehiclesDto>> addVehicle(
    int? vehicleCode,
    String? model,
    String? yearOfManufacture,
    String? plateNumber,
    String? licenseNumber,
    String? licenseExpiryDate,
    String? specifications,
    File VehicleImageFile,
    String? vehicleBrandId,
    String? companyId,
    String? projectId,

    int? vehicleColorId,
      String? mobileVehicleIndexCode,
  ) {
    return api.addVehicle(
        vehicleCode,
        model,
        yearOfManufacture,
        plateNumber,
        licenseNumber,
        licenseExpiryDate,
        specifications,
        VehicleImageFile,
        vehicleBrandId,
        companyId,
        projectId,
        vehicleColorId,
        mobileVehicleIndexCode);
  }

  Future<ApiResponse> addInsurance(
    String? insuranceNumber,
    String? insuranceProvider,
    String? insuranceExpiryDate,
    int? vehicleId,
    String? vehicleInsuranceTypeId,
    File insuranceImage,
  ) {
    return api.addInsurance(insuranceNumber, insuranceProvider,
        insuranceExpiryDate, vehicleId, vehicleInsuranceTypeId, insuranceImage);
  }

  Future<ApiResponse> editInsurance(
      int? id,
      String? insuranceNumber,
      String? insuranceProvider,
      String? insuranceExpiryDate,
      int? vehicleId,
      String? vehicleInsuranceTypeId,
      {File? insuranceImage = null}) {
    return api.editInsurance(id, insuranceNumber, insuranceProvider,
        insuranceExpiryDate, vehicleId, vehicleInsuranceTypeId,
        insuranceImage: insuranceImage);
  }

  Future<ApiResponse<VehiclesDto>> editVehicle(
      int? id,
      int? vehicleCode,
      String? model,
      String? yearOfManufacture,
      String? plateNumber,
      String? licenseNumber,
      String? licenseExpiryDate,
      String? specifications,
      String? vehicleImage,
      String? vehicleBrandId,
      String? companyId,
      String? projectId,

      int? vehicleColorId,
      String? mobileVehicleIndexCode,
      {File? vehicleImageFile = null}) {
    return api.editVehicle(
        id,
        vehicleCode,
        model,
        yearOfManufacture,
        plateNumber,
        licenseNumber,
        licenseExpiryDate,
        specifications,
        vehicleImage,
        vehicleBrandId,
        companyId,
        projectId,
        vehicleColorId,
        mobileVehicleIndexCode,
        vehicleImageFile: vehicleImageFile);
  }

  Future<ApiResponse<List<VehiclesDto>>> fetchVehicles() {
    return api.fetchVehicles();
  }

  Future<ApiResponse<List<InsuranceTypesDto>>> fetchInsuranceTypes() {
    return api.fetchInsuranceTypes();
  }

  Future<ApiResponse> deleteVehicle(int id) {
    return api.deleteVehicle(id);
  }

  Future<ApiResponse> deleteInsurance(int id) {
    return api.deleteInsurance(id);
  }

  Future<ApiResponse<List<InsurancesDto>>> fetchInsurancesByVehicleId(
      int vehicleId) {
    return api.fetchInsurancesByVehicleId(vehicleId);
  }

  Future<ApiResponse> addVehicleImages(
    List<MultipartFile> images,
    int vehicleId,
  ) {
    return api.addVehicleImages(images, vehicleId);
  }

  Future<ApiResponse<List<VehicleImageFaceDto>>> fetchVehiclesImagesFaces() {
    return api.fetchVehiclesImagesFaces();
  }

  Future<ApiResponse<List<CovenantVehicleDto>>> fetchCovenants(int vehicleId) {
    return api.fetchCovenants(vehicleId);
  }

  Future<ApiResponse> addCovenant(
    int? vehicleId,
    String? Name,
    String? Description,
    String? custodyImagePath,
    File custodyImage,
  ) {
    return api.addCovenant(
        vehicleId, Name, Description, custodyImagePath, custodyImage);
  }

  Future<ApiResponse> editCovenant(int? id, int? vehicleId, String? Name,
      String? Description, String? custodyImagePath,
      {File? custodyImage = null}) {
    return api.editCovenant(id, vehicleId, Name, Description, custodyImagePath,
        custodyImage: custodyImage);
  }

  Future<ApiResponse> deleteCovenant(int id) {
    return api.deleteCovenant(id);
  }

  Future<ApiResponse<List<ContractViolationDto>>> fetchVehicleViolations() {
    return api.fetchVehicleViolations();
  }

  Future<ApiResponse<ContractViolationDto>> fetchVehicleViolationsById(int id) {
    return api.fetchVehicleViolationsById(id);
  }

  Future<ApiResponse<ContractViolationDto>> addContractViolation(
      AddVehicleViolationParams params) {
    return api.addContractViolation(params);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchVehicleViolationTypes() {
    return api.fetchVehicleViolationTypes();
  }

  Future<ApiResponse> addContractViolationAttachments(
    List<File> attachments,
    int contractViolationId,
  ) {
    return api.addContractViolationAttachments(
        attachments, contractViolationId);
  }

  Future<ApiResponse<List<CommonListItemDto>>>
      fetchActionVehicleReceiveRequestStatues() {
    return api.fetchActionVehicleReceiveRequestStatues();
  }

  Future<ApiResponse<List<CommonListItemDto>>>
      fetchVehicleReceiveRequestTypesTabs() {
    return api.fetchVehicleReceiveRequestTypesTabs();
  }

  Future<ApiResponse<List<VehicleReceiveRequestDto>>>
      fetchVehicleReceiveRequestsByType(int type) async {
    return api.fetchVehicleReceiveRequestsByType(type);
  }

  Future<ApiResponse> actionVehicleReceiveRequest(
      ActionVehicleReceiveRequestParams params) {
    return api.actionVehicleReceiveRequest(params);
  }

  Future<ApiResponse> finalActionVehicleReceiveRequest(
      FinalActionVehicleReceiveRequestParams params) {
    return api.finalActionVehicleReceiveRequest(params);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchVehicleEmployeeByProject(
      int id) {
    return api.fetchVehicleEmployeeByProject(id);
  }

  Future<ApiResponse<DownLoadFileDto>> qrCodeVehicle(int vehicleId) {
    return api.qrCodeVehicle(vehicleId);
  }

  Future<ApiResponse<List<VehicleCameraDto>>> fetchVehicleCameras(int vehicleId) {
    return api.fetchVehicleCameras(vehicleId);
  }

  Future<ApiResponse<VehicleCameraDto>> fetchVehicleCameraById(int id){
    return api.fetchVehicleCameraById(id);
  }

  Future<ApiResponse> addVehicleCamera(AddVehicleCameraParams params) {
    return api.addVehicleCamera(params);
  }

  Future<ApiResponse> editVehicleCamera(AddVehicleCameraParams params) {
    return api.editVehicleCamera(params);
  }

  Future<ApiResponse> deleteVehicleCamera(int id) {
    return api.deleteVehicleCamera(id);
  }

  Future<ApiResponse<CameraSearchResultsDto>> fetchVehicleVideo(VehicleVideoParams params) {
    return api.fetchVehicleVideo(params);
  }
  Future<ApiResponse<VehicleTrakingDto>> fetchVehicleTracingDetails(
      VehicleTrakingDetailsPrams prams) {
    return api.fetchVehicleTracingDetails(prams);
  }

  Future<ApiResponse<String>> fetchVehicleEventPicture(
        VehicleEventPicturePrams prams){
    return  api.fetchVehicleEventPicture(prams);
  }
}
