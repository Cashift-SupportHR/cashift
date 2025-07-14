import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/electronic_wallet.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/slide_animation.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/add_phone_wallet/bloc/phone_wallet_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/add_phone_wallet/page/add_phone_wallet_page.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/phone_wallets/pages/phone_wallets_screen.dart';

import '../../../../../core/services/routes.dart';

class PhoneWalletsPage extends BaseBlocWidget<
    Initialized<List<ElectronicWallet>>, PhoneWalletCubit> {

  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.loadAccountInfo();
  }

  @override
  String? title(BuildContext context) => strings.phone_wallet_title;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<ElectronicWallet>> state) {
    return PhoneWalletsScreen(
      wallets: state.data, onTapEdit: (ElectronicWallet wallet) async {
      await Navigator.pushNamed(context, Routes. addPhoneWallet , arguments:  wallet);
      loadInitialData(context);
    },

    );
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(body: Column(
      children: [
        Expanded(child: buildConsumer(context)),
        AppCupertinoButton(
          margin: EdgeInsets.only(left: 12,right: 12,bottom: 24, top: 12),
          onPressed: () async {
            await Navigator.pushNamed(context, Routes. addPhoneWallet);
            loadInitialData(context);
          },
          text: strings.add_new_wallet,
        )
      ],
    ));
  }
}
