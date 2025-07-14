import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/shared/pages/terms_and_conditions_screen.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/index.dart';

import '../../../../../../../common/components/text_field/text_field_search.dart';
import '../../../../../salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../domain/entities/AttendanceNotifiAction.dart';
import '../../add/screen/add_attendance_and_departure_notifications_page.dart';
import 'attendance_and_departure_notifications_screen.dart';
import '../cubit/attendance_and_departure_notifications_cubit.dart';

class AttendanceAndDepartureNotificationsPage extends BaseBlocWidget<
    Initialized<List<AttendanceNotifiAction>>, AttendanceAndDepartureNotificationsCubit> {
  String search = '';

  @override
  String? title(BuildContext context) {
    return strings.attendance_and_departure_notifications;
  }

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchAttendance( );
   // controller.clear();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          // TextFieldSearch(
          //   margin: const EdgeInsets.only(left: 8, right: 8, top: 12),
          //   onChanged: (value) {
          //     // bloc.searchByText(value);
          //   },
          // ),
          TitleAndAddNewRequest(
            title: strings.attendance_and_departure_notifications,
            textButton: strings.add_request,
            onTap: () {
              AddAttendanceAndDepartureNotificationsPage.push(context,  onSuccess: () {
                print('isTrue');
                loadInitialData(context);
              });
         
            },
          ),
          Expanded(
            child: buildConsumer(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<AttendanceNotifiAction>> state) {
    return AttendanceAndDepartureNotificationsScreen(data: state.data??[],);
  }
}
