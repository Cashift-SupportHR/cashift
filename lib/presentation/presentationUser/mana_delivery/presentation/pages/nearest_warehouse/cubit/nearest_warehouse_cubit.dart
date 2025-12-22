import 'package:injectable/injectable.dart';
import 'package:shiftapp/presentation/presentationUser/mana_delivery/data/models/delivery_orders_prams.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/models/confirm_reservation_warning_prams.dart';
import '../../../../data/repositories/mana_delivery_repo.dart';
import 'nearest_warehouse_state.dart';



@injectable
class NearestWarehouseCubit extends BaseCubit {
  final ManaDeliverRepository _repository;


  NearestWarehouseCubit(
      this._repository);


  void loadInitialData(DeliveryOrdersPrams prams) async {
    emit(LoadingState());
    try {
      final penaltyWarningEntity = await _repository.fetchPenaltyWarnings();
      final nearbyWarehousesEntity = await _repository.fetchNearbyWarehouses(prams);
      emit(NearestWarehouseState(penaltyWarningEntity:penaltyWarningEntity, nearbyWarehousesEntity: nearbyWarehousesEntity));
    } catch (e) {
      print('ErrorState   ${e}');
      emit(ErrorState(e));
    }
  }

  confirmReservation(ConfirmReservationWarningPrams params){
    executeEmitterListener(() => _repository.confirmReservation(params),);
  }
  cancelReservation(int orderId){
    executeEmitterListener(() => _repository.cancelReservation(orderId),);
  }

}
