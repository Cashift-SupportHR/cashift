import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/presentation/presentationUser/mana_delivery/data/models/delivery_orders_prams.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../common/common_state.dart';
import '../../../../../locationservice/location_required_exception.dart';
import '../../../../../locationservice/location_service_disabled_exception.dart';
import '../../../../../locationservice/locationservice.dart';
import '../../../../../locationservice/permission_denied_exception.dart';
import '../../../../data/models/confirm_reservation_warning_prams.dart';
import '../../../../data/repositories/mana_delivery_repo.dart';
import 'nearest_warehouse_state.dart';

@injectable
class NearestWarehouseCubit extends BaseCubit {
  final ManaDeliverRepository _repository;

  NearestWarehouseCubit(this._repository);

  void loadInitialData(DeliveryOrdersPrams prams) async {
    emit(LoadingState());
    try {
      final penaltyWarningEntity = await _repository.fetchPenaltyWarnings();
      final nearbyWarehousesEntity = await _repository.fetchNearbyWarehouses(
        prams,
      );
      emit(
        NearestWarehouseState(
          penaltyWarningEntity: penaltyWarningEntity,
          nearbyWarehousesEntity: nearbyWarehousesEntity,
        ),
      );
    } catch (e) {
      print('ErrorState   ${e}');
      emit(ErrorState(e));
    }
  }

  Future<void> fetchDeliveryOrdersWithLocation() async {
    try {
      print('_fetchDeliveryOrdersWithLocation: starting');
      // First, just check if permission is already granted (no dialog)
      final isGranted = await LocationService.isPermissionGranted();
      print('_fetchDeliveryOrdersWithLocation: isGranted=$isGranted');

      if (!isGranted) {
        // Permission not granted - set error to show the location widget
        // Don't request permission automatically - user will tap retry button
        print(
          '_fetchDeliveryOrdersWithLocation: permission not granted, showing widget',
        );
        emit(ErrorState(LocationRequiredException()));

        return;
      }

      // Permission is granted, get location
      final position = await LocationService.determinePosition(Get.context!);
      loadInitialData(
        DeliveryOrdersPrams(lat: position.latitude, lng: position.longitude),
      );
    } catch (e) {
      print(
        '_fetchDeliveryOrdersWithLocation: caught error: $e (${e.runtimeType})',
      );
      if (e is LocationPermissionDeniedException ||
          e is geolocator.LocationServiceDisabledException ||
          e is AppLocationServiceDisabledException) {
        emit(ErrorState(LocationRequiredException()));
      } else {
        emit(ErrorState(e));
      }
    }
  }

  confirmReservation(ConfirmReservationWarningPrams params) {
    executeEmitterListener(() => _repository.confirmReservation(params));
  }

  cancelReservation(int orderId) {
    executeEmitterListener(() => _repository.cancelReservation(orderId));
  }
}
