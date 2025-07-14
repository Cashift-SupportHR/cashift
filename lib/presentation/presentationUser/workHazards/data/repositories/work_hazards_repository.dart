import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import '../../../../shared/models/common_list_item.dart';
import '../../domain/entities/work_hazard.dart';
import '../models/index.dart';
import '../models/upload_work_hazard_files_params.dart';

@injectable
class WorkHazardsRepository {
  final WorkHazardsAPI _api;

  WorkHazardsRepository(this._api);

  Future<List<WorkHazard>> fetchWorkHazards() async {
    final response = await _api.fetchWorkHazards();
    return WorkHazard.fromListDto(response.payload!);
  }

  Future<WorkHazard> fetchWorkHazardDetails(int id) async {
    final response = await _api.fetchWorkHazardDetails(id);
    return WorkHazard.fromDto(response.payload!);
  }

  Future<List<CommonListItem>> fetchWorkHazardsTypes() async {
    final response = await _api.fetchWorkHazardsTypes();
    return CommonListItem.fromDtoList(response.payload!);
  }

  Future<List<CommonListItem>> fetchHazardPriorityLevels() async {
    final response = await _api.fetchHazardPriorityLevels();
    return CommonListItem.fromDtoList(response.payload!);
  }

  Future<List<CommonListItem>> fetchHazardTypeInstructionsByTypeId(
      int typeId) async {
    final response = await _api.fetchHazardTypeInstructionsByTypeId(typeId);
    return CommonListItem.fromDtoList(response.payload!);
  }

  Future<ApiResponse> addWorkHazard(AddWorkHazardParams params) async {
    final response = await _api.addWorkHazard(params);
    return response;
  }

  Future<ApiResponse> uploadWorkHazardFiles(UploadWorkHazardFilesParams params) async {
    final response = await _api.uploadWorkHazardFiles(params.id, params.files);
    return response;
  }
}
