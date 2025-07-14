import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../common/common_state.dart';
import '../../../domain/entities/installment_with_cashift.dart';
import '../bloc/installment_with_cashift_cubit.dart';
import 'installment_with_cashift_screen.dart';



class InstallmentWithCashiftPage extends BaseBlocWidget<
    Initialized<List<InstallmentWithCashift>>, InstallmentWithCashiftCubit> {
   final int id;
  InstallmentWithCashiftPage({Key? key, required this.id})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void loadInitialData(context) {
    bloc.fetchInstallmentWithCashiftData(id);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<InstallmentWithCashift>> state) {
    return InstallmentWithCashiftScreen(
      paymentId: id,
      data: state.data,
      onAddInstallment: (id) {
        bloc.addInstallmentWithCashift(id);
      },
    );
  }

  @override
   onSuccessDismissed() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
