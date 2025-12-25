import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
 import '../../../../data/models/verify_code_prams.dart';
import '../../../../data/repositories/mana_delivery_repo.dart';

@injectable
class GoToCustomerManaCubit extends BaseCubit {
  final ManaDeliverRepository _repository;

  GoToCustomerManaCubit(this._repository);
  verifyDeliveryCode(VerifyCodePrams params) {
    executeEmitterListener(() => _repository.verifyDeliveryCode(params));
  }
}
