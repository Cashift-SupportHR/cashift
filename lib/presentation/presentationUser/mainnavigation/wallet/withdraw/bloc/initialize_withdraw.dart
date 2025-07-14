import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../common/data/models/wallet/name_by_id_number.dart';
import '../../../../../../common/domain/entities/bankaccount/bank_account_info.dart';
import '../../../../../../common/domain/entities/bankaccount/electronic_wallet.dart';
import '../../../../../../common/domain/entities/wallet/wallet_balance_item.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_method.dart';

class InitializedWithdraw extends CommonStateFBuilder{
  final  List<WalletBalanceItem> ?  availableCompanies ;
  final  List<WithdrawMethod> ?  availableMethods ;
  final  StreamStateInitial<List<ElectronicWallet>?> phoneWalletsStream;
  final  StreamStateInitial<BankAccountInfo?> bankAccountStream;
  final  StreamStateInitial<NameByIdNumber?> nameByIdNumberStream;

  InitializedWithdraw({ this.availableCompanies , this.availableMethods , required this.bankAccountStream , required this.phoneWalletsStream, required this.nameByIdNumberStream});
}