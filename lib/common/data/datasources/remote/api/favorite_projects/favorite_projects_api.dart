
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/data/models/projects/index.dart';

import '../../../../../network/source/user_endpoint.dart';

@Injectable()
class FavoriteProjectsApi {
  final UserEndpoint api;
  FavoriteProjectsApi(this.api);

  Future<ApiResponse<List<FavoriteProject>>> fetchFavoriteProjects() async {
    return await api.fetchFavoriteProjects();
  }

  Future<ApiResponse<List<ProjectDto>>> fetchProjects() async {
    return await api.fetchProjects();
  }

  Future<ApiResponse<bool>> addFavoriteProjects(@Body() List<int> favorites) async {
    return await api.addFavoriteProjects(favorites);
  }

}