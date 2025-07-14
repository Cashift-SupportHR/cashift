import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/shared/pages/terms_and_conditions_screen.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/index.dart';
import '../../../../../../../core/services/routes.dart';
import '../../../../domain/entities/AttendanceNotifiType.dart';
import '../cubit/add_attendance_and_departure_notifications_cubit.dart';
import 'add_attendance_and_departure_notifications_screen.dart';

class AddAttendanceAndDepartureNotificationsPage extends BaseBlocWidget<
    Initialized<List<AttendanceNotifiType>>,
    AddAttendanceAndDepartureNotificationsCubit> {
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAttendance();
  }

  @override
  String? title(BuildContext context) {
    return strings.add_request;
  }

  static push(
    BuildContext context, {
    required Function() onSuccess,
  }) async {
    final result = await Navigator.pushNamed(
      context,
      Routes.addAttendanceAndDepartureNotificationsPage,
    );
    if (result is bool && result) {
      print('push: $result');
      onSuccess();
    }
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<AttendanceNotifiType>> state) {
    return AddAttendanceAndDepartureNotificationsScreen(
      attendanceNotifiType: state.data ?? [],
      onAdd: (addAttendanceNotificationsPrams) {
        print("---------------------");
        print(addAttendanceNotificationsPrams.attendanceNotifiTypeId);
        print(addAttendanceNotificationsPrams.discription);
        print(addAttendanceNotificationsPrams.reuestDate);
        print(addAttendanceNotificationsPrams.attNotifiTo);
        print("iiiu");
        bloc.addAttendance(
            addAttendanceNotificationsPrams: addAttendanceNotificationsPrams);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
  }
}
