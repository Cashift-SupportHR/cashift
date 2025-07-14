import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../../common/data/exceptions/empty_list_exception.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../presentationUser/vehiclesOperation/domain/entities/receive_vehicle_details.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_follow_up_violation_params.dart';
import '../../../data/models/index.dart';
import '../../../domain/entities/index.dart';

@Injectable()
class ActionFollowUpViolationsCubit extends BaseCubit {
  final GeneralViolationsRepository repository;

  ActionFollowUpViolationsCubit(this.repository);

  void fetchInitialData() async {
    executeEmitterData(() => repository.fetchViolationImportantLevels());
  }

  void actionFollowUpViolation(ActionFollowUpViolationParams params) async {
    executeEmitterListener(() => repository.actionFollowUpViolation(params));
  }
}
