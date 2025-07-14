import 'dart:io';

import '../../../../../common/data/models/api_response.dart';

import '../../../../../common/data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../../../usersManagement/data/models/brand_dto.dart';
import '../../../usersManagement/data/models/company_dto.dart';
import '../models/employe_point_dto.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProjectsManagementAPI {
  final AdminEndpoint api;

  ProjectsManagementAPI({required this.api});

  Future<ApiResponse<List<ProjectManagementDto>>> fetchProjects() {
    return api.fetchProjectsV3();
  }

  Future<ApiResponse<DownLoadFileDto>> downLoadQrCodeImage(
      String projectCode, String projectName) {
    return api.downLoadQrCodeImage(projectCode, projectName);
  }

  Future<ApiResponse<int>> addEditNewProject(
      int? id,
      int? companyId,
      int? brandId,
      int? cityId,
      String? brandName,
      String? cityName,
      String? nameEn,
      String? nameAr,
      String? addressEn,
      String? addressAr,
      String? latitude,
      String? longtude,
      int? attendanceTypeId,
      List<LocationProjectParams>? otherProject,
      String? imageURL,
      {File? image = null}) {
    return api.addEditNewProject(
        id,
        companyId,
        brandId,
        cityId,
        brandName,
        cityName,
        nameEn,
        nameAr,
        addressEn,
        addressAr,
        latitude,
        longtude,
        attendanceTypeId,
        otherProject,
        imageURL,
        image: image);
  }

  Future<ApiResponse<AddProjectParams>> fetchProjectInfoById(int? id) {
    return api.fetchProjectInfoById(id);
  }

  Future<ApiResponse<List<BrandDto>>> fetchListBrand() {
    return api.fetchListBrand();
  }

  Future<ApiResponse<List<CompanyDto>>> fetchCompanies() {
    return api.fetchCompanies();
  }

  Future<ApiResponse<List<CityDto>>> fetchCities() {
    return api.fetchCities();
  }

  Future<ApiResponse<ProjectLabelsDto>> fetchProjectLabels() {
    return api.fetchProjectLabels();
  }

  Future<ApiResponse<String>> deleteProject(int? id) {
    return api.deleteProject(id);
  }

  Future<ApiResponse<String>> deletePeriodPricing(int? id) {
    return api.deletePeriodPricing(id);
  }

  Future<ApiResponse<List<LocationProjectParams>>> fetchLocationInfoByProject(
      int? projectId) {
    return api.fetchLocationInfoByProject(projectId);
  }

  Future<ApiResponse<String>> addLocationProject(LocationProjectParams params) {
    return api.addLocationProject(params);
  }

  Future<ApiResponse<bool>> deleteLocationProject(int? id) {
    return api.deleteLocationProject(id);
  }

  Future<ApiResponse<String>> editLocationProject(
      LocationProjectParams params) {
    return api.editLocationProject(params);
  }

  Future<ApiResponse<String>> addPeriodPricing(AddPeriodPricingParams params) {
    return api.addPeriodPricing(params);
  }

  Future<ApiResponse<String>> editPeriodPricing(AddPeriodPricingParams params) {
    return api.editPeriodPricing(params);
  }

  Future<ApiResponse<List<PeriodOrderDto>>> fetchPeriodOrder() {
    return api.fetchPeriodOrder();
  }

  Future<ApiResponse<PricingDetailsDto>> fetchPeriodPricingDetails(int id) {
    return api.fetchPeriodPricingDetails(id);
  }

  Future<ApiResponse<PeriodPricingLabelDto>> fetchLabelAddPeriodOrder() {
    return api.fetchLabelAddPeriodOrder();
  }

  Future<ApiResponse<List<JobDto>>> fetchAllJobForDrops() {
    return api.fetchAllJobForDrops();
  }

  Future<ApiResponse<List<LastPriceDto>>> fetchInfoLastPricing(
      int ProjectId, int ShiftId) {
    return api.fetchInfoLastPricing(ProjectId, ShiftId);
  }

  Future<ApiResponse<WorkingPeriodLabelsDto>> fetchWorkingPeriodLabels() {
    return api.fetchWorkingPeriodLabels();
  }

  Future<ApiResponse<List<WorkingPeriodDto>>> fetchWorkingPeriodsByProjectId(
      int? projectId) {
    return api.fetchWorkingPeriodsByProjectId(projectId);
  }

  Future<ApiResponse<AddWorkingPeriodParams>> fetchWorkingPeriodDetails(
      int? id) {
    return api.fetchWorkingPeriodDetails(id);
  }

  Future<ApiResponse<List<TimePriceDto>>> fetchTimePrice(int companyId) {
    return api.fetchTimePrice(companyId);
  }

  Future<ApiResponse> addEditWorkingPeriod(AddWorkingPeriodParams params) {
    return api.addEditWorkingPeriod(params);
  }

  Future<ApiResponse<String>> deleteWorkingPeriod(int? id) {
    return api.deleteWorkingPeriod(id);
  }

  Future<ApiResponse<List<ShiftTimeDto>>> fetchShift(int projectId) {
    return api.fetchShift(projectId);
  }

  Future<ApiResponse<List<PeriodPricingDto>>> fetchPeriodPricing(
      int projectId) {
    return api.fetchPeriodPricing(projectId);
  }

  Future<ApiResponse<ProjectManagementDto>> fetchProjectSuccessfully(
      int projectId) {
    return api.fetchProjectSuccessfully(projectId);
  }

  Future<ApiResponse<LocationGateProjectDto>> fetchLocationGateProject(
      int projectId) {
    return api.fetchLocationGateProject(projectId);
  }

  Future<ApiResponse<List<EmployePointDto>>> fetchEmpLocationGate(
      String pointId) {
    return api.fetchEmpLocationGate(pointId);
  }
}
