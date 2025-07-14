import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/index.dart';

import '../../../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../../../utils/app_utils.dart';
import '../../../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../data/models/add_attendance_notifications_prams.dart';
import '../../../../domain/entities/AttendanceNotifiType.dart';

class AddAttendanceAndDepartureNotificationsScreen extends BaseStatelessWidget {
  List<AttendanceNotifiType> attendanceNotifiType;
  final Function(
      AddAttendanceNotificationsPrams addAttendanceNotificationsPrams) onAdd;
  AddAttendanceAndDepartureNotificationsScreen(
      {required this.onAdd, required this.attendanceNotifiType});

  TextEditingController descriptionController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? attendanceNotifiTypeId;
  String? fromTime;
  String? toTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RowButtons(
        onCancel: () {
          Navigator.pop(context);
        },
        onSave: () async {
          if (_formKey.currentState!.validate()) {
            String date = await DateFormatter.formatDateString(
                dayController.text,
                DateFormatter.DAY_MONTH_YEAR,
                DateFormatter.TIME_STAMP,local: "en");
            onAdd(AddAttendanceNotificationsPrams(
                attNotifiFrom: fromTime,
                attNotifiTo: toTime,
                id: 0,
                discription: descriptionController.text,
                reuestDate: date,
                attendanceNotifiTypeId: attendanceNotifiTypeId));
          }
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BottomSheetTextFieldRectangle(
                title: strings.type_request,
                hintText: strings.type_request,
                items: attendanceNotifiType
                    .map((e) => Item(
                          index: e.id?.toInt() ?? 0,
                          value: e.name ?? "",
                        ))
                    .toList(),
                onSelectItem: (item) async {
                  attendanceNotifiTypeId = item.index;
                },
              ),
              BuildTextFieldItem(
                title: strings.description,
                minLines: 5,
                keyboardType: TextInputType.text,
                hintText: strings.description,
                controller: descriptionController,
              ),
              DateTextFieldPicker(
                  title: strings.date_request,
                  hintText: strings.select_day,
                  pattern: DateFormatter.DAY_MONTH_YEAR,
                  controller: dayController),
              Text(
                strings.leave_period,
                style: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
              ),
              SizedBox(
                height: 10,
              ),
              fromToTime(context),
            ],
          ),
        ),
      ),
    );
  }

  fromToTime(context) {
    return Row(
      children: [
        Expanded(
          child: BuildTextFieldItem(
            title: strings.from,
            hintText: strings.from,
            controller: fromController,
            onTap: () => onShowTimeFromDayPicker(context),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: BuildTextFieldItem(
            title: strings.too,
            hintText: strings.too,
            controller: toController,
            onTap: () => onShowTimeToDayPicker(context),
          ),
        ),
      ],
    );
  }

  onShowTimeFromDayPicker(
    context,
  ) async {
    AppUtils.showTimeDayPicker(context, initialTime: TimeOfDay.now(),
        onConfirm: (value) {
      print(value.toString());
      fromTime = '${value.hour}:${value.minute}';
      fromController.text = value.format(context);
    });
  }

  onShowTimeToDayPicker(
    context,
  ) async {
    AppUtils.showTimeDayPicker(context, initialTime: TimeOfDay.now(),
        onConfirm: (value) {
      print(value.toString());
      toTime = '${value.hour}:${value.minute}';
      toController.text = value.format(context);
    });
  }
}
