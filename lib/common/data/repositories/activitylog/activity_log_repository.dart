import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shiftapp/common/data/models/activity_log/index.dart';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/activity_log/activity_log_api_provider.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
  @Injectable()
class ActivityLogRepository {

  final ActivityLogAPI api;

  ActivityLogRepository(this.api);

  Future<List<NotificationItem>> fetchActivityLog(int statusId) async {
    final response = await api.fetchActivityLog(statusId);
    return response.payload!;
  }


  Future<ApiResponse<String>> confirmActivity(ConfirmActivityParams params) async {
    return await api.confirmActivity(params);
  }


}
