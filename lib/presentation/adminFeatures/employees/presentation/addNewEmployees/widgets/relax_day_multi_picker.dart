import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/checkbox/multiple_choice_checkbox.dart';

import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/dropdown_filed.dart';
import '../../../../../shared/components/text_field/bottom_sheet_text_field_rectangle.dart';
 import '../../../domain/entities/DayRelax.dart';

class RelaxDayMultiPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final String? iconTitle;
  final List<DayRelax>? initialValue;
  final List<DayRelax> items;
  final Function(List<CheckboxItem>) onMultiSelectItem;
  final bool isSelectAll;
  final bool isSelectAllCheckBox;
  final TextEditingController controller;
  RelaxDayMultiPicker({
    Key? key,
    this.iconTitle,
    this.initialValue,
    required this.items,
    required this.controller,
    required this.onMultiSelectItem,
    this.isSelectAll = false,
    this.isSelectAllCheckBox = false,
    this.title,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      isMultiChoice: true,
      title: title ?? strings.rest_day,
      hintText: hintText ?? strings.rest_day,
      iconTitle: iconTitle,
      controller: controller,
      itemsSelected: isSelectAll
          ? items.map((e) => CheckboxItem(id: int.parse(e.dayValue.toString()), text: e.name ?? '', checked: true)).toList()
          : initialValue?.map((e) => CheckboxItem(id: int.parse(e.dayValue.toString()), text: e.name ?? '', checked: true)).toList() ?? [],
      isScrollControlled: true,
      setSearch: false,
      searchHint: strings.search_project_name,
      isSelectAll: isSelectAll,
      isSelectAllCheckBox: isSelectAllCheckBox,
      items: items.map((e) => Item(value: e.name ?? '', index: int.parse(e.dayValue.toString()))).toList(),
      onMultiSelectItem: (items) async {
        print(items.length);
        onMultiSelectItem(items);
      },
    );
  }
}
