import 'package:shiftapp/common/domain/entities/wallet/withdraw_method.dart';

import '../../../../../common/domain/entities/wallet/current_balance.dart';
import '../../../common/common_state.dart';


class InitializeWalletState extends CommonStateFBuilder {
  final List<WithdrawMethod> withdrawMethods;
  final CurrentBalance walletBalance;

  InitializeWalletState(
      {required this.withdrawMethods, required this.walletBalance});
}
