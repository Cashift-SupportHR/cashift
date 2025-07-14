 import 'package:injectable/injectable.dart';

import '../../../../../network/source/user_endpoint.dart';
import '../../../../models/activity_log/index.dart';
import '../../../../models/api_response.dart';

@Injectable()
class ActivityLogAPI {
  final UserEndpoint api;

  ActivityLogAPI(this.api);

  Future<ApiResponse<List<NotificationItem>>> fetchActivityLog(int statusId) async {
    return await api.fetchActivityLog(statusId);
  }

  Future<ApiResponse<String>> confirmActivity(ConfirmActivityParams params) async {
    return await api.confirmActivity(params);
  }
}
