import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/domain/entities/bail_requests/index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/data/models/bail_requests/index.dart';

import '../../../../../common/data/repositories/bail_requests/bail_requests_repository.dart';

@Injectable()
class BailRequestsCubit extends BaseCubit {
  final BailRequestsRepository repository;

  BailRequestsCubit(this.repository);

  Future<void> loadInitialData(int type) async {
    emit(LoadingState());
    try {
      final requests = await fetchBailRequests(type);
      final termsAndConditions = await fetchBailTermsAndConditions();
      emit(InitializedBailRequests(
          requests: requests, termsAndConditions: termsAndConditions));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
    ;
  }

  Future<List<BailRequest>> fetchBailRequests(int type) async {
    final requestsDto = await repository.fetchBailRequests(type);
    List<BailRequest> requests =
        (requestsDto).map((e) => BailRequest.fromDto(e)).toList();
    return requests;
  }

  Future<List<BailTermAndCondition>> fetchBailTermsAndConditions() async {
    final result = await repository.fetchBailTermsAndConditions();
    List<BailTermAndCondition> data =
        (result).map((e) => BailTermAndCondition.fromDto(e)).toList();
    return data;
  }

  Future<void> approveRejectBailRequest(ApproveRejectBailParams params) async {
    emit(LoadingStateListener());
    try {
      final result = await repository.approveRejectBailRequest(params);
      emit(SuccessStateListener(data: result));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
