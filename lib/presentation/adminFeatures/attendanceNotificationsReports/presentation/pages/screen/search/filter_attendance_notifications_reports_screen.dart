import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';

import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../common/components/index.dart';
import '../../../../../employees/domain/entities/project_employee.dart';
import '../../../../../employees/domain/entities/shift_employee.dart';
import '../../../../data/models/emp_attendance_rports_prams.dart';

class FilterAttendanceNotficationScreen extends BaseStatelessWidget {
  final Function(EmpAttendanceRportsPrams empAttendanceRportsPrams) onSearch;
  final Function(int projectId) onFetchShift;
  StreamStateInitial<List<ShiftEmployee>?> shiftsStream;
  List<ProjectEmployee> data;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  int? projectId;
  int workTime = 0;

  FilterAttendanceNotficationScreen(
      {super.key,
      required this.data,
      required this.onFetchShift,
      required this.onSearch,
      required this.shiftsStream});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dateWidget(),
                projectWidget(),
                workTimeWidget(),
                RowButtons(
                  textSaveButton: strings.filter,
                  onCancel: () => Navigator.pop(context),
                  onSave: () {
                    if (_formKey.currentState!.validate()) {
                      onSearch(EmpAttendanceRportsPrams(
                          endShiftDate: toController.text,
                          projectId: projectId,
                          shiftId: workTime,
                          startShiftDate: fromController.text));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  dateWidget() {
    return Row(
      children: [
        Expanded(
          child: DateTextFieldPicker(
            title: strings.from,
            controller: fromController,
            pattern: DateFormatter.TIME_STAMP,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: DateTextFieldPicker(
            title: strings.too,
            pattern: DateFormatter.TIME_STAMP,
            controller: toController,
          ),
        ),
      ],
    );
  }

  projectWidget() {
    return BottomSheetTextFieldRectangle(
      title: strings.project,

      hintText:
          strings.select_project, // initValue: dataDetails?.shiftName ?? '',
      isScrollControlled: true,
      setSearch: true,
      items:
          data.map((e) => Item(index: e.id ?? 0, value: e.name ?? "")).toList(),
      onSelectItem: (items) async {
        projectId = items.index;
        onFetchShift(items.index);
      },
    );
  }

  workTimeWidget() {
    return StreamBuilder<List<ShiftEmployee>?>(
        stream: shiftsStream.stream,
        builder: (context, snapshot) {
          return snapshot.data == null || snapshot.hasError
              ? SizedBox()
              : BottomSheetTextFieldRectangle(
                  title: strings.working_time,
                  validator: (value) => null,
                  hintText: strings
                      .select_working_time, // initValue: dataDetails?.shiftName ?? '',
                  isScrollControlled: true,

                  items: snapshot.data!
                      .map((e) =>
                          Item(index: e.shiftId ?? 0, value: e.shiftName ?? ""))
                      .toList(),
                  onSelectItem: (items) async {
                    workTime = items.index;
                  },
                );
        });
  }
}
