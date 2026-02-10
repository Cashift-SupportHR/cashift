import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/data/repositories/bank/wallet_repository.dart';
import 'package:shiftapp/domain/entities/wallet/withdraw_method.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../data/datasources/remote/unauthorized_exception.dart';
import '../../../../../data/exceptions/verification_face_exception.dart';
import '../../../../../data/repositories/user/user_repository.dart';
import '../../../../shared/check_face_recognation/page/check_face_recognatin_page.dart';
import 'initialize_wallet_state.dart';

@Injectable()
class WalletCubit extends BaseCubit {
  final WalletRepository repository;
  final UserRepository userRepository;

  WalletCubit(this.repository, this.userRepository);

  loadWithdrawMethods() async {
    try {
      emit(LoadingState());
      final response = await repository.getWithdrawMethods();
      emit(Initialized<List<WithdrawMethod>>(data: response));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  bool isLogin(){
    if (userRepository.isNotLoggedIn()) {
      emit(ErrorState(UnAuthorizedException()));
      return false;
    }
    return true;
  }
  fetchWalletRequiredData() async {
    try {
      emit(LoadingState());
      if (userRepository.isNotLoggedIn()) {
        emit(ErrorState(UnAuthorizedException()));
        return;
      }
        final balance = await repository.fetchCurrentBalance();
        final withDrawMethods = await repository.getWithdrawMethods();
        emit(InitializeWalletState(
            withdrawMethods: withDrawMethods, walletBalance: balance.payload!));
    } catch (e) {
      emit(ErrorState(e));
    }
  }


}
