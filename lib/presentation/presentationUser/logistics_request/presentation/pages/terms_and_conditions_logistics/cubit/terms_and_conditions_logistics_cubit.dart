import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/models/add_logistics_prams.dart';
import '../../../../data/repositories/logistics_request_repo.dart';
import '../../../../domain/entities/index.dart';

@injectable
class TermsAndConditionsLogisticsCubit extends BaseCubit {
  final LogisticsRequestRepository _repository;

  TermsAndConditionsLogisticsCubit(this._repository);

  fetchCarTermsAndConditions() async {
    executeBuilder(
      () async => await _repository.fetchCarTermsAndConditions(),
      onSuccess: (value) {
        emit(Initialized<List<CarTermsAndConditionsEntity>>(data: value));
      },
    );
  }

  addLogistic(AddLogisticPrams params) async {
    executeListener(
      () async => await _repository.CanSubmitLogistics(),
      onSuccess: (value) async {
        try {
          final data = await _repository.addLogistic(params);
          emit((SuccessStateListener(data: data)));
        } catch (e) {
          emit(FailureStateListener(e));
        }
      },
    );
  }
}
