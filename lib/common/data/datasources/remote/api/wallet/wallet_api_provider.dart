import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/data/models/wallet/index.dart';

import 'package:shiftapp/common/domain/entities/wallet/index.dart';

import '../../../../../network/source/user_endpoint.dart';

@Injectable()
class WalletAPI {
  final UserEndpoint api;

  WalletAPI(this.api);

  Future<ApiResponse<List<WithdrawMethod>>> getWithdrawMethods() async {
    return await api.getWithdrawMethods();
  }

  Future<ApiResponse<String>> withdrawByPhoneWallet(
      WithdrawByPhoneWalletParams params) async {
    return await api.withdrawByPhoneWallet(params);
  }

  Future<ApiResponse<String>> withdrawToAnotherAccount(
      WithdrawToAnotherAccountParams params) async {
    return await api.withdrawToAnotherAccount(params);
  }

  //http://85.184.232.38:8003/api/v1/FreeLanceApplyOpportunities/GetCompanyBalanceByFreeLance?StatusId=2

  Future<ApiResponse<List<WalletBalanceItem>>> fetchWalletBalances(
      int statusId) async {
    return await api.fetchWalletBalances(statusId);
  }

  Future<ApiResponse<List<WalletBalanceItem>>>
      fetchAvailableCompaniesForWithdrawMethod(int id) async {
    return await api.fetchAvailableCompaniesForWithdrawMethod(id);
  }

  Future<ApiResponse<List<WithdrawMethod>>>
      fetchAvailableWithdrawMethodsForCompany(int id) async {
    return await api.fetchAvailableWithdrawMethodsForCompany(id);
  }

  Future<ApiResponse<CurrentBalance>> fetchCurrentBalance() async {
    return await api.fetchCurrentBalance();
  }

  Future<ApiResponse<List<ApplyDetails>>> fetchApplyDetails(
      BalanceDetailsQuery query) async {
    return await api.fetchApplyDetails(query);
  }

  Future<ApiResponse<NameByIdNumber>> fetchNamedByIdNumber(
      String idNumber) async {
    return await api.fetchNamedByIdNumber(idNumber);
  }

  Future<ApiResponse<String>> cancelTransaction(
      CancelTransactionParams params) async {
    return await api.cancelTransaction(params);
  }

  Future<ApiResponse<WithdrawData>> getWithdrawData(
      BalanceByExchangeParams params) async {
    return await api.getWithdrawData(params);
  }
}
