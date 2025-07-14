
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/domain/entities/loans_request/index.dart';

import '../../../../../common/data/repositories/financial_requests/loans_request_repository.dart';

@Injectable()
class LoanRequestsCubit extends BaseCubit {
  final LoansRequestRepository repository;

  LoanRequestsCubit(this.repository);

  Future<void> fetchLoansRequests(int type) async {
    emit(LoadingState());
    try {
     final result = await repository.fetchLoansRequests(type);
      List<LoanRequest> data =
          (result).map((e) => LoanRequest.fromJson(e)).toList();
      emit(Initialized<List<LoanRequest>>(data: data));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
  }

}
