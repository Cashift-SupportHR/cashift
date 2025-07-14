import 'package:flutter/material.dart';

import '../../../../../../utils/app_icons.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../common/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../domain/entities/order_status.dart';

class EmployeeOrderStatusPicker extends BaseStatelessWidget {
  final String? iconTitle;
  final String initialValue;
  final List<OrderStatus> items;
  final bool isSelectAll;
  final bool isSelectAllCheckBox;
  final Function(Item) onSelectItem;

  EmployeeOrderStatusPicker({
    Key? key,
    this.iconTitle,
    required this.initialValue,
    required this.items,
    this.isSelectAll = false,
    this.isSelectAllCheckBox = false,
    required this.onSelectItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      initValue: getName(),
      title: strings.employee_type,
      iconTitle: AppIcons.personOutline,
      hintText: strings.select_employee_type,
      //   itemsSelected: initialValue,
      setSearch: true,
      searchHint: strings.search,
      items: items
          .map((e) => Item(index: e.id ?? 0, value: e.name ?? ''))
          .toList(),
      onSelectItem: (item) async {
        print(item);
        onSelectItem(item);
      },
    );
  }

  String getName() {
    if (initialValue.isNotEmpty) {
      if (items.any((element) => element.id == int.parse(initialValue))) {
        return items
                .firstWhere((element) => element.id == int.parse(initialValue))
                .name ??
            '';
      }
      return '';
    }
    return '';
  }
}
