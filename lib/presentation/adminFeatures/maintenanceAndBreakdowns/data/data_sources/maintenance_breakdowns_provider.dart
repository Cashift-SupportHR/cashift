import 'dart:io';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';

import 'package:injectable/injectable.dart';

import '../../../../shared/models/common_list_item_dto.dart';
import '../models/action_follow_up_up_maintenance_prams.dart';
import '../models/add_maintenance_dto.dart';
import '../models/add_maintenance_prams.dart';
import '../models/final_action_follow_up_maintenance_prams.dart';
import '../models/maintenance_dto.dart';

@injectable
class MaintenanceBreakdownsAPI {
  final AdminEndpoint api;

  MaintenanceBreakdownsAPI({required this.api});

  Future<ApiResponse<List<CommonListItemDto>>>
      fetchTapsMaintenanceBreakdowns() {
    return api.fetchTapsMaintenanceBreakdowns();
  }

  Future<ApiResponse<List<MaintenanceDto>>> fetchMaintenanceBreakdowns(
      int status) {
    return api.fetchMaintenanceBreakdowns(status);
  }

  Future<ApiResponse<List<CommonListItemDto>>>
      fetchMaintenanceImportantLevel() {
    return api.fetchMaintenanceImportantLevel();
  }

  Future<ApiResponse> actionFollowUpUpMaintenance(
      ActionFollowUpUpMaintenancePrams params) {
    return api.actionFollowUpUpMaintenance(params);
  }

  Future<ApiResponse> finalActionFollowUpMaintenance(
      FinalActionFollowUpMaintenancePrams params) {
    return api.finalActionFollowUpMaintenance(params);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchTypeMaintenance() {
    return api.fetchTypeMaintenance();
  }

  Future<ApiResponse<AddMaintenanceDto>> addMaintenance(
    AddMaintenancePrams params,
    List<File> imagesAfter,
    List<File> imagesBefore,
  ) {
    return api.addMaintenance(params, imagesAfter, imagesBefore);
  }
}
