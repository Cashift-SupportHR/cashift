import 'dart:async';
 import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/wallet/wallet_api_provider.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
 import 'package:shiftapp/common/data/models/wallet/index.dart';
 import 'package:shiftapp/common/domain/entities/wallet/index.dart';

@Injectable()
class WalletRepository {
  final WalletAPI _api;

  WalletRepository(this._api);

  Future<List<WithdrawMethod>> getWithdrawMethods() async {
    final projects = await _api.getWithdrawMethods();
    return projects.payload!;
  }

  Future<String> withdrawByPhoneWallet(
      WithdrawByPhoneWalletParams params) async {
    final projects = await _api.withdrawByPhoneWallet(params);
    return projects.message!;
  }

  Future<String> withdrawToAnotherAccount(
      WithdrawToAnotherAccountParams params) async {
    final projects = await _api.withdrawToAnotherAccount(params);
    return projects.message!;
  }

  Future<ApiResponse<List<WalletBalanceItem>>>
      fetchAvailableCompaniesForWithdrawMethod(int withdrawId) {
    return _api.fetchAvailableCompaniesForWithdrawMethod(withdrawId);
  }

  Future<ApiResponse<List<WithdrawMethod>>>
      fetchAvailableWithdrawMethodsForCompany(int companyId) {
    return _api.fetchAvailableWithdrawMethodsForCompany(companyId);
  }

  Future<ApiResponse<List<WalletBalanceItem>>> fetchWalletBalances(
      int statusId) {
    return _api.fetchWalletBalances(statusId);
  }

  Future<ApiResponse<CurrentBalance>> fetchCurrentBalance() {
    return _api.fetchCurrentBalance();
  }

  Future<ApiResponse<List<ApplyDetails>>> fetchApplyDetails(
      {required BalanceDetailsQuery query}) {
    return _api.fetchApplyDetails(query);
  }

  Future<ApiResponse<NameByIdNumber>> fetchNamedByIdNumber(
      {required String idNumber}) {
    return _api.fetchNamedByIdNumber(idNumber);
  }

  Future<String> cancelTransaction(
      {required CancelTransactionParams params}) async {
    final projects = await _api.cancelTransaction(params);
    return projects.message!;
  }

  Future<ApiResponse<WithdrawData>> getWithdrawData(
      BalanceByExchangeParams params) {
    return _api.getWithdrawData(params);
  }
}
