import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../shared/models/common_list_item.dart';
import '../../domain/entities/vehicle_notifications.dart';
import '../data_sources/notifications_provider.dart';
import '../models/action_notifications_prams.dart';

@injectable
class NotificationsRepository {
  final NotificationsAPI _api;

  NotificationsRepository(this._api);

  Future<List<VehicleNotification>> fetchVehicleNotifications(
      int status) async {
    final response = await _api.fetchVehicleNotifications(status);
    return VehicleNotification.fromDtoList(response.payload!);
  }

  Future<List<CommonListItem>> fetchTypeVehicleNotifications() async {
    final response = await _api.fetchTypeVehicleNotifications();
    return response.payload?.map((e) => CommonListItem.fromDto(e)).toList() ??
        [];
  }

  Future<ApiResponse> actionNotifications(
      ActionNotificationsPrams params) async {
    return await _api.actionNotifications(params);
  }

  Future<ApiResponse> finalActionNotifications(
      ActionNotificationsPrams params) async {
    return await _api.finalActionNotifications(params);
  }
}
