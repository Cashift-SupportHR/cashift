import 'dart:async';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:built_value/built_value.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/common/data/datasources/local/constants.dart';
import 'package:shiftapp/common/data/datasources/remote/api/resume/resume_api_provider.dart';
import 'package:shiftapp/common/data/models/resuame/index.dart';
 import 'package:shiftapp/common/domain/entities/resume/index.dart';


@Injectable()
class ResumeRepository {
  final SharedPreferences? preferences;
  final key = LocalConstants.RESUME_KEY;

  final ResumeAPI api;

  ResumeRepository(this.api ,this.preferences);




  _saveResume(Resume resume) {
    final json = jsonEncode(resume.toJson());
    preferences!.setString(key, json);
  }

  Future<List<LevelItem>> fetchAllLevels() async {
    final response = await api.fetchLevels();
    return response.payload!;
  }

  Future<List<LevelItem>> getAllCurrentSituation() async {
    final response = await api.getAllCurrentSituation();
    return response.payload!;
  }

  Future<List<LevelItem>> getAllEducationalQualification() async {
    final response = await api.getAllEducationalQualification();
    return response.payload!;
  }
  Future<List<String>> getAllQualificationName() async {
    final response = await api.getAllQualificationName();
    return response.payload!;
  }

  Future<List<CityItem>> fetchAllCities() async {
    final response = await api.fetchAllCities();
    return response.payload!;
  }

  Future<List<DistrictItem>> fetchDistricts(int cityId) async {
    final response = await api.fetchDistricts(cityId);
    return response.payload!;
  }

  Future<List<JobItem>> fetchJobs(bool gender) async {
    final response = await api.fetchJobs(gender);
    return response.payload!;
  }

  Future<List<FavoriteTime>> fetchFavouriteTimeWork() async {
    final response = await api.fetchFavouriteTimeWork();
    return response.payload!;
  }

  Future<List<JobSkills>> fetchJobSkills(int jobId) async {
    final response = await api.fetchJobSkills(jobId);
    return response.payload!;
  }


  Future<String> updateResume(UpdateResumeParams updateResumeParams) async {
    print('updateResumeParamsss: ${updateResumeParams.toJson()}');
    final response = await api.updateResume(updateResumeParams);
    return response.message!;
  }
  Future<Resume> fetchResume() async {
    final response = await api.fetchResume();
    if(response.payload!=null) {
      _saveResume(response.payload!);
    }
    return response.payload!;
  }


  @nullable
  Future<Resume> getResumeFromLocal() async {
    final userJson = preferences!.getString(key);
    if (userJson != null) {
      final user = Resume.fromJson(jsonDecode(userJson));

      return user;
    } else {
      final resum= await fetchResume();
      return resum;
    }
  }
}
