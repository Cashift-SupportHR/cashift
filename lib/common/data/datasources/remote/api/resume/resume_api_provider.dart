 import 'package:injectable/injectable.dart';
 import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/domain/entities/resume/index.dart';
import '../../../../../network/source/user_endpoint.dart';
 import 'package:shiftapp/common/data/models/resuame/index.dart';

@Injectable()
class ResumeAPI {
  final UserEndpoint api;

  ResumeAPI(this.api);

  Future<ApiResponse<bool>> updateResume(UpdateResumeParams updateResumeParams) async {
    return await api.updateResume(updateResumeParams);
  }

  Future<ApiResponse<Resume>> fetchResume() async {
    return await api.fetchResume();
  }

  Future<ApiResponse<List<LevelItem>>> fetchLevels() async{
    return await api.fetchLevels();
  }

  Future<ApiResponse<List<CityItem>>> fetchAllCities() async{
    return await api.fetchAllCities();
  }


  Future<ApiResponse<List<DistrictItem>>> fetchDistricts(int cityId) async{
    return await api.fetchDistricts(cityId);
  }


  Future<ApiResponse<List<LevelItem>>> getAllEducationalQualification() async{
    return await api.getAllEducationalQualification();
  }

  Future<ApiResponse<List<String>>> getAllQualificationName() async{
    return await api.getAllQualificationName();
  }

  Future<ApiResponse<List<LevelItem>>> getAllCurrentSituation() async{
    return await api.getAllCurrentSituation();
  }

  Future<ApiResponse<List<String>>> fetchQualificationsName() async{
    return await api.fetchQualificationsName();
  }
//api/v1/Jobs/GetJobByGender

  Future<ApiResponse<List<JobItem>>> fetchJobs(bool gender) async {
    return await api.fetchJobs(gender);
  }

  Future<ApiResponse<List<FavoriteTime>>> fetchFavouriteTimeWork() async {
    return await api.fetchFavouriteTimeWork();
  }


  Future<ApiResponse<List<JobSkills>>> fetchJobSkills(int jobId) async {
    return await api.fetchJobSkills(jobId);
  }
}
