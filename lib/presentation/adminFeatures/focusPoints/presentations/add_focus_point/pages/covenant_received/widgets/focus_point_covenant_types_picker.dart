import 'package:flutter/material.dart';

import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../domain/entities/index.dart';

class FocusPointCovenantTypesPicker extends BaseStatelessWidget {
  final String ? initValue;
  final TextEditingController controller;
  final List<Covenant> items;
  final Function(Item) onSelectItem;

  FocusPointCovenantTypesPicker(
      {Key? key, this.initValue, required this.controller, required this.items, required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(initValue != null) {
      controller.text=initValue!;
    }
    return BuildTextFieldItem(
      title: strings.covenant_type,
      hintText: strings.select_covenant_type,
      controller: controller,
      suffixIcon: Icons.keyboard_arrow_down,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            title: strings.select_covenant_type,
            isScrollControlled: false,
            items: items
                .map((e) => Item(index: e.id!, value: e.name ?? ''))
                .toList(),
            onSelectItem: (item) async {
              controller.text = item.value;
              onSelectItem(item);
            },
        );
      },
    );
  }
}
