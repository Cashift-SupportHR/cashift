import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/repositories/mana_delivery_repo.dart';
import '../../../../domain/entities/index.dart';

@injectable
class ResendCodeCubit extends BaseCubit {
  final ManaDeliverRepository _repository;

  ResendCodeCubit(this._repository);

  // fetchCarLogistics() async {
  //   executeBuilder(
  //     () async => await _repository.fetchCarLogistics(),
  //     onSuccess: (value) {
  //       emit(Initialized<List<CarLogisticsEntity>>(data: value));
  //     },
  //   );
  // }
}
