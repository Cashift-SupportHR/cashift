import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../common/common_state.dart';

import '../../../../data/models/verify_code_prams.dart';
import '../../../../domain/entities/delivery_orde.dart';
import '../../../../domain/entities/nearby_warehouses.dart';
import '../../../../domain/entities/order_mana.dart';
import '../cubit/go_to_customer_mana_cubit.dart';
import 'go_to_customer_mana_screen.dart';

class GoToCustomerManaPage
    extends BaseBlocWidget<UnInitState, GoToCustomerManaCubit> {
  final Function() onNext;
  OrderManaEntity Function() orderCall;
  DeliveryOrderEntity  Function()   deliveryOrderCall;
  NearbyWarehousesEntity Function() nearbyWarehousesCall;
  GoToCustomerManaPage({
    Key? key,
    required this.orderCall,
    required this.onNext,
    required this.deliveryOrderCall,
    required this.nearbyWarehousesCall,
  }) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return GoToCustomerManaScreen(
      deliveryOrderEntity: deliveryOrderCall(),
      nearbyWarehousesEntity: nearbyWarehousesCall(),
      orderManaEntity: orderCall(),
      onNext:
          (resendNumber) => bloc.verifyDeliveryCode(
            VerifyCodePrams(code: resendNumber, orderId: orderCall().id ?? 0),
          ),
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
  }
}
