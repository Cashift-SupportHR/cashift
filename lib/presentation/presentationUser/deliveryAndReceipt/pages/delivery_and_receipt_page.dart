import 'package:flutter/material.dart';

import '../../../../common/components/base/base_widget_bloc.dart';
import '../../common/common_state.dart';
import '../bloc/delivery_and_receipt_cubit.dart';
import 'delivery_and_receipt_screen.dart';


class DeliveryAndReceiptPage extends BaseBlocWidget<
    InitializedDeliveryAndReceipt, DeliveryAndReceiptCubit> {
   DeliveryAndReceiptPage({Key? key})
      : super(key: key);


  @override
  void onSuccessDismissed() {
    Navigator.pop(context);
  }
  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(context) {
    int? id = getArguments(context);
    bloc.loadInitialData(id ?? 0);
  }

  @override
  Widget buildWidget(
      BuildContext context, InitializedDeliveryAndReceipt state) {
    int? id = getArguments(context);
    return DeliveryAndReceiptScreen(
      id: id ?? 0,
      deviceByFocusPoint: state.deviceByFocusPoint,
      deviceSettingFocusPoint: state.deviceSettingFocusPoint,
      onAddNotes: (params) {
        bloc.addFocusPointsReceivedDevices(params);
      },
    );
  }

  @override
  String? title(context)=> strings.communication_device;
}
