import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/presentation/adminFeatures/addOpportunity/data/models/opportunity_applicant_dto.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/data_sources/today_opportunity_api_provider.dart';
import '../../../addOpportunity/domain/entities/opportunity_applicant.dart';
import '../../domain/entities/opportunities/applicant_role.dart';
import '../models/index.dart';


@injectable
class TodayOpportunityRepository {
  final TodayOpportunityApiProvider _apiProvider;

  TodayOpportunityRepository(this._apiProvider);

  Future<ApiResponse<List<OpportunityDto>>> fetchTodayOpportunity() {
    return _apiProvider.getAllTodayOpportunity();
  }

  Future<ApiResponse<List<OpportunityDto>>> fetchOpportunityByStatus(int status) {
    return _apiProvider.fetchOpportunityByStatus(status);
  }

  Future<ApiResponse<FreeLanceInfo>> fetchEmployeeFreeLanceInfo(String phone) {
    return _apiProvider.fetchFreeLanceInfo(phone);
  }

  Future<ApiResponse<String>> assignListFreeLanceOpportunity(List<FreeLanceInfoParams> params) {
    return _apiProvider.assignListFreeLanceOpportunity(params);
  }

  Future<ApiResponse<OpportunityDetailsDto>> fetchOpportunityDetailsById(int id) {
    return _apiProvider.fetchOpportunityDetailsById(id);
  }

  Future<ApiResponse<String>> cancelOpportunityAvailableByDescription(int id, String description) {
    return _apiProvider.cancelOpportunityAvailableByDescription(id, description);
  }

  Future<ApiResponse<bool>> approveJobRequest(ApproveJobRequestParams params) {
    return _apiProvider.approveJobRequest(params);
  }

  Future<ApiResponse<bool>> updateAttendance(UpdateAttendanceParams params) {
    return _apiProvider.updateAttendance(params);
  }

  Future<ApiResponse<OpportunityDataDto>> fetchOpportunityByTypeWithPage(PaginationOpportunityParams params) {
    return _apiProvider.fetchOpportunityByTypeWithPage(params);
  }

  Future<List<OpportunityTabsDto>> fetchOpportunityTabs() async {
    final data = await _apiProvider.fetchOpportunityTabs();
    return data.payload!;
  }

  Future<List<PercentageOpportuntyDto>> fetchPercentageOpportunty({required int type}) async {
    final data = await _apiProvider.fetchPercentageOpportunty(type);
    return data.payload!;
  }

  Future<List<ProjectFiterOpportunityDto>> fetchProjects() async {
    final data = await _apiProvider.fetchProjects();
    return data.payload!;
  }

  Future<OpportunityApplicant> fetchApplicants({required int id, required int tab}) async {
    final data = await _apiProvider.fetchApplicants(id, tab);
    return OpportunityApplicant.fromDto(data.payload!);
  }

  Future<OpportunityDetailsDataDto> fetchOpportunityDetails({required int id}) async {
    final data = await _apiProvider.fetchOpportunityDetails(id);
    return data.payload!;
  }

  Future<ApplicantsDetailsDto> fetchApplicantsDetails({required int id}) async {
    final data = await _apiProvider.fetchApplicantsDetails(id);
    return data.payload!;
  }

  Future<List<ApplicantRole>> fetchApplicantEditListRoles() async {
    final data = await _apiProvider.fetchApplicantEditListRoles();
    return data.payload!.map((e) => ApplicantRole.fromDto(e)).toList();
  }
}
