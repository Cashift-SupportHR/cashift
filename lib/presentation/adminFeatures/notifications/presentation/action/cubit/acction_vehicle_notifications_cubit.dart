import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../../../common/data/exceptions/empty_list_exception.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_notifications_prams.dart';
import '../../../data/repositories/notifications_repository.dart';
import '../../../domain/entities/vehicle_notifications.dart';

@Injectable()
class ActionVehicleNotificationsCubit extends BaseCubit {
  final NotificationsRepository repository;

  ActionVehicleNotificationsCubit(this.repository);

  StreamDataStateInitial<List<VehicleNotification>?>
  vehicleNotificationsStream = StreamDataStateInitial();
  List<VehicleNotification> vehicleNotifications = [];


  void finalActionVehicleNotification(ActionNotificationsPrams params) async {
    executeEmitterListener(() => repository.finalActionNotifications(params));
  }
  void actionVehicleNotification(ActionNotificationsPrams params) async {
    executeEmitterListener(() => repository.actionNotifications(params));
  }
}
