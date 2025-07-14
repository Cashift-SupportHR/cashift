import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/checkbox/multiple_choice_checkbox.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item.dart';

import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/dropdown_filed.dart';
import '../../../../../shared/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../focusPoints/domain/entities/focus_point_project.dart';

class ProjectsMultiPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final String? iconTitle;
  final List<CommonListItem>? initialValue;
  final List<CommonListItem> items;
  final Function(List<CheckboxItem>) onMultiSelectItem;
  final Function(Item)? onSelectItem;
  final bool isSelectAll;
  final bool isSelectAllCheckBox;
  final bool isMultiChoice;

  ProjectsMultiPicker(
      {Key? key,
      this.iconTitle,
      this.initialValue,
      required this.items,
      required this.onMultiSelectItem,
      this.onSelectItem,
      this.isSelectAll = false,
      this.isSelectAllCheckBox = false,
      this.title,
      this.hintText,
      this.isMultiChoice = true
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      isMultiChoice: isMultiChoice,
      title: title ?? strings.projects,
      hintText: hintText ??  strings.select_project_name,
      iconTitle: iconTitle,
      itemsSelected: isSelectAll ? items.map((e) => CheckboxItem(id: e.id, text: e.name ?? '', checked: true)).toList() : initialValue?.map((e) => CheckboxItem(id: e.id, text: e.name ?? '', checked: true)).toList() ?? [],
      isScrollControlled: true,
      setSearch: true,
      searchHint: strings.search_project_name,
      isSelectAll: isSelectAll,
      isSelectAllCheckBox: isSelectAllCheckBox,
      // initValue: initialValue?.map((e) => CheckboxItem(id: e.id, text: e.name ?? '', checked: true)).toList() ?? [],
      items: items.map((e) => Item(index: e.id ?? 0, value: e.name ?? ''))
          .toList(),
      onMultiSelectItem: (items) async {
        print(items.length);
        onMultiSelectItem(items);
      },
      onSelectItem: (item) {
        print(item);
        onSelectItem!(item);
      },
    );
  }
}
