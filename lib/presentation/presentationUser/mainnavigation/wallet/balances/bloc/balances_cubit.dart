import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/bank/wallet_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../common/domain/entities/wallet/cancel_transaction_params.dart';


@Injectable()
class BalancesCubit extends BaseCubit {
  final WalletRepository _repository;
  BalancesCubit(this._repository);

  loadBalances(int statusId) async {
    try {
      emit(LoadingState());
      final balances = await _repository.fetchWalletBalances(statusId);
      emit(Initialized(data: balances.payload ?? []));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  cancelTransaction(CancelTransactionParams params) async {
    try {
      emit(LoadingStateListener());
      final balances = await _repository.cancelTransaction( params: params);
      emit(SuccessStateListener(data: balances));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }


}
