import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/exceptions/no_bank_account_exception.dart';
import 'package:shiftapp/common/data/models/bank/add_bank_info_params.dart';
import 'package:shiftapp/common/data/repositories/wallet/bank_repository.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/bank_account_info.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/bank_page_data.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

@Injectable()
class BankAccountCubit extends BaseCubit {
  static const HASH_KEY = '7c0b9378-4bae-4164-a366-cbfcf9128a23';

  final BankRepository repository;
  BankAccountCubit(this.repository);

  checkHaveAccountAndLoadInfo() async {
    try {
      emit(LoadingState());
      final info = await repository.getFreeLanceBankInfo();
      if (info != null) {
        emit(Initialized<BankAccountInfo>(data: info));
      } else {
        loadBankList();
      }
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  loadAccountInfo() async {
    try {
      emit(LoadingState());
      final info = await repository.getFreeLanceBankInfo();
      if (info != null) {
        emit(Initialized<BankAccountInfo>(data: info));
      } else {
        emit(ErrorState(NoBankAccountException()));
      }
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  loadBankList() async {
    try {
      emit(LoadingState());
      final info = await repository.getAllBank();
      final disclosure = await repository.fetchDisclosure();

      emit(Initialized<BankPageData>(
          data: BankPageData(bankList: info, disclosure: disclosure)));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  addNewAccount(AddBankInfoParams params) async {
    try {
      emit(LoadingStateListener());
      final info = await repository.addFreeLanceBankInfo(params);
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
