import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/models/workerWorkPlaces/index.dart';
import 'package:shiftapp/common/domain/entities/workerWorkPlaces/index.dart';

import '../../../../../../common/data/models/wallet/name_by_id_number.dart';
 import '../../../../../../common/data/repositories/workerWorkPlaces/worker_work_places_repository.dart';
 import '../../../../../presentationUser/common/common_state.dart';
import '../../../data/models/add_covenant_focus_point_params.dart';
import '../../../data/repositories/focus_points_repository.dart';
import '../../../domain/entities/covenant.dart';
import '../pages/covenant_received/custody_initialize_state.dart';

@injectable
class CovenantReceivedCubit extends BaseCubit {
  final FocusPointsRepository repository;
  final WorkerWorkPlacesRepository custodyRepo;
  CovenantReceivedCubit(this.repository, this.custodyRepo);

  final nameByIdNumberStream = StreamStateInitial<NameByIdNumber?>();
  //
  addFocusPointCovenant(List<AddCovenantFocusPointParams> params) async {
    emit(LoadingStateListener());
    try {
      final message = await repository.addFocusPointCovenant(params);
      fetchCovenantTypes(focusPointId: params.first.focusPointId);
      emit(SuccessStateListener(data: message));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  editFocusPointCovenant(AddCovenantFocusPointParams params) async {
    try {
      emit(LoadingStateListener());
      final message = await repository.editFocusPointCovenant(params);
      fetchCovenantTypes(focusPointId: params.focusPointId);
      emit(SuccessStateListener(data: message));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  deleteFocusPointCovenant(AddCovenantFocusPointParams params) async {
    try {
      emit(LoadingStateListener());
      final message = await repository.deleteFocusPointCovenant(params.id!);
      emit(SuccessStateListener(data: message));
      print('deleteFocusPointCovenant');
      fetchCovenantTypes(focusPointId: params.focusPointId!);
    } catch (e) {
      print('deleteFocusPointCovenant err $e');

      emit(FailureStateListener(e));
    }
  }

  fetchCovenantTypes({int? focusPointId}) async {
    emit(LoadingState());
    try {
      final response = await repository.fetchCovenantTypes();
      List<Covenant> covenants =
          response.map((e) => Covenant.fromJson(e)).toList();

      if (focusPointId != null) {
        final custody = await fetchDevicesByFocusPoint(focusPointId);
        emit(CustodyInitializeState(
            custodyTypes: covenants,
            custody: custody
                .map((e) => custodyMapToEditableCustodyParams(e))
                .toList(),
            isNew: false));
      } else {
        emit(CustodyInitializeState(
          custodyTypes: covenants,
        ));
      }
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  AddCovenantFocusPointParams custodyMapToEditableCustodyParams(
      ListDevice device) {
    return AddCovenantFocusPointParams(
        name: device.deviceName,
        deviceId: device.deviceId ?? 0,
        id: device.id,
        deviceNumber: device.deviceNumber,
        deviceTypeName: device.typeDevice);
  }

  Future<List<ListDevice>> fetchDevicesByFocusPoint(int focusPointId) async {
    try {
      final result = await custodyRepo.fetchDevicesByFocusPoint(focusPointId);
      DeviceByFocusPoint data = DeviceByFocusPoint.fromDto(result);
      return data.listDevices ?? [];
    } catch (e) {}
    return [];
  }
}
