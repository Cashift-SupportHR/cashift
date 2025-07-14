
 import 'package:shiftapp/common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import '../../../addOpportunity/data/models/opportunity_applicant_dto.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodayOpportunityApiProvider {
  final AdminEndpoint api;
  TodayOpportunityApiProvider(this.api);

  Future<ApiResponse<List<OpportunityDto>>> getAllTodayOpportunity() {
    return api.getAllTodayOpportunity();
  }

  Future<ApiResponse<List<OpportunityDto>>> fetchOpportunityByStatus(int type) {
    return api.fetchOpportunityByStatus(type);
  }

  Future<ApiResponse<FreeLanceInfo>> fetchFreeLanceInfo(String type) {
    return api.fetchFreeLanceInfo(type);
  }

  Future<ApiResponse<String>> assignListFreeLanceOpportunity(
      List<FreeLanceInfoParams> params) {
    return api.assignListFreeLanceOpportunity(params);
  }

  Future<ApiResponse<OpportunityDetailsDto>> fetchOpportunityDetailsById(
      int id) {
    return api.fetchOpportunityDetailsById(id);
  }

  Future<ApiResponse<String>> cancelOpportunityAvailableByDescription(
      int id, String description) {
    return api.cancelOpportunityAvailableByDescription(id, description);
  }

  Future<ApiResponse<bool>> approveJobRequest(ApproveJobRequestParams params) {
    return api.approveJobRequest(params);
  }

  Future<ApiResponse<bool>> updateAttendance(UpdateAttendanceParams params) {
    return api.updateAttendance(params);
  }

  Future<ApiResponse<OpportunityDataDto>> fetchOpportunityByTypeWithPage(
      PaginationOpportunityParams params) {
    return api.fetchOpportunityByTypeWithPage(params);
  }

  Future<ApiResponse<List<OpportunityTabsDto>>> fetchOpportunityTabs() {
    return api.fetchOpportunityTabs();
  }

  Future<ApiResponse<List<PercentageOpportuntyDto>>> fetchPercentageOpportunty(
      int Type) {
    return api.fetchPercentageOpportunty(Type);
  }

  Future<ApiResponse<List<ProjectFiterOpportunityDto>>> fetchProjects() {
    return api.fetchProjectsToDo();
  }

  Future<ApiResponse<OpportunityApplicantDto>> fetchApplicants(int id, int tab) {
    return api.fetchApplicants(id, tab);
  }

  Future<ApiResponse<OpportunityDetailsDataDto>> fetchOpportunityDetails(
    int id,
  ) {
    return api.fetchOpportunityDetails(id);
  }

  Future<ApiResponse<ApplicantsDetailsDto>> fetchApplicantsDetails(
    int id,
  ) {
    return api.fetchApplicantsDetails(id);
  }

  Future<ApiResponse<List<ApplicantRoleDto>>> fetchApplicantEditListRoles() {
    return api.fetchApplicantEditListRoles();
  }
}
