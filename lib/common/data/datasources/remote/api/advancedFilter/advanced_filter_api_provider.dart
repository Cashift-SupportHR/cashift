
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/advancedFilter/index.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import '../../../../../domain/entities/resume/city_item.dart';
import '../../../../../network/source/user_endpoint.dart';

@Injectable()
class AdvancedFilterAPI {
  final UserEndpoint api;

  AdvancedFilterAPI(this.api);

  Future<ApiResponse<OffersFilterDataDto>> fetchJobsCompanyByOpp(){
    return api.fetchJobsCompanyByOpp();
  }

  Future<ApiResponse<List<CityItem>>> fetchAllCities(){
    return api.fetchAllCities();
  }

  Future<ApiResponse<List<ProjectFiltterDto>>> fetchAllProjects(
    int companyId,
   int cityId,
  ){
    return api.fetchAllProjects(companyId, cityId);
  }

  Future<ApiResponse<List<JobOfferDto>>> fetchJobsCompanyByOppWithFilter(SearchOpportunitiesAvailableParams params){
    return api.fetchJobsCompanyByOppWithFilter(params);
  }
}
