import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../data/repositories/mana_delivery_repo.dart';



@injectable
class NearestWarehouseCubit extends BaseCubit {
  final ManaDeliverRepository _repository;


  NearestWarehouseCubit(
      this._repository);


}
