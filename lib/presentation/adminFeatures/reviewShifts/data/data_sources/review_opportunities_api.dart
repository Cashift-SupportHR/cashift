
 import 'package:shiftapp/common/data/models/api_response.dart';

import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/complet_opportunity_dto.dart';
import '../models/index.dart';
 import 'package:injectable/injectable.dart';

import '../models/review_shiftsprams.dart';

 @injectable
class ReviewOpportunitiesApi {
  final AdminEndpoint api;

  ReviewOpportunitiesApi({required this.api});

  Future<ApiResponse<List<CompletedOpportunityDto>>>
      fetchPendingConfirmationOpportunities() {
    return api.fetchPendingConfirmationOpportunities();
  }

  Future<ApiResponse<List<CompletedOpportunityDto>>>
      fetchCompletedOpportunitiesByType(int statusId) {
    return api.fetchCompletedOpportunitiesByType(statusId);
  }

  Future<ApiResponse<List<JobEvaluationsDto>>> fetchGetJobEvaluations(
      int freeLanceApplyOpportunityId) {
    return api.fetchGetJobEvaluations(freeLanceApplyOpportunityId);
  }

  Future<ApiResponse<BanTypes>> fetchBlockTypes() {
    return api.fetchBlockTypes();
  }

  Future<ApiResponse<int>> confirmShiftPaymentRequest(
   ConfirmShiftPaymentRequest params) {
    return api.confirmShiftPaymentRequest(params);
  }

  Future<ApiResponse<CompletOpportunityDto>>
  fetchReviewOpportunitiesByType( ReviewShiftsprams reviewShiftsprams){
    return api.fetchReviewOpportunitiesByType(reviewShiftsprams);
  }

 }
