import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/checkbox/multiple_choice_checkbox.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/stream_state_widget_v2.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../common/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../focusPoints/domain/entities/shifts_by_project.dart';
import '../../../domain/entities/shift_by_list_project_id.dart';

class ShiftsMultiPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final List<ShiftsByProject>? initialValue;
  final StreamStateInitial<List<ShiftsByProject>?> shiftsStream;
  final Function(List<CheckboxItem>) onSelectItem;

  ShiftsMultiPicker(
      {Key? key,
      this.initialValue,
      required this.shiftsStream,
      required this.onSelectItem,
      this.title,
      this.hintText,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamStateWidgetV2(
        stream: shiftsStream,
        isBottomSheetData: true,
        builder: (context, data) {
        return BottomSheetTextFieldRectangle(
          isMultiChoice: true,
          title: title ?? strings.shifts,
          hintText: hintText ?? strings.select_shift_type,
          itemsSelected: (data == null || data.isEmpty) ? [] : initialValue?.map((e) =>
              CheckboxItem(id: e.id, text: e.shiftName, checked: true)).toList(),
          isScrollControlled: true,
          setSearch: true,
          searchHint: strings.search_shift_type,
          items: data?.map((e) => Item(index: e.id ?? 0, value: e.shiftName ?? ''))
              .toList() ?? [],
          onMultiSelectItem: (items) async {
            print(items.length);
            onSelectItem(items);
          },
        );
      }
    );
  }
}
