import 'package:flutter/material.dart';

import '../../../../../../common/domain/entities/wallet/wallet_balance_item.dart';
import '../../../../resources/colors.dart';
import '../../widgets/balance_item_widget.dart';

class WalletBalancesList extends StatelessWidget {
  final List<WalletBalanceItem> balancesList;
  final int status;
  final Function ( WalletBalanceItem _balanceItem) onTapCancelTransaction;
  final Function ( WalletBalanceItem _balanceItem) onTapWithdraw;
  final ScrollController scrollController;
  const WalletBalancesList(
      {Key? key,
      required this.balancesList,
      required this.status,
      required this.scrollController, required this.onTapCancelTransaction, required this.onTapWithdraw})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        controller: scrollController,
        itemCount: balancesList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = balancesList[index];
          return BalanceItemWidget(
            balanceItem: item,
            status : status ,
            onTapWithdraw: () {
              onTapWithdraw(item);
            },
            onTapCancelTransfer: (){
              performCancelTransaction(item );
            },


          );
        }, separatorBuilder: (BuildContext context, int index) { return    const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: kGrey_94,),
        ); },
      ),
    );
  }


  void performCancelTransaction(WalletBalanceItem company ) {
   onTapCancelTransaction(  company );
  }
}
