import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/advancedFilter/index.dart';

import '../../../../common/domain/entities/resume/city_item.dart';
import '../../../../common/domain/entities/job_offers/job_offer_dto.dart';
import '../../datasources/remote/api/advancedFilter/advanced_filter_api_provider.dart';

@injectable
class AdvancedFilterRepository {
  final AdvancedFilterAPI _api;

  AdvancedFilterRepository(this._api);

  Future<OffersFilterDataDto> fetchJobsCompanyByOpp() async {
    final projects = await _api.fetchJobsCompanyByOpp();
    return projects.payload!;
  }

  Future<List<CityItem>> fetchAllCities() async {
    final response = await _api.fetchAllCities();
    return response.payload!;
  }

  Future<List<ProjectFiltterDto>> fetchAllProjects({required int cityId, required int companyId}) async {
    final response = await _api.fetchAllProjects(companyId, cityId);
    return response.payload!;
  }

  Future<List<JobOfferDto>> fetchJobsCompanyByOppWithFilter(SearchOpportunitiesAvailableParams params) async {
    final projects = await _api.fetchJobsCompanyByOppWithFilter(params);
    return projects.payload!;
  }
}
