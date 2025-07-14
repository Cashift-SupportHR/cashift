import '../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../presentationUser/attendance/facerecognation/index.dart'
    show BuildContext, SizedBox;
import '../index.dart'
    show BaseStatelessWidget, Expanded, Row, TextEditingController, Widget;
import 'date_time_text_field.dart';

class DateTimeTextFields extends BaseStatelessWidget {
  final TextEditingController controllerDateFrom;
  final TextEditingController controllerTimeFrom;
  final Function(String)? onDateTimeChanged;

  DateTimeTextFields({
    super.key,
    required this.controllerDateFrom,
    required this.controllerTimeFrom,
    this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: DateTimeTextField(
            title: strings.date_from,
            controller: controllerDateFrom,
            onConfirmDate:
                (onDateTimeChanged != null)
                    ? (date) {
                      onDateTimeChanged?.call(
                        getDateTimeFromString(
                          controllerDateFrom.text,
                          controllerTimeFrom.text,
                        ),
                      );
                    }
                    : null,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: DateTimeTextField(
            title: strings.hour,
            isDate: false,
            controller: controllerTimeFrom,
            onConfirmTime:
                (onDateTimeChanged != null)
                    ? (time) {
                      onDateTimeChanged?.call(
                        getDateTimeFromString(
                          controllerDateFrom.text,
                          controllerTimeFrom.text,
                        ),
                      );
                    }
                    : null,
          ),
        ),
      ],
    );
  }

  String getDateTimeFromString(String date, String time) {
    print('getDateTimeFromString $date$time');
    // remove any non-digit characters except spaces and dashes
    date = date.replaceAll(' ', '');
    print('getDateTimeFromString $date$time');
    DateTime dateTime = DateFormatter.parseDateAndTimeOfDay('${date} $time');
    return dateTime.toIso8601String();
  }
}
