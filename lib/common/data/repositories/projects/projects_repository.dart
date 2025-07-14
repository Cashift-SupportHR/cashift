import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/favorite_projects/favorite_projects_api.dart';
 import 'package:shiftapp/common/data/models/projects/index.dart';

 @Injectable()
class ProjectsRepository {

  final FavoriteProjectsApi _api;

  ProjectsRepository(this._api);


  Future<List<ProjectDto>> fetchProjects() async {
    final projects = await _api.fetchProjects();
    return projects.payload!;
  }
  Future<List<FavoriteProject>> fetchFavoriteProjects() async {
    try {
      final projects = await _api.fetchFavoriteProjects();
      return projects.payload!;
    }catch(e){
      return [];
    }

  }

  Future<String> addFavoriteProjects(List<int> projects) async {
    final response = await _api.addFavoriteProjects(projects);
    return response.message!;
  }

}
