import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/models/bank/add_electronic_wallet.dart';
import 'package:shiftapp/common/data/repositories/wallet/bank_repository.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/electronic_wallet.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/phone_wallet_required_data.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

const HASH_KEY = '7c0b9378-4bae-4164-a366-cbfcf9128a23';
@Injectable()
class PhoneWalletCubit extends BaseCubit {

  final BankRepository repository;
  PhoneWalletCubit(this.repository);

  checkHaveAccountAndLoadInfo() async {
    try {
      emit(LoadingState());
      final info = await repository.getElectronicWallets();
      if (info != null) {
        emit(Initialized<List<ElectronicWallet>>(data: info));
      } else {
        loadAddWalletRequiredData();
      }
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  loadAccountInfo() async {
    try {
      emit(LoadingState());
      final info = await repository.getElectronicWallets();
        emit(Initialized<List<ElectronicWallet>>(data: info??[]));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  loadAddWalletRequiredData() async {
    try {
      emit(LoadingState());
      final disclosure = await repository.fetchDisclosure();
      final providers = await repository.getElectronicWalletProviders();
      emit(Initialized<PhoneWalletRequiredData>(data: PhoneWalletRequiredData(disclosure: disclosure, providers: providers,)));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  addNewAccount(AddElectronicWalletParams params) async {
    try {
      emit(LoadingStateListener());
      final info = await repository.addElectronicWallet(params);
      emit(SuccessStateListener(data: info));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  String projectToSHA256(int projectId) {
    final code = '$projectId|$HASH_KEY';
    var bytes = utf8.encode(code); // data being hashed
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
