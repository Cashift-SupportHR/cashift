import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../../../common/data/exceptions/empty_list_exception.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/final_action_follow_up_maintenance_prams.dart';
import '../../../data/repositories/maintenance_breakdowns_repository.dart';
import '../../../domain/entities/maintenance.dart';

@Injectable()
class MaintenanceBreakdownsCubit extends BaseCubit {
  final MaintenanceBreakdownsRepository repository;

  MaintenanceBreakdownsCubit(this.repository);

  StreamDataStateInitial<List<Maintenance>?>
  maintenanceBreakdownsStream = StreamDataStateInitial();
  List<Maintenance> maintenanceBreakdowns = [];

  void fetchInitialData() async {
    executeBuilder(
      () => repository.fetchTapsMaintenanceBreakdowns(),
      onSuccess: (data) {
        if (data.isNotEmpty) {
          fetchMaintenanceBreakdowns(data[0].id!);
        }
        emit(Initialized<List<CommonListItem>>(data: data));
      },
    );
  }

  void fetchMaintenanceBreakdowns(int type) async {
    try {
      maintenanceBreakdownsStream.start();
      final data = await repository.fetchMaintenanceBreakdowns(type);
      maintenanceBreakdowns = data;
      maintenanceBreakdownsStream.setData(data);
    } catch (e) {
      maintenanceBreakdownsStream.setError(e);
    }
  }


  void searchByText(String value) {
    try {
      List<Maintenance> usersSearched = maintenanceBreakdowns;
      if (value.isNotEmpty) {
        usersSearched = maintenanceBreakdowns
            .where((data) =>
        (data.shiftAdminAction != null && data.shiftAdminAction!.toString().contains(value)) ||
            (data.description != null && data.description!.contains(value)) ||
            (data.time != null && data.time!.contains(value)) ||
            (data.importantLevel != null && data.importantLevel!.contains(value)) ||
            (data.faultMaintenanceType != null && data.faultMaintenanceType!.contains(value)) ||
            (data.dateFaultApplying != null && data.dateFaultApplying!.contains(value)) ||
            (data.adminAction != null && data.adminAction!.contains(value)))
            .toList();
      }
      maintenanceBreakdownsStream.setData(usersSearched);
    } on Exception catch (e) {
      print(e);
      maintenanceBreakdownsStream.setError(e);
    }
  }


  void finalActionFollowUpMaintenance(FinalActionFollowUpMaintenancePrams params) async {
    executeEmitterListener(() => repository.finalActionFollowUpMaintenance(params));
  }
}
