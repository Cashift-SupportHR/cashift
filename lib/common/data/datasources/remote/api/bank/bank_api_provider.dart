
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/data/models/bank/index.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/index.dart';

import '../../../../../network/source/user_endpoint.dart';


@Injectable()
class BankAPI {
  final UserEndpoint api;
  BankAPI(this.api);

  Future<ApiResponse<List<Bank>>> getAllBank() async {
    return await api.getAllBank();
  }

  Future<ApiResponse<List<WalletProviderItem>>> getElectronicWalletProviders() async {
    return await api.getElectronicWalletProviders();
  }

  Future<ApiResponse<List<String>>> fetchDisclosure() async {
    return await api.fetchDisclosure();
  }
//v2/VerifyCode/CheckCodeByFreeLance
  Future<ApiResponse<int>> addFreeLanceBankInfo(
      @Body() AddBankInfoParams bankInfoParams) async {
    return await api.addFreeLanceBankInfo(bankInfoParams);
  }

  Future<ApiResponse<int>> addElectronicWallet(
      @Body() AddElectronicWalletParams params) async {
    return await api.addElectronicWallet(params);
  }

  Future<ApiResponse<String>> withDrawFreeLanceMoney(
      @Body() WithDrawParams params) async {
    return await api.withDrawFreeLanceMoney(params);
  }

  Future<ApiResponse<BankAccountInfo>> getFreeLanceBankInfo() async {
    return await api.getFreeLanceBankInfo();
  }

  Future<ApiResponse<List<ElectronicWallet>>> getElectronicWallets() async {
    return await api.getElectronicWallets();
  }
}
