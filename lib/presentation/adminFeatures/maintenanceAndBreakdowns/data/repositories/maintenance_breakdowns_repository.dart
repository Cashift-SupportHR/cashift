import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../shared/models/common_list_item.dart';
import '../../domain/entities/maintenance.dart';
import '../data_sources/maintenance_breakdowns_provider.dart';
import '../models/action_follow_up_up_maintenance_prams.dart';
import '../models/add_maintenance_prams.dart';
import '../models/final_action_follow_up_maintenance_prams.dart';

@injectable
class MaintenanceBreakdownsRepository {
  final MaintenanceBreakdownsAPI _api;

  MaintenanceBreakdownsRepository(this._api);

  Future<List<Maintenance>> fetchMaintenanceBreakdowns(int status) async {
    final response = await _api.fetchMaintenanceBreakdowns(status);
    return Maintenance.fromDtoList(response.payload!);
  }

  Future<List<CommonListItem>> fetchTapsMaintenanceBreakdowns() async {
    final response = await _api.fetchTapsMaintenanceBreakdowns();
    return response.payload?.map((e) => CommonListItem.fromDto(e)).toList() ??
        [];
  }

  Future<List<CommonListItem>> fetchMaintenanceImportantLevel() async {
    final response = await _api.fetchMaintenanceImportantLevel();
    return response.payload?.map((e) => CommonListItem.fromDto(e)).toList() ??
        [];
  }

  Future<ApiResponse> actionFollowUpUpMaintenance(
      ActionFollowUpUpMaintenancePrams params) async {
    return await _api.actionFollowUpUpMaintenance(params);
  }

  Future<ApiResponse> finalActionFollowUpMaintenance(
      FinalActionFollowUpMaintenancePrams params) async {
    return await _api.finalActionFollowUpMaintenance(params);
  }

  Future<List<CommonListItem>> fetchTypeMaintenance() async {
    final response = await _api.fetchTypeMaintenance();
    return response.payload?.map((e) => CommonListItem.fromDto(e)).toList() ??
        [];
  }

  Future<ApiResponse> addMaintenance(
    AddMaintenancePrams params,
    List<File> imagesAfter,
    List<File> imagesBefore,
  ) async {
    return await _api.addMaintenance(params, imagesAfter, imagesBefore);
  }
}
