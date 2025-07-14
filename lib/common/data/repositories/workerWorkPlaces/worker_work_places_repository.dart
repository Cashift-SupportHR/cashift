import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/workerWorkPlaces/index.dart';
import '../../datasources/remote/api/workerWorkPlaces/worker_work_places_api.dart';


@Injectable()
class WorkerWorkPlacesRepository {

  final WorkerWorkPlacesAPI _api;

  WorkerWorkPlacesRepository(this._api);

  Future<FocusPointInfoDto> fetchFocusPointFreeLanceInfo() async {
    final response = await _api.fetchFocusPointFreeLanceInfo();
    return response.payload!;
  }

  Future<List<WorkerWorkPlaceDto>> fetchFocusPointsGates() async {
    final response = await _api.fetchFocusPointsGates();
    return response.payload!;
  }

  Future<String> startAttendanceFocusPoint(StartAttendanceFocusPointParams params) async {
    final response = await _api.startAttendanceFocusPoint(params);
    return response.message!;
  }

  Future<String> endAttendanceFocusPoint(StartAttendanceFocusPointParams params) async {
    final response = await _api.endAttendanceFocusPoint(params);
    return response.message!;
  }

  Future<DeviceByFocusPointDto> fetchDevicesByFocusPoint(int focusPointId) async {
    final response = await _api.fetchDevicesByFocusPoint(focusPointId);
    return response.payload!;
  }

  Future<DeviceSettingFocusPointDto> fetchDevicesSettingFocusPoint() async {
    final response = await _api.fetchDevicesSettingFocusPoint();
    return response.payload!;
  }

  Future<String> addFocusPointsReceivedDevices(List<AddFocusPointsReceivedDevicesParams> params) async {
    final response = await _api.addFocusPointsReceivedDevices(params);
    return response.message!;
  }
}