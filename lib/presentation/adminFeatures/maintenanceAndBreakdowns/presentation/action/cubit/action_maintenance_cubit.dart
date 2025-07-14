import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../../../common/data/exceptions/empty_list_exception.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_follow_up_up_maintenance_prams.dart';
import '../../../data/repositories/maintenance_breakdowns_repository.dart';

@Injectable()
class ActionMaintenanceBreakdownsCubit extends BaseCubit {
  final MaintenanceBreakdownsRepository repository;

  ActionMaintenanceBreakdownsCubit(this.repository);

  void fetchInitialData() async {
    executeEmitterData(() => repository.fetchMaintenanceImportantLevel());
  }


  void actionFollowUpUpMaintenance(ActionFollowUpUpMaintenancePrams params) async {
    executeEmitterListener(() => repository.actionFollowUpUpMaintenance(params));
  }
}
