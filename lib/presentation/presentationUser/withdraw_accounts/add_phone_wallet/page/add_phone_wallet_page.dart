import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/data/models/bank/add_electronic_wallet.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/electronic_wallet.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/phone_wallet_required_data.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/add_phone_wallet/bloc/phone_wallet_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/add_phone_wallet/page/add_phone_wallet_screen.dart';

class AddPhoneWalletPage extends BaseBlocWidget<
    Initialized<PhoneWalletRequiredData>, PhoneWalletCubit> {

  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.loadAddWalletRequiredData();
  }

  @override
  String? title(BuildContext context) => strings.phone_wallet_title;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<PhoneWalletRequiredData> state) {
    return AddPhoneWalletScreen(
      phoneWalletRequiredData: state.data,
      wallet : walletModel(context),
      onSubmit: (AddElectronicWalletParams params) {
        bloc.addNewAccount(params);
      },
    );
  }

  ElectronicWallet? walletModel(BuildContext context) =>
      context.getArguments();

  @override
  void onRequestSuccess(String? message) {
    showSuccessMessage(message!,onDismiss: (){
      Navigator.pop(context,true);
    });
  }
}
