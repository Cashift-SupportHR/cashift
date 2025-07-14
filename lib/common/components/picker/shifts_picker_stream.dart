
import 'package:flutter/material.dart';

import '../../../presentation/adminFeatures/focusPoints/domain/entities/shifts_by_project.dart';
import '../../../presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/focus_point_data/widgets/projects_picker.dart';
import '../../../presentation/presentationUser/common/stream_data_state.dart';
import '../../../presentation/shared/models/common_list_item.dart';
import '../index.dart';

class ShiftsPickerStream extends BaseStatelessWidget {
  final String? initialValue;
  final StreamDataState<List<ShiftsByProject>?> shiftsStream;
  final TextEditingController controller;
  final Function(int id) onSelectItem;
  ShiftsPickerStream({super.key, required this.shiftsStream, required this.controller, this.initialValue, required this.onSelectItem});

  @override
  Widget build(BuildContext context) {

      return StreamDataStateWidget<List<ShiftsByProject>?>(
          stream: shiftsStream,
          builder: (context, data) {
            return BottomSheetTextFieldRectangle(
              title: strings.working_period,
              hintText: strings.select_working_period,
              controller: controller,
              initValue: initialValue,
              items: ShiftsByProject.toItemsListPicker(data ?? []),
              onSelectItem: (item) {
                controller.text = item.value;
                onSelectItem(item.index);
              },
            );
          });
  }
}
