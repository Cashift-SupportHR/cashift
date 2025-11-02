import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../data/repositories/logistics_request_repo.dart';



@injectable
class LicenseDataCubit extends BaseCubit {
  final LogisticsRequestRepository _repository;


  LicenseDataCubit(
      this._repository);


}
