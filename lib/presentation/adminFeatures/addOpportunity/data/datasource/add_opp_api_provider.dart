 import 'package:shiftapp/common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../../../projectsManagement/data/models/job_dto.dart';
import '../models/index.dart';
 import 'package:injectable/injectable.dart';

 @injectable
class AddOpportunityAPI {
  final AdminEndpoint api;

  AddOpportunityAPI({required this.api});

  Future<ApiResponse<String>> addOpportunity(AddOpportunityParams params) {
    return api.addOpportunity(params);
  }

  Future<ApiResponse<String>> editOpportunity(AddOpportunityParams params) {
    return api.editOpportunity(params);
  }

  Future<ApiResponse<CalcOpportunityDto>> fetchCalcOpportunity() {
    return api.fetchCalcOpportunity();
  }

  Future<ApiResponse<ShiftDto>> fetchListShift(FilterShiftParams params) {
    return api.fetchListShift(params);
  }

  Future<ApiResponse<ContractConditionsDto>> fetchContractsConditions(
      ContractConditionParams params) {
    return api.fetchContractsConditions(params);
  }

  Future<ApiResponse<SchedulePriceOpportunity>>
      fetchSchedulePriceDetailForOpportunity(
          SchedulePriceOpportunityParams params) {
    return api.fetchSchedulePriceDetailForOpportunity(params);
  }

  Future<ApiResponse<TypeApproveModelDto>> fetchTypeApprove() {
    return api.fetchTypeApprove();
  }

  Future<ApiResponse<List<EmployeeOpportunityTypeDto>>>
      fetchEmployeesTypesOpportunity() {
    return api.fetchEmployeesTypesOpportunity();
  }

  Future<ApiResponse<List<EmployeeOpportunityDto>>> fetchEmployeesOpportunities(
      EmployeesOpportunityParams params) {
    return api.fetchEmployeesOpportunities(params);
  }

  Future<ApiResponse<List<ArrivalDepartureTypeDto>>>
      fetchTypesArrivalDeparture() {
    return api.fetchTypesArrivalDeparture();
  }

  Future<ApiResponse<List<JobDto>>> fetchJobsByProjectId(int projectId) {
    return api.fetchJobsByProjectId(projectId);
  }
}
