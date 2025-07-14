import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/wallet/wallet_balance_item.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';

import '../../../../../../common/domain/entities/wallet/balance_transaction_status.dart';
import '../../../../../../common/domain/entities/wallet/cancel_transaction_params.dart';
import '../../withdraw/pages/withdraw_page.dart';
import '../bloc/balances_cubit.dart';
import 'wallet_balances_list_widget.dart';

class BalancesListPage extends BaseBlocWidget<
    Initialized<List<WalletBalanceItem>>, BalancesCubit> {
  final bool completed;
  final Function onUpdate;
  final ScrollController scrollController;

  BalancesListPage({
    Key? key,
    required this.completed,
    required this.scrollController,
    required this.onUpdate,
  }) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.loadBalances(completed
        ? BalanceTransactionStatus.Completed
        : BalanceTransactionStatus.Active);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<WalletBalanceItem>> state) {
    final status = completed
        ? BalanceTransactionStatus.Completed
        : BalanceTransactionStatus.Active;
    return WalletBalancesList(
      balancesList: state.data,
      status: status,
      scrollController: scrollController,
      onTapCancelTransaction: (_balanceItem) {
        DialogsManager.showAlertDialogConfirm(
            context: context,
            title: strings.cancel_transfare,
            message: strings.are_you_sure_cancel_transfer,
            confirmText: strings.confirm_button,
            onConfirm: () {
              bloc.cancelTransaction(CancelTransactionParams(
                headId :   _balanceItem.id ?? 0,companyId:  _balanceItem.companyId ?? 0,type: _balanceItem.type));
            });
      },
      onTapWithdraw: (WalletBalanceItem _balanceItem) {
        performWithdrawWithMethod(_balanceItem, context);
      },
    );
  }

  Future<void> performWithdrawWithMethod(
      WalletBalanceItem company, BuildContext context) async {
    final result = await WithdrawPage.push(
        context: context,
        args: WithdrawPageArgs(withDrawByMethod: false, company: company));
    if (result == true) {
      onUpdate();
      loadInitialData(context);
    }
  }
}
