import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../common/common_state.dart';
import '../bloc/Installment_postponement_cubit.dart';
import 'Installment_postponement_screen.dart';

class InstallmentPostponementPage extends BaseBlocWidget<
    UnInitState, InstallmentPostponementCubit> {
  final int id;
  InstallmentPostponementPage({Key? key, required this.id})
      : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    print('InstallmentPostponementScreen');
    return InstallmentPostponementScreen(
      onAddInstallment: (description) {
        bloc.saveInstallmentPostponement(paymentId: id, description: description);
      },
    );
  }

  @override
  onSuccessDismissed() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
