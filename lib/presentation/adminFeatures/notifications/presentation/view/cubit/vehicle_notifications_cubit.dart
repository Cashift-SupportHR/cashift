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
class VehicleNotificationsCubit extends BaseCubit {
  final NotificationsRepository repository;

  VehicleNotificationsCubit(this.repository);

  StreamDataStateInitial<List<VehicleNotification>?>
  vehicleNotificationsStream = StreamDataStateInitial();
  List<VehicleNotification> vehicleNotifications = [];

  void fetchInitialData() async {
    executeBuilder(
      () => repository.fetchTypeVehicleNotifications(),
      onSuccess: (data) {
        if (data.isNotEmpty) {
          fetchVehicleNotification(data[0].id!);
        }
        emit(Initialized<List<CommonListItem>>(data: data));
      },
    );
  }

  void fetchVehicleNotification(int type) async {
    try {
      vehicleNotificationsStream.start();
      final data = await repository.fetchVehicleNotifications(type);
      vehicleNotifications = data;
      vehicleNotificationsStream.setData(data);
    } catch (e) {
      vehicleNotificationsStream.setError(e);
    }
  }



  void searchByText(String value) {
    try {
      List<VehicleNotification> usersSearched = vehicleNotifications;
      if (value.isNotEmpty) {
        usersSearched = vehicleNotifications
            .where((data) =>
        (data.id != null && data.id!.toString().contains(value)) ||
            (data.description != null && data.description!.contains(value)) ||
            (data.vehiclePlateNumber != null && data.vehiclePlateNumber!.contains(value)) ||
            (data.employee != null && data.employee!.contains(value)) ||
            (data.finalAction != null && data.finalAction!.contains(value)) ||
            (data.action != null && data.action!.contains(value)))
            .toList();
      }
      vehicleNotificationsStream.setData(usersSearched);
    } on Exception catch (e) {
      print(e);
      vehicleNotificationsStream.setError(e);
    }
  }

  void finalActionVehicleNotification(ActionNotificationsPrams params) async {
    executeEmitterListener(() => repository.finalActionNotifications(params));
  }
  void actionVehicleNotification(ActionNotificationsPrams params) async {
    executeEmitterListener(() => repository.actionNotifications(params));
  }
}
