import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/data/models/bank/add_bank_info_params.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/bank_account_info.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/bank_page_data.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/bankaccont/pages/bank_account_info_screen.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/bankaccont/pages/bank_account_screen.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/bankaccont/bloc/bank_account_cubit.dart';

import '../../../../../core/services/routes.dart';
class BankAccountPageModel{
  final bool neededForCallback ;

  BankAccountPageModel({required this.neededForCallback});
}
class BankAccountPage extends BaseBlocWidget<Initialized<BankAccountInfo> , BankAccountCubit> {
  static Future show(BuildContext context , {bool neededForCallback = false}) async {
    return await Navigator.pushNamed(context,Routes. bankAccountPage ,arguments: BankAccountPageModel(neededForCallback: neededForCallback));
  }
  @override
  bool initializeByKoin() {
    return false;
  }
  bool update = false;

  @override
  String? title(BuildContext context) {
    return strings.bank_account ;
  }
   @override
  Widget buildWidget(BuildContext context, Initialized<BankAccountInfo> state ) {
   return bodyAccountInfo(state.data);
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.checkHaveAccountAndLoadInfo();
  }

  @override
  Widget buildWidgetState(CommonState state, BuildContext context) {
    if(state is Initialized<BankPageData>){
      return bodyAddAccount(context, state.data);
    }
    return super.buildWidgetState(state, context);
  }

  Widget bodyAccountInfo(BankAccountInfo accountInfo){
    return BankAccountInfoScreen(bankAccountInfo: accountInfo,);
  }

  Widget bodyAddAccount(BuildContext context , BankPageData pageData){
    return BankAccountScreen(pageData: pageData, onSave: (AddBankInfoParams params) {
      bloc.addNewAccount(params);
    },);
  }

  BankAccountPageModel ?  model()=> getArguments(context) !=null ? getArguments<BankAccountPageModel>(context):null;
  @override
  void onRequestSuccess(String? message) {
    if (model() !=null && model()?.neededForCallback == true) {
      showSuccessMessage(message!,onDismiss: (){
        Navigator.pop(context, true);
      });
    } else {
      update = true;
      super.onRequestSuccess(message);
      loadInitialData(context);
    }
  }

  @override
  void onBackPress() {
    Navigator.pop(context, update);

  }
}