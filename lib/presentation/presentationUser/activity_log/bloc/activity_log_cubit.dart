
import 'package:injectable/injectable.dart';
  import 'package:shiftapp/common/data/repositories/activitylog/activity_log_repository.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../common/data/models/activity_log/confirm_activity_params.dart';

@Injectable()
class ActivityLogCubit extends BaseCubit {
  final ActivityLogRepository _activityLogRepository;
  ActivityLogCubit(this._activityLogRepository) : super();

  fetchActivityLog(bool isActive) async{
    executeEmitterData(() => _activityLogRepository.fetchActivityLog(isActive ? 1 : 2));
  }

 void confirmActivity(ConfirmActivityParams params) {
    executeEmitterListener(() => _activityLogRepository.confirmActivity(params));
  }
}
