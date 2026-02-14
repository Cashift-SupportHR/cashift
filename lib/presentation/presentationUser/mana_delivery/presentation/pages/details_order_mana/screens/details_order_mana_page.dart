import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../domain/entities/delivery_orde.dart';
import '../../../../domain/entities/order_mana.dart';
import '../cubit/details_order_mana_cubit.dart';
import '../cubit/details_order_mana_state.dart';
import 'details_order_mana_screen.dart';

class DetailsOrderManaPage
    extends BaseBlocWidget<DetailsOrderManaState, DetailsOrderManaCubit> {
  Function(OrderManaEntity) onNext;

  DeliveryOrderEntity Function() callDeliveryOrder;
  DetailsOrderManaPage({
    Key? key,
    required this.onNext,
    required this.callDeliveryOrder,
  }) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    DeliveryOrderEntity data = callDeliveryOrder();
    bloc.loadInitialData(data.id ?? 0);
  }

  OrderManaEntity? orderManaEntity;
  @override
  Widget buildWidget(BuildContext context, DetailsOrderManaState state) {
    return DetailsOrderManaScreen(
      deliveryOrderEntity: callDeliveryOrder(),
      state: state,
      onNext: (params) {
        orderManaEntity = state.orderManaEntity;
        bloc.acceptTerms(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    onNext(orderManaEntity!);
  }
}
