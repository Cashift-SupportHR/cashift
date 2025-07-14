import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';

import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import '../../../../../../common/domain/entities/bankaccount/with_draw_params.dart';
import '../../../../../../common/domain/entities/wallet/wallet_balance_item.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_method.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_to_another_account_params.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import '../bloc/initialize_withdraw.dart';
import '../bloc/withdraw_cubit.dart';
import 'withdraw_screen.dart';


class WithdrawPageArgs {
  final bool withDrawByMethod;
  final WithdrawMethod? method;
  final WalletBalanceItem? company;

  WithdrawPageArgs({required this.withDrawByMethod, this.method, this.company})
      : assert(withDrawByMethod == true || method == null,
            'must included methodCode'),
        assert(method == null || company == null,
            'can not provide both company id and method code');
}


class WithdrawPage extends BaseBlocWidget<InitializedWithdraw, WithdrawCubit> {
   static Future push({required BuildContext context, required WithdrawPageArgs args}) {
    return Navigator.pushNamed(context, Routes.withdrawPage, arguments: args);
  }
  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, InitializedWithdraw state) {

    return WithdrawScreen(
      state: state,
      args: pageArgs(context)!,
      fetchBank: () {
        bloc.fetchBankAccount();
      },
      fetchWallet: () {
        bloc.fetchPhoneWallets();
      },
      withdrawByPhone: (params) {
        bloc.withDrawByPhoneWallet(params: params);
      },
      withdrawByBank: (WithDrawParams projectId) {
        bloc.withDrawFreeLanceMoney(projectId);
      },
      withdrawToAccount: (WithdrawToAnotherAccountParams params) {
        bloc.withdrawToAnotherAccount(params: params);
      },
      fetchIdNumber: (idNumber) {
        bloc.fetchNamedByIdNumber(idNumber);
      },
    );
  }

  @override
  void loadInitialData(BuildContext context) {
    final model = pageArgs(context);
    if (model?.withDrawByMethod == true) {
      bloc.fetchCompaniesAvailableForWithdraw(model!.method!);
    } else {
      bloc.fetchWithdrawMethods(model!.company!.companyId!);
    }
  }


  @override
  Widget build(BuildContext context) {

    final args = pageArgs(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        centerTitle:true ,
        title:  Text(
          args .withDrawByMethod
              ? '${strings.withdraw_through} '
              '(${args.method!.name})'
              : strings.withdraw,
          style: kTextMedium.copyWith(color: kWhiteF2),
        ),
      ),
      body:buildConsumer(context) ,
    );
  }
  WithdrawPageArgs? pageArgs(BuildContext context) =>
      getArguments<WithdrawPageArgs>(context);

  @override
  void onRequestSuccess(String? message) {
    showSuccessMessage(message!,onDismiss: (){
      Navigator.pop(context,true);
    });
  }

  @override
  void onRequestFail(Object error) {
    Navigator.pop(context, true);
    Navigator.pop(context, true);
    handleErrorDialog(error, context);
  }
}
