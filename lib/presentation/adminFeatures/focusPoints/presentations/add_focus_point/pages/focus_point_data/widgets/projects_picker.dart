import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item.dart';

import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../../../shared/components/text_field/build_text_field_item.dart';

class ProjectsPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final String? initialValue;
  final List<CommonListItem> items;
  final Function(Item) onSelectItem;
  final TextEditingController? controller;

  ProjectsPicker({Key? key, this.title, this.hintText, this.initialValue, required this.items, required this.onSelectItem, this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = this.controller ?? TextEditingController(text: initialValue);
    // controller.text = initialValue ?? '';
    return BuildTextFieldItem(
      title: title ?? strings.select_project,
      hintText: hintText ?? strings.select_project,
      suffixIcon: Icons.keyboard_arrow_down,
      controller: controller,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            title: strings.select_project,
            setSearch: true,
            searchHint: strings.search,
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
