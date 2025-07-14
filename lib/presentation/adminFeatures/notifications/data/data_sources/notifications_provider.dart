import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';

import 'package:injectable/injectable.dart';

import '../../../../shared/models/common_list_item_dto.dart';
import '../models/action_notifications_prams.dart';
import '../models/vehicle_notifications_dto.dart';

@injectable
class NotificationsAPI {
  final AdminEndpoint api;

  NotificationsAPI({required this.api});

  Future<ApiResponse<List<CommonListItemDto>>>
      fetchTapsMaintenanceBreakdowns() {
    return api.fetchTapsMaintenanceBreakdowns();
  }

  Future<ApiResponse<List<VehicleNotificationsDto>>> fetchVehicleNotifications(
      int status) {
    return api.fetchVehicleNotifications(status);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchTypeVehicleNotifications() {
    return api.fetchTypeVehicleNotifications();
  }

  Future<ApiResponse> actionNotifications(ActionNotificationsPrams params) {
    return api.actionNotifications(params);
  }

  Future<ApiResponse> finalActionNotifications(
      ActionNotificationsPrams params) {
    return api.finalActionNotifications(params);
  }
}
