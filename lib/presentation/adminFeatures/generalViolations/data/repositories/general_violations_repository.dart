import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import '../../../../presentationUser/workHazards/data/models/upload_work_hazard_files_params.dart';
import '../../../../shared/models/common_list_item.dart';
import '../../domain/entities/follow_up_violation.dart';
import '../../domain/entities/index.dart';
import '../../domain/entities/violation_employee.dart';
import '../models/action_follow_up_violation_params.dart';
import '../models/add_type_violation_params.dart';
import '../models/final_action_follow_up_violation_params.dart';
import '../models/index.dart';

@injectable
class GeneralViolationsRepository {
  final GeneralViolationsAPI _api;

  GeneralViolationsRepository(this._api);

  Future<List<GeneralViolation>> fetchGeneralViolations() async {
    final response = await _api.fetchGeneralViolations();
    return GeneralViolation.fromListDto(response.payload!);
  }

  Future<GeneralViolation> fetchGeneralViolationDetails(int id) async {
    final response = await _api.fetchGeneralViolationDetails(id);
    return GeneralViolation.fromDto(response.payload!);
  }

  Future<List<ViolationType>> fetchAllViolationsTypes() async {
    final response = await _api.fetchAllViolationsTypes();
    return ViolationType.fromListDto(response.payload!);
  }

  Future<List<CommonListItem>> fetchViolationsTypes() async {
    final response = await _api.fetchViolationsTypes();
    return CommonListItem.fromDtoList(response.payload!);
  }

  Future<List<ViolationByProjectId>> fetchViolationsTypesByProjectId(
      int id) async {
    final response = await _api.fetchViolationsTypesByProjectId(id);
    return ViolationByProjectId.fromListDto(response.payload!);
  }

  Future<ApiResponse> addTypeViolation(AddTypeViolationParams params) async {
    final response = await _api.addTypeViolation(params);
    return response;
  }

  Future<ApiResponse> addGeneralViolation(
      AddGeneralViolationParams params) async {
    final response = await _api.addGeneralViolation(params);
    return response;
  }

  Future<ApiResponse> uploadWorkHazardFiles(
      UploadWorkHazardFilesParams params) async {
    return await _api.uploadFiles(params.id, params.files);
  }

  Future<List<ViolationEmployee>> fetchEmployeeWorksByShiftId(int? id) async {
    final response = await _api.fetchEmployeeWorksByShiftId(id);
    return ViolationEmployee.fromListDto(response.payload!);
  }

  Future<List<CommonListItem>> fetchTypesTabsOfContractViolation() async {
    final response = await _api.fetchTypesTabsOfContractViolation();
    return CommonListItem.fromDtoList(response.payload!);
  }

  Future<List<FollowUpViolation>> fetchFollowUpViolationsByType(
      int type) async {
    final response = await _api.fetchFollowUpViolationsByType(type);
    return FollowUpViolation.fromDtoList(response.payload!);
  }

  Future<List<CommonListItem>> fetchViolationImportantLevels() async {
    final response = await _api.fetchViolationImportantLevels();
    return CommonListItem.fromDtoList(response.payload!);
  }

  Future<ApiResponse> actionFollowUpViolation(
      ActionFollowUpViolationParams params) async {
    return await _api.actionFollowUpViolation(params);
  }

  Future<ApiResponse> finalActionFollowUpViolation(
      FinalActionFollowUpViolationParams params) async {
    return await _api.finalActionFollowUpViolation(params);
  }
}
