import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/bank/bank_api_provider.dart';
import 'package:shiftapp/common/data/models/bank/index.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/index.dart';




@Injectable()
class BankRepository {

  final BankAPI _api;

  BankRepository(this._api);


  Future<List<Bank>> getAllBank() async {
    final projects = await _api.getAllBank();
    return projects.payload!;
  }
  Future<List<WalletProviderItem>> getElectronicWalletProviders() async {
    final projects = await _api.getElectronicWalletProviders();
    return projects.payload!;
  }

  Future<List<String>> fetchDisclosure() async {
    final projects = await _api.fetchDisclosure();
    return projects.payload!;
  }
  Future<String> addFreeLanceBankInfo(AddBankInfoParams params) async {
      final projects = await _api.addFreeLanceBankInfo(params);
      return projects.message!;
  }

    Future<String> addElectronicWallet(AddElectronicWalletParams params) async {
      final projects = await _api.addElectronicWallet(params);
      return projects.message!;
  }

  Future<String> withDrawFreeLanceMoney(WithDrawParams params) async {
      final projects = await _api.withDrawFreeLanceMoney(params);
      return projects.payload!;
  }

  Future<BankAccountInfo?> getFreeLanceBankInfo() async {
    final response = await _api.getFreeLanceBankInfo();
    return response.payload;
  }
  Future<List<ElectronicWallet>?> getElectronicWallets() async {
    final response = await _api.getElectronicWallets();
    return response.payload;
  }

}
