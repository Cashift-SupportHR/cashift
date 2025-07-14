import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/core/resources/data_state.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/common/stream_data_state.dart';

import '../../../../../common/data/exceptions/empty_list_exception.dart';
import '../../data/models/complet_opportunity_dto.dart';
import '../../data/models/index.dart';
import '../../data/models/review_shiftsprams.dart';

@injectable
class ReviewOpportunitiesCubit extends BaseCubit {
  final ReviewOpportunitiesRepository _repository;
  ReviewOpportunitiesCubit(this._repository);

  fetchPendingConfirmationOpportunities() async {
    try {
      emit(LoadingState());
      final response =
          await _repository.fetchPendingConfirmationOpportunities();
      emit(Initialized<List<CompletedOpportunityDto>>(data: response));
    } catch (e) {
      debugPrint('fetchPendingConfirmationOpportunities ERROR ${e}');
      emit(ErrorState(e));
    }
  }

  fetchCompletedOpportunities(int status) async {
    try {
      emit(LoadingState());
      final response = await _repository.fetchCompletedOpportunitiesByType(
        status,
      );
      emit(Initialized<List<CompletedOpportunityDto>>(data: response));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  int _page = 0;
  List<CompletedOpportunityData> opportunityes = [];
  List<CompletedOpportunityData> allOpportunity = [];
  // ReviewShiftsprams params = ReviewShiftsprams(
  //   pageNumber: 1,
  //   statusId: 0,
  //   pageSize: 10,
  // );

  StreamStateInitial<List<CompletedOpportunityData>?> opportunityStream =
      StreamStateInitial();
  //
  // Future<void> fetchOpportunityDataPagination({
  //   bool isRefresh = false,
  //   required ReviewShiftsprams params,
  // }) async {
  //   // opportunityes = [];
  //   try {
  //     if (isRefresh) {
  //       opportunityStream.setData(null);
  //       _page = 1;
  //       allOpportunity = [];
  //       params.pageNumber = _page;
  //     } else {
  //       _page++;
  //       params.pageNumber = _page;
  //     }
  //
  //     opportunityes = await fetchOpportunityData(params);
  //     allOpportunity.addAll(opportunityes);
  //     opportunityStream.setData(allOpportunity);
  //
  //    } catch (e) {
  //     print(e);
  //
  //     opportunityStream.setError(e);
  //     emit(ErrorState(e));
  //   }
  // }


  int page = 0;
  bool isLastPage = false;
  RefreshController refreshController = RefreshController();

  fetchOpportunityDataPagination({bool isRefresh = true, required ReviewShiftsprams params,}) async {
    isRefresh ? {page = 1, allOpportunity.clear()} : page++;
    executeBuilder(
      isRefresh: isRefresh,
          () {
        params.pageNumber = page;
            return
              _repository.fetchReviewOpportunitiesByType (params);
          },
      onSuccess: (dto) {
        isLastPage = (dto.totalPages ?? 1) == page;
        final data = dto.data ?? [];
        isLastPage
            ? refreshController.loadNoData()
            : refreshController.loadComplete();
        allOpportunity.addAll(data);
        if (allOpportunity.isEmpty) throw EmptyListException();
        emit(Initialized<List<CompletedOpportunityData>>(data: allOpportunity));
      },
    );
  }

  Future<List<CompletedOpportunityData>> fetchOpportunityData(
    ReviewShiftsprams params,
  ) async {
    final result = await _repository.fetchReviewOpportunitiesByType(params);
    return result.data ?? [];
  }
}
