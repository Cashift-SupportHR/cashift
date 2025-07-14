import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:injectable/injectable.dart';

import 'package:shiftapp/common/data/datasources/remote/api/job_offers/job_offers_api_provider.dart';
 import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/data/models/shift/index.dart';


import 'package:shiftapp/common/domain/entities/shift/index_shift.dart';




@Injectable()
class JobOffersRepository {

  final JobOffersAPI api;

  JobOffersRepository(this.api);

  Future<List<JobOfferDto>> fetchOpportunities() async {
    final response = await api.fetchOpportunities();
    return response.payload!;
  }

  Future<List<JobOfferDto>> fetchVIPOpportunities() async {
    final response = await api.fetchVIPOpportunities();
    return response.payload!;
  }
  Future<List<JobOfferDto>> fetchFavoritesOpportunities() async {
    final response = await api.fetchFavoritesOpportunities();
    return response.payload!;
  }

  Future<List<JobOfferDto>> fetchSepcialOpportunities() async {
    final response = await api.fetchSepcialOpportunities();
    return response.payload!;
  }

  Future<List<JobOfferDto>> fetchOpportunitiesUnAuth() async {
    final response = await api.fetchOpportunitiesUnAuth();
    return response.payload!;
  }


  Future<List<AppliedOfferDto>?> fetchAppliedOpportunities(int statusId) async {
    final response = await api.fetchAppliedOpportunities(statusId);
    return response.payload!;
  }

  Future<String> applyOpportunities(int id) async {
    final response = await api.applyJob(id);
    return response.message!;
  }
  Future<ApiResponse<String>> startShift(StartShiftParams shiftParams) async {
    final response   = await api.startShift(shiftParams);
    return response;
  }

  Future<String> finishShift(EndShiftParams shiftParams) async {
    final response = await api.finishShift(shiftParams);
    return response.message!;
  }

  Future<ApiResponse<AppliedOfferDto>> fetchCurrentShift() async {
    return api.fetchCurrentShift();
  }
  Future<JobDetailsDto?> fetchOpportunityDetails(String id) async {
    final response = await api.fetchOpportunityDetails(id);
    return response.payload;
  }
  Future<JobTerms> fetchTermsAndConditionByCompanyId(CompanyTermsParams params) async {
    final response = await api.fetchTermsAndConditionByCompanyId(params.id);
    return response.payload!;
  }

  Future<ApiResponse<InterviewInfo>> requestToJobInterview(String companyId) async {
    final response = await api.requestToJobInterview(companyId);
    return response;
  }

  Future<ApiResponse<bool>> cancelShift(CancelShiftParams params) async {
    return await api.cancelShift(params);
  }

  Future<bool> fetchSelectedFavoriteProjectsStatus() async {
    try {
      final response = await api.fetchSelectedFavoriteProjectsStatus();
      return response.payload==true;
    }catch(e){}
    return false;
  }
  Future<bool> checkFreeLanceHaveBankInfo() async {
    try {
      final response = await api.checkFreeLanceHaveBankInfo();
      return response.payload==true;
    }catch(e){}
    return false;
  }

  Future<ApiResponse<AppliedOfferDto>> fetchStartSoonShift() async {
    return api.fetchStartSoonShift();
  }

  Future<ApiResponse<List<InAppRequiredTask>>> fetchInAppRequiredTasks() async {
    return api.fetchInAppRequiredTasks();
  }

  Future<ApiResponse<List<JobOfferSliderDto>>> fetchJobOffersSliders() async {
    return api.fetchJobOffersSliders();
  }

  Future<ApiResponse<String>> addFreeLanceOffer(int id) async {
    return api.addFreeLanceOffer(id);
  }

  Future<ApiResponse<String>> confirmRequiredTask(int type) async {
    return api.confirmRequiredTask(type);
  }

  Future<ApiResponse<String>> confirmDashBoardAction({String? type, String? objectData}) async {
    return api.confirmDashBoardAction(type, objectData);
  }

  Future<ApiResponse<CheckWorkingDocumentDto>> checkCertificateJob(int id) async {
    return api.checkCertificateJob(id);
  }

  Future<ApiResponse<CancelOpportunityApologizingDto>> fetchCancelOpportunityApologizingData(int id){
    return api.fetchCancelOpportunityApologizingData(id);
  }

}
