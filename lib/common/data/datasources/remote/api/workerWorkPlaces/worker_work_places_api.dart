
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/workerWorkPlaces/index.dart';

import '../../../../../network/source/user_endpoint.dart';
import '../../../../models/api_response.dart';

@Injectable()
class WorkerWorkPlacesAPI {
  final UserEndpoint api;

  WorkerWorkPlacesAPI(this.api);

  Future<ApiResponse<FocusPointInfoDto>> fetchFocusPointFreeLanceInfo() async {
    return await api.fetchFocusPointFreeLanceInfo();
  }

  Future<ApiResponse<List<WorkerWorkPlaceDto>>> fetchFocusPointsGates() async {
    return await api.fetchFocusPointsGates();
  }

  Future<ApiResponse<String>> startAttendanceFocusPoint(
      StartAttendanceFocusPointParams params) async {
    return await api.startAttendanceFocusPoint(params);
  }

  Future<ApiResponse<String>> endAttendanceFocusPoint(
      StartAttendanceFocusPointParams params) async {
    return await api.endAttendanceFocusPoint(params);
  }

  Future<ApiResponse<DeviceByFocusPointDto>> fetchDevicesByFocusPoint(
      int focusPointId) async {
    return await api.fetchDevicesByFocusPoint(focusPointId);
  }

  Future<ApiResponse<DeviceSettingFocusPointDto>>
      fetchDevicesSettingFocusPoint() async {
    return await api.fetchDevicesSettingFocusPoint();
  }

  Future<ApiResponse<String>> addFocusPointsReceivedDevices(
      List<AddFocusPointsReceivedDevicesParams> params) async {
    return await api.addFocusPointsReceivedDevices(params);
  }
}
