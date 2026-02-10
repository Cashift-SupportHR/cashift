import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../../../core/services/routes.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/models/delivery_orders_prams.dart';
import '../../../../domain/entities/nearby_warehouses.dart';
import '../../../intent/mana_delevery_intents.dart';
import '../cubit/nearest_warehouse_cubit.dart';
import '../cubit/nearest_warehouse_state.dart';
import 'nearest_warehouse_screen.dart';

class NearestWarehousePage
    extends BaseBlocWidget<NearestWarehouseState, NearestWarehouseCubit> {
  final Function(NearbyWarehousesEntity) onNext;
  int Function() onCallIdOrder;
  NearestWarehousePage({
    Key? key,
    required this.onCallIdOrder,
    required this.onNext,
  }) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    // lat=24.7136&lng=46.6753
    bloc.fetchDeliveryOrdersWithLocation();
  }

  NearbyWarehousesEntity? nearbyWarehousesEntity;
  @override
  Widget buildWidget(BuildContext context, NearestWarehouseState state) {
    return NearestWarehouseScreen(
      intentCallBack: (intent) {
        if (intent is SubmitReservation) {
          bloc.confirmReservation(intent.confirmReservationWarningPrams);
        } else if (intent is CancelReservation) {
          bloc.cancelReservation(intent.orderId);
        }
      },
      orderId: onCallIdOrder(),
      state: state,
      onNext: (data) {
        nearbyWarehousesEntity = data;
      },
    );
  }

  @override
  void onRequestSuccess(String? message) {
   Navigator.pop(context);
    if (message == "onCancel") {
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {

      onNext(nearbyWarehousesEntity!);
    }
  }
}
