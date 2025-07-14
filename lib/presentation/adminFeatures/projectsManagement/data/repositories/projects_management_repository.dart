import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../usersManagement/data/models/brand_dto.dart';
import '../../../usersManagement/domain/entities/company.dart';
import '../datasource/projects_management_provider.dart';
import '../models/employe_point_dto.dart';
import '../models/index.dart';

@injectable
class ProjectsManagementRepository {
  final ProjectsManagementAPI _api;

  ProjectsManagementRepository(this._api);

  Future<List<ProjectManagementDto>> fetchProjects() async {
    final response = await _api.fetchProjects();
    return response.payload!;
  }

  Future<ApiResponse<DownLoadFileDto>> downLoadQrCode(String projectCode, String projectName) async {
    final response = await _api.downLoadQrCodeImage(projectCode, projectName);
    return response;
  }

  Future<ApiResponse<int>> addEditNewProject(AddProjectParams params) async {
    print('params.image ${params.toJson()}');
    final response = await _api.addEditNewProject(
      params.id,
      params.companyId,
      params.brandId,
      params.cityId,
      params.brandName,
      params.cityName,
      params.nameEn,
      params.nameAr,
      params.addressEn,
      params.addressAr,
      params.latitude,
      params.longtude,
      params.attendanceTypeId,
      params.otherProject,
      params.imageURL,
      image: (params.image != null && params.image!.isNotEmpty) ? File(params.image!) : null,
    );
    return response;
  }

  Future<AddProjectParams> fetchProjectInfoById(int? id) async {
    final response = await _api.fetchProjectInfoById(id);
    return response.payload!;
  }

  Future<List<BrandDto>> fetchListBrand() async {
    final response = await _api.fetchListBrand();
    return response.payload!;
  }

  Future<List<CityDto>> fetchCities() async {
    final response = await _api.fetchCities();
    return response.payload!;
  }

  Future<List<Company>> fetchCompanies() async {
    final response = await _api.fetchCompanies();
    return response.payload!.map((e) => Company.fromDto(e)).toList();
  }

  Future<ProjectLabelsDto> fetchProjectLabels() async {
    final response = await _api.fetchProjectLabels();
    return response.payload!;
  }

  Future<String> deleteProject(int? id) async {
    final response = await _api.deleteProject(id);
    return response.message!;
  }

  Future<List<LocationProjectParams>> fetchLocationInfoByProject(int? projectId) async {
    final response = await _api.fetchLocationInfoByProject(projectId);
    return response.payload!;
  }

  Future<String> addLocationProject(LocationProjectParams params) async {
    final response = await _api.addLocationProject(params);
    return response.message!;
  }

  Future<String> deleteLocationProject(int? id) async {
    final response = await _api.deleteLocationProject(id);
    return response.message!;
  }

  Future<String> editLocationProject(LocationProjectParams params) async {
    final response = await _api.editLocationProject(params);
    return response.message!;
  }

  Future<List<PeriodOrderDto>> fetchPeriodOrder() async {
    final response = await _api.fetchPeriodOrder();
    return response.payload!;
  }

  Future<List<JobDto>> fetchAllJobForDrops() async {
    final response = await _api.fetchAllJobForDrops();
    return response.payload!;
  }

  Future<WorkingPeriodLabelsDto> fetchWorkingPeriodLabels() async {
    final response = await _api.fetchWorkingPeriodLabels();
    return response.payload!;
  }

  Future<List<WorkingPeriodDto>> fetchWorkingPeriodsByProjectId(int? projectId) async {
    final response = await _api.fetchWorkingPeriodsByProjectId(projectId);
    return response.payload!;
  }

  Future<AddWorkingPeriodParams> fetchWorkingPeriodDetails(int id) async {
    final response = await _api.fetchWorkingPeriodDetails(id);
    return response.payload!;
  }

  Future<String> addEditWorkingPeriod(AddWorkingPeriodParams params) async {
    final response = await _api.addEditWorkingPeriod(params);
    return response.message!;
  }

  Future<String> deleteWorkingPeriod(int? id) async {
    final response = await _api.deleteWorkingPeriod(id);
    return response.message!;
  }

  Future<List<ShiftTimeDto>> fetchShift({required int projectId}) async {
    final response = await _api.fetchShift(projectId);
    return response.payload!;
  }

  Future<List<TimePriceDto>> fetchTimePrice({required int companyId}) async {
    final response = await _api.fetchTimePrice(companyId);
    return response.payload!;
  }

  Future<List<PeriodPricingDto>> fetchPeriodPricing({required int projectId}) async {
    final response = await _api.fetchPeriodPricing(projectId);
    return response.payload!;
  }

  Future<PeriodPricingLabelDto> fetchLabelAddPeriodOrder() async {
    final response = await _api.fetchLabelAddPeriodOrder();
    return response.payload!;
  }

  Future<PricingDetailsDto> fetchPeriodPricingDetails(int id) async {
    final response = await _api.fetchPeriodPricingDetails(id);
    return response.payload!;
  }

  Future<String> deletePeriodPricing({required int id}) async {
    final response = await _api.deletePeriodPricing(id);
    return response.message!;
  }

  Future<String> addPeriodPricing({required AddPeriodPricingParams addPeriodPricingParams}) async {
    final response = await _api.addPeriodPricing(addPeriodPricingParams);
    return response.message!;
  }

  Future<String> editPeriodPricing({required AddPeriodPricingParams addPeriodPricingParams}) async {
    final response = await _api.editPeriodPricing(addPeriodPricingParams);
    return response.message!;
  }

  Future<List<LastPriceDto>> fetchInfoLastPricing({required int idShift, required int projectId}) async {
    final response = await _api.fetchInfoLastPricing(projectId, idShift);
    return response.payload!;
  }



  Future<ProjectManagementDto> fetchProjectSuccessfully(int projectId) async {
    final response = await _api.fetchProjectSuccessfully(projectId);
    return response.payload!;
  }
  Future<LocationGateProjectDto> fetchLocationGateProject(int projectId) async {
    final response = await _api.fetchLocationGateProject(projectId);
    return response.payload!;
  }

  Future<List<EmployePointDto>> fetchEmpLocationGate({required String pointId, }) async {
    final response = await _api.fetchEmpLocationGate(pointId);
    return response.payload!;
  }

}
