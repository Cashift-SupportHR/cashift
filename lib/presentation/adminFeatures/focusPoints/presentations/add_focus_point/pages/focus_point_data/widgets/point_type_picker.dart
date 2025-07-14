import 'package:flutter/material.dart';

import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';
import '../../../../../../../shared/components/text_field/build_text_field_item.dart';

class PointTypePicker extends BaseStatelessWidget {
  final String? initialValue;
  final List<FocusPointType> items;
  final Function(Item) onSelectItem;
  PointTypePicker(
      {Key? key,
      this.initialValue,
      required this.items,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: initialValue);
    return BuildTextFieldItem(
      title: strings.gate_type.split(':')[0],
      hintText: strings.select_gate_type,
      suffixIcon: Icons.keyboard_arrow_down,
      controller: controller,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            title: strings.select_gate_type,
            isScrollControlled: false,
            items: items
                .map((e) => Item(index: e.id!, value: e.name ?? ''))
                .toList(),
            onSelectItem: (item) async {
              controller.text = item.value;
              onSelectItem(item);
            });
      },
    );
  }
}
