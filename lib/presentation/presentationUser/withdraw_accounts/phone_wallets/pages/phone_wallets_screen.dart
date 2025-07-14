import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/electronic_wallet.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/phone_wallets/widgets/phone_wallet_item.dart';

class PhoneWalletsScreen extends BaseStatelessWidget {
  final List<ElectronicWallet> wallets;
  final Function(ElectronicWallet wallet) onTapEdit;
  PhoneWalletsScreen({
    required this.wallets,
    required this.onTapEdit,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: wallets.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PhoneWalletItemWidget(
            wallets[index],
            onTapEdit: () {
              onTapEdit(wallets[index]);
            },
          );
        });
  }
}
