import 'package:get/get.dart';
import 'package:shiftapp/extensions/extensions.dart';

import '../../../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../../presentationUser/attendance/facerecognation/index.dart';
import '../../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../shared/components/buttons/row_buttons.dart';
import '../../../../../../shared/components/helper_widgets.dart';
import '../../../../../../shared/components/text_field/date_time_text_fields.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';

class SearchVehicleCameraSheet extends BaseStatelessWidget {
  final VehicleVideoParams params;
  final Function(VehicleVideoParams) onSearch;
  SearchVehicleCameraSheet({super.key, required this.params, required this.onSearch});


  static void show(BuildContext context, {required VehicleVideoParams params, required Function(VehicleVideoParams) onSearch}) {
    showAppModalBottomSheet(
      context: context,
      title: context.getStrings().start_video,
      isScrollControlled: false,
      child: SearchVehicleCameraSheet(
        params: params,
        onSearch: (VehicleVideoParams params) {
          Navigator.pop(context);
          onSearch(params);
        },
      ),
    );
  }



  TextEditingController controllerDateFrom = TextEditingController();
  TextEditingController controllerTimeFrom = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _initDate();
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.select_video_date,
              style: kTextMedium.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 20),
            DateTimeTextFields(
              controllerDateFrom: controllerDateFrom,
              controllerTimeFrom: controllerTimeFrom,
            ),
            const SizedBox(height: 30),
            RowButtons(
              textSaveButton: strings.search,
              textCancelButton: strings.cancel,
              margin: EdgeInsets.zero,
              onSave: () {
                if (_key.currentState?.validate() ?? false) {
                  params.beginTime = getDateTimeFromString(controllerDateFrom.text, controllerTimeFrom.text);
                  onSearch(params);
                }
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  String getDateTimeFromString(String date, String time) {
    print('getDateTimeFromString $date $time');
    DateTime dateTime = DateFormatter.parseDateAndTimeOfDay(
      '$date $time',
    );
    return dateTime.toIso8601String();
  }

  void _initDate() {
    if (params.beginTime.isNotNullOrEmpty()) {
      DateTime dateTime = DateFormatter.dateFromString(
        params.beginTime!,
        pattern: DateFormatter.TIME_STAMP,
      );
      controllerDateFrom.text = DateFormatter.formatDate(
        dateTime,
        DateFormatter.DAY_MONTH_YEAR,
        local: "en",
      );
      controllerTimeFrom.text = TimeOfDay(
        hour: dateTime.hour,
        minute: dateTime.minute,
      ).format(Get.context!);
    }
  }
}
