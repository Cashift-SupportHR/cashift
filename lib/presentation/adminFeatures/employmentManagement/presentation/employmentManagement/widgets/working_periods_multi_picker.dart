import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/checkbox/multiple_choice_checkbox.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../common/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../projectsManagement/domain/entities/working_period.dart';

class WorkingPeriodsMultiPicker extends BaseStatelessWidget {
  final String? iconTitle;
  final List<WorkingPeriod> initialValue;
  final List<WorkingPeriod> items;
  final Function(List<CheckboxItem>) onMultiSelectItem;
  final bool isSelectAll;
  final bool isSelectAllCheckBox;

  WorkingPeriodsMultiPicker(
      {Key? key,
      this.iconTitle,
      required this.initialValue,
      required this.items,
      required this.onMultiSelectItem,
        this.isSelectAll = false,
        this.isSelectAllCheckBox = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      isMultiChoice: true,
      title: strings.working_period,
      iconTitle: iconTitle,
      hintText: strings.select_working_period,
      itemsSelected: initialValue.map((e) => CheckboxItem(id: e.id, text: e.name ?? '', checked: true)).toList() ,
      isScrollControlled: true,
      setSearch: true,
      isSelectAll: isSelectAll,
      isSelectAllCheckBox: isSelectAllCheckBox,
      searchHint: strings.search_shift_type,
      items: items.map((e) => Item(index: e.id ?? 0, value: e.name ?? ''))
          .toList(),
      onMultiSelectItem: (items) async {
        print(items.length);
        onMultiSelectItem(items);
      },
    );
  }
}
