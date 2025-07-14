import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/bank/wallet_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../common/domain/entities/wallet/balance_details_query.dart';

@Injectable()
class ApplyDetailsCubit extends BaseCubit {
  final WalletRepository _repository;
  ApplyDetailsCubit(this._repository);

  loadApplyDetails({required BalanceDetailsQuery query}) async {
    try {
      emit(LoadingState());
      final applyDetails = await _repository.fetchApplyDetails(query: query);
      emit(Initialized(data: applyDetails.payload ?? []));
    } catch (e) {
      print('error loan ${e}');
      emit(ErrorState(e));
    }
  }
}
