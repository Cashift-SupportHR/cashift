import 'package:flutter/material.dart';

import '../../../../../../common/data/models/wallet/balance_by_exchange_params.dart';
import '../../../../../../common/data/models/wallet/withdraw_data.dart';
import '../../../../../shared/components/app_cupertino_button.dart';
import '../../../../../shared/components/base_widget_bloc.dart';
import '../../../../../shared/components/helper_widgets.dart';
import '../../../../../shared/components/underline_widget.dart';
import '../../../../common/common_state.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import '../bloc/withdraw_cubit.dart';

class ConfirmWithdrawActionBuilder extends BaseBlocWidget<Initialized, WithdrawCubit>  {
  final String message;
  final BalanceByExchangeParams params;
  final Function() onConfirm ;
  ConfirmWithdrawActionBuilder({Key? key, required this.message, required this.params, required this.onConfirm}) : super(key: key);
  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.getDataWithdraw(params);
  }

  @override
  onClickReload() {
    loadInitialData(context);
  }



  @override
  Widget buildWidget(BuildContext context, Initialized state) {
    WithdrawData? data = state.data;
    return Container(
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(message, style: kTextMediumPrimary.copyWith(fontSize: 16),),
         const SizedBox(height: 20,),
         rowAndValue(text: strings.transfer_amount, value: ": ${data?.transferBalance ?? 0} ${strings.rs}"),
         const Divider(color: kCoolGrey,thickness: .2),
         rowAndValue(text: strings.transfer_fee, value:  ": ${data?.transferFee ?? 0} ${strings.rs}"),
         const Divider(color: kCoolGrey,thickness: .2),
         rowAndValue(text: strings.net_amount_transferred, value:  ": ${data?.totalBalance ?? 0} ${strings.rs}"),
         const Divider(color: kCoolGrey,thickness: .2),
         const Spacer(),
         AppCupertinoButton(
           onPressed: onConfirm,
           margin: const EdgeInsets.only(bottom: 20),
           text: strings.confirm_button,)
       ],
   ),
    );
  }

  static rowAndValue( { required String text  , required String value}){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Text(text ,style:kTextSemiBold.copyWith(color: kPrimary, fontSize: 18) ,),
          const SizedBox(width: 5,),
          Text(value ,style:kTextRegular.copyWith(color: kGrey, fontSize: 15) ,),
        ],
      ),
    );
  }
}



    confirmWithdrawAction({
    required BuildContext context,
      required String title,
    required String message,
    required BalanceByExchangeParams params,
    required Function() onConfirm,
}) {
  //  if (_formKey.currentState?.validate() == true) {
  showAppModalBottomSheet(
    context: context,
    isScrollControlled: false,
    isDivider: false,
    titleWidget:  Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kTextBold.copyWith(color: kPrimary),
          ),
          const UnderlineWidget(),
        ],
      ),
    ),
    child: ConfirmWithdrawActionBuilder(message: message, params: params, onConfirm: (){
      Navigator.pop(context);
      onConfirm();
    },),
  );
}
