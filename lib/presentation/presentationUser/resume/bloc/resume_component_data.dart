

import '../../../../common/domain/entities/resume/index.dart';
import '../../common/common_state.dart';
class ResumeComponentData{
  final List<LevelItem> levels ;
  final List<CityItem> cities ;
   final StreamState<List<DistrictItem>> districts ;
  final Resume resume ;
  final List<LevelItem> qualifications ;
  final List<LevelItem> situations;
  final List<String> qualificationNames;
  final List<FavoriteTime> favoriteTimes;

  ResumeComponentData(
      {required this.levels,
        required this.cities,
        required this.districts,
        required  this.resume,
        required  this.qualifications,
        required this.situations,required this.qualificationNames,
        required this.favoriteTimes,
      });


  List<int> favJobs(){
    return resume.jobs!.map((e) => e.id!).toList();
}

  int currentSituation(){
    return situations.indexWhere((element) => element.id==resume.currentSituation);
  }
}