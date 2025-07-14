import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/user_endpoint.dart';
import '../../../../shared/models/common_list_item_dto.dart';
import '../models/index.dart';

@Injectable()
class WorkHazardsAPI {
  final UserEndpoint api;

  WorkHazardsAPI(this.api);

  Future<ApiResponse<List<WorkHazardDto>>> fetchWorkHazards() async {
    return await api.fetchWorkHazards();
  }

  Future<ApiResponse<WorkHazardDto>> fetchWorkHazardDetails(int id) async{
    return await api.fetchWorkHazardDetails(id);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchWorkHazardsTypes() async{
    return await api.fetchWorkHazardsTypes();
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchHazardPriorityLevels() async{
    return await api.fetchHazardPriorityLevels();
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchHazardTypeInstructionsByTypeId(int typeId) async{
    return await api.fetchHazardTypeInstructionsByTypeId(typeId);
  }

  Future<ApiResponse<WorkHazardDto>> addWorkHazard(AddWorkHazardParams params) async{
    return await api.addWorkHazard(params);
  }

  Future<ApiResponse> uploadWorkHazardFiles(int? id, List<File> files) async{
    return await api.uploadWorkHazardFiles(id, files);
  }

}
