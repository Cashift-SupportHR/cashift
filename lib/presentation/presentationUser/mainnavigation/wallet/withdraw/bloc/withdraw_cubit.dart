import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/common/data/exceptions/no_bank_account_exception.dart';
import 'package:shiftapp/common/data/repositories/bank/wallet_repository.dart';
import 'package:shiftapp/common/data/repositories/wallet/bank_repository.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/electronic_wallet.dart';
import 'package:shiftapp/common/domain/entities/wallet/withdraw_by_phone_wallet_params.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/add_phone_wallet/bloc/phone_wallet_cubit.dart';
import 'package:crypto/crypto.dart';
import '../../../../../../common/data/exceptions/no_phone_wallet_exception.dart';
import '../../../../../../common/data/models/wallet/balance_by_exchange_params.dart';
import '../../../../../../common/data/models/wallet/name_by_id_number.dart';
import '../../../../../../common/domain/entities/bankaccount/bank_account_info.dart';
import '../../../../../../common/domain/entities/bankaccount/with_draw_params.dart';
import '../../../../../../common/domain/entities/api_code.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_method.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_methods.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_to_another_account_params.dart';
import 'initialize_withdraw.dart';
@Injectable()
class WithdrawCubit extends BaseCubit {
  final WalletRepository _walletRepository;
  final BankRepository _bankRepository;
  WithdrawCubit(this._walletRepository, this._bankRepository);

  final phoneWalletsStream = StreamStateInitial<List<ElectronicWallet>?>();
  final bankAccountStream = StreamStateInitial<BankAccountInfo?>();
  final idNumberStream = StreamStateInitial<NameByIdNumber?>();

  fetchWithdrawMethods(int companyId) async {
    try {
      emit(LoadingState());
      final availableMethods = await _walletRepository
          .fetchAvailableWithdrawMethodsForCompany(companyId);
      emit(InitializedWithdraw(
          availableMethods: availableMethods.payload ?? [],
          bankAccountStream: bankAccountStream,
          phoneWalletsStream: phoneWalletsStream,
          nameByIdNumberStream: idNumberStream));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  fetchCompaniesAvailableForWithdraw(WithdrawMethod method) async {
    try {
      emit(LoadingState());
      final companies = await _walletRepository
          .fetchAvailableCompaniesForWithdrawMethod(method.id!);
      if (method.code == WithdrawCode.PHONE_WALLET) {
        fetchPhoneWallets();
      }
      if (method.code == WithdrawCode.BANK_ACCONT) {
        fetchBankAccount();
      }
      emit(InitializedWithdraw(
          availableCompanies: companies.payload ?? [],
          bankAccountStream: bankAccountStream,
          phoneWalletsStream: phoneWalletsStream,
          nameByIdNumberStream: idNumberStream));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  fetchPhoneWallets() async {
    try {
      // emit(LoadingState());
      bankAccountStream.setData(null);
      idNumberStream.setData(null);
      final wallets = await _bankRepository.getElectronicWallets();
      if (wallets?.isEmpty == true) {
        phoneWalletsStream.setError(NoPhoneWalletException());
      } else {
        phoneWalletsStream.setData(wallets);
      }
      //emit(Initialized<List<ElectronicWallet>>(data: wallets ?? []));
    } catch (e) {
      if (e is DioError &&
          e.error is ApiException &&
          (e.error as ApiException).code == ApiCode.EMPTY) {
        phoneWalletsStream.setError(NoPhoneWalletException());
      } else {
        phoneWalletsStream.setError(e);
      }
      // emit(ErrorState(e));
    }
  }

  fetchBankAccount() async {
    try {
      phoneWalletsStream.setData(null);
      idNumberStream.setData(null);
      // emit(LoadingState());
      final bankInfo = await _bankRepository.getFreeLanceBankInfo();
      if (bankInfo == null) {
        bankAccountStream.setError(NoBankAccountException());
      } else {
        bankAccountStream.setData(bankInfo);
      }
      //emit(Initialized<List<ElectronicWallet>>(data: wallets ?? []));
    } catch (e) {
      bankAccountStream.setError(e);
      // emit(ErrorState(e));
    }
  }

  withDrawByPhoneWallet({required WithdrawByPhoneWalletParams params}) async {
    try {
      emit(LoadingStateListener());
      final bankCode = projectToSHA256(params.projectId!);
      final message = await _walletRepository.withdrawByPhoneWallet(
          WithdrawByPhoneWalletParams(
              providerId: params.providerId,
              bankCode: bankCode,
              projectId: params.projectId,
              transferId: params.transferId,
              type: params.type));
      emit(SuccessStateListener(data: message));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  withdrawToAnotherAccount(
      {required WithdrawToAnotherAccountParams params}) async {
    try {
      emit(LoadingStateListener());
      final message = await _walletRepository.withdrawToAnotherAccount(params);
      emit(SuccessStateListener(data: message));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  withDrawFreeLanceMoney(WithDrawParams params) async {
    try {
      emit(LoadingStateListener());
      final info = await _bankRepository.withDrawFreeLanceMoney(WithDrawParams(
          projectId: params.projectId,
          bankCode: projectToSHA256(params.projectId),
          transactionType: 2,
          transferId: params.transferId));
      emit(SuccessStateListener(data: info));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  getDataWithdraw(BalanceByExchangeParams params) async {
    try {
      emit(LoadingState());
      final data = await _walletRepository.getWithdrawData(params);
      print('getDataWithdraw  ${data.payload}');
      emit(Initialized(data: data.payload));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  String projectToSHA256(int projectId) {
    final code = '$projectId|$HASH_KEY';
    var bytes = utf8.encode(code); // data being hashed
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  fetchNamedByIdNumber(String idNumber) async {
    try {
      bankAccountStream.setData(null);
      phoneWalletsStream.setData(null);

      final data =
          await _walletRepository.fetchNamedByIdNumber(idNumber: idNumber);
      idNumberStream.setData(data.payload);
    } catch (e) {
      idNumberStream.setError(e);
      // emit(ErrorState(e));
    }
  }

  // UserRepository

}
