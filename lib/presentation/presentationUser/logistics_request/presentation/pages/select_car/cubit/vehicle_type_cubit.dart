import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/repositories/logistics_request_repo.dart';
import '../../../../domain/entities/index.dart';

@injectable
class VehicleTypeCubit extends BaseCubit {
  final LogisticsRequestRepository _repository;

  VehicleTypeCubit(this._repository);

  fetchCarLogistics() async {
    executeBuilder(
      () async => await _repository.fetchCarLogistics(),
      onSuccess: (value) {
        emit(Initialized<List<CarLogisticsEntity>>(data: value));
      },
    );
  }
}
