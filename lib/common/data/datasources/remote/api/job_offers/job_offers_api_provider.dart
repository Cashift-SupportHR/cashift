import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/data/models/shift/index.dart';
import 'package:shiftapp/common/domain/entities/shift/index_shift.dart';
import '../../../../../network/source/user_endpoint.dart';

@Injectable()
class JobOffersAPI {
  final UserEndpoint api;

  JobOffersAPI(this.api);

  Future<ApiResponse<List<JobOfferDto>>> fetchOpportunities(){
    return api.fetchOpportunities();
  }


  Future<ApiResponse<List<JobOfferDto>>> fetchVIPOpportunities(){
    return api.fetchVIPOpportunities();
  }


  Future<ApiResponse<List<JobOfferDto>>> fetchSepcialOpportunities(){
    return api.fetchSepcialOpportunities();
  }


  Future<ApiResponse<List<JobOfferDto>>> fetchFavoritesOpportunities(){
    return api.fetchFavoritesOpportunities();
  }


  Future<ApiResponse<List<JobOfferDto>>> fetchOpportunitiesUnAuth(){
    return api.fetchOpportunitiesUnAuth();
  }


  Future<ApiResponse<String>> applyJob(int id ){
    return api.applyJob(id);
  }



  Future<ApiResponse<List<AppliedOfferDto>>> fetchAppliedOpportunities(int statusId){
    return api.fetchAppliedOpportunities(statusId);
  }

  Future<ApiResponse<String>> startShift( StartShiftParams shiftParams){
    return api.startShift(shiftParams);
  }

  Future<ApiResponse<String>> finishShift( EndShiftParams shiftParams){
    return api.finishShift(shiftParams);
  }

  Future<ApiResponse<AppliedOfferDto>> fetchCurrentShift(){
    return api.fetchCurrentShift();
  }


  Future<ApiResponse<JobDetailsDto>> fetchOpportunityDetails(String id ){
    return api.fetchOpportunityDetails(id);
  }


  Future<ApiResponse<JobTerms>> fetchTermsAndConditionByCompanyId(String id){
    return api.fetchTermsAndConditionByCompanyId(id);
  }


  Future<ApiResponse<InterviewInfo>> requestToJobInterview(String companyId){
    return api.requestToJobInterview(companyId);
  }


  Future<ApiResponse<bool>> fetchSelectedFavoriteProjectsStatus(){
    return api.fetchSelectedFavoriteProjectsStatus();
  }


  Future<ApiResponse<bool>> checkFreeLanceHaveBankInfo(){
    return api.checkFreeLanceHaveBankInfo();
  }


  Future<ApiResponse<AppliedOfferDto>> fetchStartSoonShift(){
    return api.fetchStartSoonShift();
  }

  Future<ApiResponse<bool>> cancelShift( CancelShiftParams params){
    return api.cancelShift(params);
  }


  Future<ApiResponse<List<InAppRequiredTask>>> fetchInAppRequiredTasks(){
    return api.fetchInAppRequiredTasks();
  }


  Future<ApiResponse<List<JobOfferSliderDto>>> fetchJobOffersSliders(){
    return api.fetchJobOffersSliders();
  }


  Future<ApiResponse<String>> addFreeLanceOffer(int id){
    return api.addFreeLanceOffer(id);
  }


  Future<ApiResponse<String>> confirmRequiredTask(int type){
    return api.confirmRequiredTask(type);
  }



  Future<ApiResponse<String>> confirmDashBoardAction(String? type, String? objectData){
    return api.confirmDashBoardAction(type, objectData);
  }


  Future<ApiResponse<CheckWorkingDocumentDto>> checkCertificateJob(int? JobId){
    return api.checkCertificateJob(JobId);
  }


  Future<ApiResponse<CancelOpportunityApologizingDto>> fetchCancelOpportunityApologizingData(int? id){
    return api.fetchCancelOpportunityApologizingData(id);
  }
}
