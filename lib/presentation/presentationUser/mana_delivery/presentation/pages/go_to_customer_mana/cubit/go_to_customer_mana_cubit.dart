import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../common/common_state.dart';
 import '../../../../data/repositories/mana_delivery_repo.dart';
import '../../../../domain/entities/index.dart';

@injectable
class GoToCustomerManaCubit extends BaseCubit {
  final ManaDeliverRepository _repository;

  GoToCustomerManaCubit(this._repository);

  // fetchCarTermsAndConditions() async {
  //   executeBuilder(
  //     () async => await _repository.fetchCarTermsAndConditions(),
  //     onSuccess: (value) {
  //       emit(Initialized<List<CarTermsAndConditionsEntity>>(data: value));
  //     },
  //   );
  // }
  //
  //
  // addLogistic(AddLogisticPrams params) async {
  //   executeEmitterListener(() async =>   _repository.addLogistic(params));
  //   // executeListener(
  //   //   () async => await _repository.CanSubmitLogistics(),
  //   //   onSuccess: (value) async {
  //   //     try {
  //   //       final data = await _repository.addLogistic(params);
  //   //       emit((SuccessStateListener(data: data)));
  //   //     } catch (e) {
  //   //       emit(FailureStateListener(e));
  //   //     }
  //   //   },
  //   // );
  // }
}
