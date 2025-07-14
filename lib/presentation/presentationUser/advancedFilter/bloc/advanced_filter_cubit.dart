import 'dart:convert';
import 'dart:io';
import 'package:shiftapp/common/data/models/advancedFilter/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/domain/entities/advancedFilter/index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import '../../../../../common/data/repositories/advancedFilter/advanced_filter_repository.dart';
import '../../../../common/data/datasources/remote/api_exception.dart';

@injectable
class AdvancedFilterCubit extends BaseCubit {
  final AdvancedFilterRepository repository;
  final SharedPreferences sharedPreferences;

  AdvancedFilterCubit(this.repository, this.sharedPreferences);
  StreamState<List<ProjectFiltter>> projectsStream = StreamStateInitial();

  Future<void> fetchJobsCompanyByOpp() async {
    try {
      emit(LoadingState());
      final result = await repository.fetchJobsCompanyByOpp();
      final cites = await repository.fetchAllCities();

      final filterData = getAdvancedFilterData();
      final data = OffersFilterData.fromDto(result);
      emit(InitializedAdvancedFilter(jobsCompanyByOp: data, cities: cites, advancedFilterData: filterData));
    } catch (e) {
      emit(ErrorState(e));
      rethrow;
    }
  }

  fetchProject({required int cityId, required int companyId}) async {
    try {
      final projects = await repository.fetchAllProjects(companyId: companyId, cityId: cityId);
      List<ProjectFiltter> data = projects.map((e) => ProjectFiltter.fromDto(e)).toList();
      projectsStream.setData(data);
      emit(SuccessState("success"));
    } catch (e) {
      projectsStream.setError(e);
      print(e);
      print("jhddvjk");
      checkErrorType(e);
    }
  }

  // save advanced filter data
  void saveAdvancedFilterData(SearchOpportunitiesAvailableParams filterData) {
    String filterDataEncoded = json.encode(filterData.toJson());
    print('filterDataEncoded: $filterDataEncoded');
    sharedPreferences.setString('advancedFilterData', filterDataEncoded);
  }

  // get advanced filter data
  SearchOpportunitiesAvailableParams getAdvancedFilterData() {
    String filterDataEncoded = sharedPreferences.getString('advancedFilterData') ?? '';
    print('saveFilterDataEncoded: $filterDataEncoded');

    if (filterDataEncoded.isNotEmpty) {
      final resalt = SearchOpportunitiesAvailableParams.fromJson(json.decode(filterDataEncoded));
      if (resalt.cityId != null && resalt.companyId != null && resalt.cityId != 0 && resalt.companyId != 0) {
         fetchProject(cityId: resalt.cityId!, companyId: resalt.companyId!);
         return resalt;
      } else {
        return resalt;
      }
    }

    return SearchOpportunitiesAvailableParams();
  }

  // clear advanced filter data
  void clearAdvancedFilterData() {
    sharedPreferences.remove('advancedFilterData');
  }

  fetchJobsCompanyByOppWithFilter(SearchOpportunitiesAvailableParams params) async {
    try {
      emit(LoadingStateListener());
      final result = await repository.fetchJobsCompanyByOppWithFilter(params);

      emit(SuccessStateListener<List<JobOfferDto>>(data: result));
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  checkErrorType(e) {
    if (e is DioError) {
      print('checkErrorType is time error ${e.type == DioExceptionType.connectionTimeout} ');
      if (e.error is SocketException ||
          e.error is WebSocketException ||
          e.error is HandshakeException ||
          e.type == DioExceptionType.connectionTimeout ||
          e.error is HttpException ||
          (e.error is! ApiException)) {
        throw e;
      }
    }
    print('checkErrorType is DIO ${e is DioError}');
  }
}
