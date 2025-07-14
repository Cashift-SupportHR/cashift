import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/workerWorkPlaces/worker_work_places_repository.dart';
import 'package:shiftapp/common/domain/entities/workerWorkPlaces/index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/data/models/workerWorkPlaces/index.dart';


@Injectable()
class DeliveryAndReceiptCubit extends BaseCubit {
  final WorkerWorkPlacesRepository repository;

  DeliveryAndReceiptCubit(this.repository);

  Future<void> loadInitialData(int focusPointId) async {
    emit(LoadingState());
    try {
      DeviceByFocusPoint deviceByFocusPoint =
          await fetchDevicesByFocusPoint(focusPointId);
      DeviceSettingFocusPoint deviceSettingFocusPoint =
          await fetchDevicesSettingFocusPoint();
      emit(InitializedDeliveryAndReceipt(
          deviceByFocusPoint: deviceByFocusPoint,
          deviceSettingFocusPoint: deviceSettingFocusPoint));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
  }

  Future<DeviceByFocusPoint> fetchDevicesByFocusPoint(int focusPointId) async {
    final result = await repository.fetchDevicesByFocusPoint(focusPointId);
    DeviceByFocusPoint data = DeviceByFocusPoint.fromDto(result);
    return data;
  }

  Future<DeviceSettingFocusPoint> fetchDevicesSettingFocusPoint() async {
    final result = await repository.fetchDevicesSettingFocusPoint();
    DeviceSettingFocusPoint data = DeviceSettingFocusPoint.fromDto(result);
    return data;
  }

  Future<void> addFocusPointsReceivedDevices(
      List<AddFocusPointsReceivedDevicesParams> params) async {
    emit(LoadingStateListener());
    try {
      final result = await repository.addFocusPointsReceivedDevices(params);
      emit(SuccessStateListener(data: result));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
