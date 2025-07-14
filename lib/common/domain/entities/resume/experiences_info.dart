import 'package:shiftapp/common/domain/entities/resume/job_item.dart';

class FavoriteJobsInfo {
  final List<JobItem> jobs ;
  final List<int> favoriteJobs ;

  FavoriteJobsInfo({required this.jobs,this.favoriteJobs=const [] });

  List<JobItem>  getJobs(){
    return jobs ;
  }
  List<int> getSelectedJobsIndexes() {
    final selectedJobs = <int>[];
    for (var favJobId in favoriteJobs) {
      print('getSelectedJobsIndexes ${favJobId} ${jobs} => ${jobs.indexWhere((element) => element.id==favJobId)}');
      if(jobs.indexWhere((element) => element.id==favJobId)>-1) {
        selectedJobs.add(jobs.indexWhere((element) => element.id == favJobId));
      }
    }
    return selectedJobs;
  }
}