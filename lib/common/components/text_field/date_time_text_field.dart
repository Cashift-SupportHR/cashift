import '../../domain/entities/shared/date_formatter.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_utils.dart';
import '../../../presentation/presentationUser/attendance/facerecognation/index.dart';
import '../base/base_stateless_widget.dart';
import 'build_text_field_item.dart';

class DateTimeTextField extends BaseStatelessWidget {
  final String? title;
  final DateTime? firstDate;
  final TextEditingController? controller;
  final bool isDate;
  final Function(DateTime)? onConfirmDate;
  final Function(TimeOfDay)? onConfirmTime;

  DateTimeTextField(
      {super.key, this.title, this.firstDate, this.controller, this.isDate = true, this.onConfirmDate, this.onConfirmTime});

  @override
  Widget build(BuildContext context) {
    return BuildTextFieldItem(
      heightSizedBox: 2,
      title: title,
      prefixIcon: isDate ? AppIcons.calendarOutline : AppIcons.clockOutline,
      controller: controller,
      onTap: () async {
        if (isDate) {
          await AppUtils.showDateTimePicker(context,
            firstDate: firstDate,
            initialDate: firstDate ?? DateTime.now(),
            onConfirm: (DateTime date) {
              controller?.text = DateFormatter.formatDate(
                  date, DateFormatter.DAY_MONTH_YEAR,
                  local: "en");
              onConfirmDate?.call(date);
            },
          );
        } else {
          await AppUtils.showTimeDayPicker(
            context,
            onConfirm: (TimeOfDay time) {
              controller?.text = time.format(context);
              onConfirmTime?.call(time);
            },
          );
        }
      },
    );
  }
}