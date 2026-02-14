import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/models/index.dart';
import '../../../../data/repositories/mana_delivery_repo.dart';
import '../../../../domain/entities/index.dart';

@injectable
class ResendCodeCubit extends BaseCubit {
  final ManaDeliverRepository _repository;

  ResendCodeCubit(this._repository);

  VerifyPickupCode(VerifyCodePrams params){
    executeEmitterListener(() => _repository.verifyPickupCode(params),);
  }
}
