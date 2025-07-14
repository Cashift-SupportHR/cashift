import 'package:flutter/src/widgets/framework.dart';
import 'package:shiftapp/common/domain/entities/wallet/withdraw_methods.dart';
import 'package:shiftapp/common/domain/entities/wallet/withdraw_method.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../bloc/wallet_bloc.dart';
import 'withdraw_method_widget.dart';

class WithDrawMethodsWidgetBuilder extends BaseBlocWidget<Initialized<List<WithdrawMethod>> , WalletCubit>{
  final Function(WithDrawMethodEnum method) onSubmit;

  WithDrawMethodsWidgetBuilder({required this.onSubmit});

  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.loadWithdrawMethods();
  }
  @override
  Widget buildWidget(BuildContext context, Initialized<List<WithdrawMethod>> state) {
    return WithDrawMethodWidget(onSubmit: onSubmit, withDrawMethods: state.data,);
  }

  @override
  Widget build(BuildContext context) {
    return buildConsumer(context);
  }
}