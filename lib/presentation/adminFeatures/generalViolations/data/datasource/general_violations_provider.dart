import 'dart:io';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../../../../shared/models/common_list_item_dto.dart';
import '../models/action_follow_up_violation_params.dart';
import '../models/add_type_violation_params.dart';
import '../models/final_action_follow_up_violation_params.dart';
import '../models/follow_up_violation_dto.dart';
import '../models/index.dart';
import '../models/violation_by_project_id_dto.dart';
import '../models/violation_employee_dto.dart';
import '../models/violation_type_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class GeneralViolationsAPI {
  final AdminEndpoint api;

  GeneralViolationsAPI({required this.api});

  Future<ApiResponse<List<GeneralViolationDto>>> fetchGeneralViolations() {
    return api.fetchGeneralViolations();
  }

  Future<ApiResponse<GeneralViolationDto>> fetchGeneralViolationDetails(
      int id) {
    return api.fetchGeneralViolationDetails(id);
  }

  Future<ApiResponse<List<ViolationTypeDto>>> fetchAllViolationsTypes() {
    return api.fetchAllViolationsTypes();
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchViolationsTypes() {
    return api.fetchViolationsTypes();
  }

  Future<ApiResponse<List<ViolationByProjectIdDto>>>
      fetchViolationsTypesByProjectId(int id) {
    return api.fetchViolationsTypesByProjectId(id);
  }

  Future<ApiResponse> addTypeViolation(AddTypeViolationParams params) {
    return api.addTypeViolation(params);
  }

  Future<ApiResponse<GeneralViolationDto>> addGeneralViolation(AddGeneralViolationParams params) {
    return api.addGeneralViolation(params);
  }

  Future<ApiResponse> uploadFiles(int? id, List<File> files) {
    return api.uploadFiles(id, files);
  }

  Future<ApiResponse<List<ViolationEmployeeDto>>> fetchEmployeeWorksByShiftId(
       int? id){return  api.fetchEmployeeWorksByShiftId(id);}

  Future<ApiResponse<List<CommonListItemDto>>> fetchTypesTabsOfContractViolation(){
    return api.fetchTypesTabsOfContractViolation();
  }

  Future<ApiResponse<List<FollowUpViolationDto>>> fetchFollowUpViolationsByType(int type){
    return api.fetchFollowUpViolationsByType(type);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchViolationImportantLevels(){
    return api.fetchViolationImportantLevels();
  }

  Future<ApiResponse> actionFollowUpViolation(ActionFollowUpViolationParams params){
    return api.actionFollowUpViolation(params);
  }

  Future<ApiResponse> finalActionFollowUpViolation(FinalActionFollowUpViolationParams params){
    return api.finalActionFollowUpViolation(params);
  }
}
