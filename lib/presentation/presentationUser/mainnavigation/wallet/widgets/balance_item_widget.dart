import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/common/domain/entities/wallet/balance_transaction_status.dart';
import 'package:shiftapp/common/domain/entities/wallet/wallet_balance_item.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../../utils/app_icons.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/image_builder.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import 'show_buton_sheet_tapBar_widget.dart';


class BalanceItemWidget extends BaseStatelessWidget {
  final WalletBalanceItem balanceItem;
  final Function() onTapWithdraw;
  final Function() onTapCancelTransfer;
  final int status;

  BalanceItemWidget(
      {Key? key,
      required this.balanceItem,
      required this.onTapWithdraw,
      required this.onTapCancelTransfer,
      required this.status})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: kBuildImage(balanceItem.logo.toString(),
                  size: 20, border: 0)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                headerWidget(context),
                valueAndTextFunds(value: balanceItem.typeTransfer??'',text: strings.type_transfer),
                Row(
                  children: [
                    Expanded(child: transferInfo()),
                    transferActions()
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget transferInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        balanceItem.employeeName != null
            ? valueAndTextFunds(
                text: "${strings.transfer_balance}: ",
                value: balanceItem.employeeName ?? "")
            : Container(),
        status == BalanceTransactionStatus.Active
            ? valueAndTextFunds(
                text: "${strings.current_balance}: ",
                value: "${balanceItem.balance ?? "0"} ${strings.rs}")
            : Container(),
/*        Text(
          balanceItem.typeTransfer ?? "",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: kTextMedium.copyWith(
            color: kGrey,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),*/
        balanceItem.status == true
            ? Text(
                balanceItem.statusName ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: kTextMedium.copyWith(
                  color: kGrey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              )
            : Container()
      ],
    );
  }

  Widget transferActions() {
    return status == BalanceTransactionStatus.Active
        ? transferButton()
        : transferredBalance();
  }

  Widget valueAndTextFunds({required String text, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: kTextMedium.copyWith(
              color: kPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: kTextMedium.copyWith(
                color: kFontDark,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget transferredBalance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(
                Icons.arrow_upward,
                size: 20,
                color: kPrimary,
              ),
            ),
            Text(
              "${balanceItem.balance ?? 0.0}  ${strings.rs}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: kTextMedium.copyWith(
                color: kPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        Text(
          DateFormatter.repairApiDateTime(balanceItem.date ?? '') ?? "",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: kTextMedium.copyWith(
            color: kBattleShipGrey,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget transferButton() {
    return balanceItem.status == false
        ? InkWell(
            onTap: () {
              onTapWithdraw();
            },
            child: Container(
              width: 100,
              height: 25,
              decoration:
                  Decorations.boxDecorationShaded(color: kPrimary, radius: 20),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    Text(strings.transfer_money,
                        style: kTextMedium.copyWith(
                          color: kWhiteE4,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      AppIcons.transfare,
                    ),
                  ],
                ),
              ),
            ),
          )
        : balanceItem.status == true
            ? InkWell(
                onTap: () {
                  onTapCancelTransfer();
                },
                child: Container(
                  width: 100,
                  height: 25,
                  alignment: Alignment.center,
                  decoration:
                      Decorations.boxDecorationShaded(color: kRed, radius: 20),
                  child: Text(strings.cancel_transfare,
                      style: kTextMedium.copyWith(
                        color: kWhiteE4,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              )
            : Container();
  }

  Widget headerWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            balanceItem.companyName ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: kTextMedium.copyWith(
              color: kPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        showButtonTabBar(
            companyId: balanceItem.companyId ?? 0,
            statusId: status,
            headId: balanceItem.id ?? 0,
            type:balanceItem.type??0,
            context: context),
      ],
    );
  }
}
