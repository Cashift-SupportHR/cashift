import 'package:flutter/material.dart';

import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';

class EmployeePicker extends BaseStatelessWidget {
  final String? initialValue;
  final List<EmployeeType> items;
  final Function(Item) onSelectItem;

  EmployeePicker({Key? key, this.initialValue, required this.items, required this.onSelectItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: initialValue);
    return BuildTextFieldItem(
      title: strings.employee_type,
      hintText: strings.select_employee_type,
      suffixIcon: Icons.keyboard_arrow_down,
      controller: controller,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            title: strings.select_employee_type,
            isScrollControlled: false,
            items: items.map((e) => Item(index: e.id!, value: e.name ?? ''))
                .toList(),
            onSelectItem: (item) async {
              controller.text = item.value;
              onSelectItem(item);
            });
      },
    );
  }
}
