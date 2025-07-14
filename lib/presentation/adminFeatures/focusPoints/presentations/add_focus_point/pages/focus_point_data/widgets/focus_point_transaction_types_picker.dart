import 'package:flutter/material.dart';

import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../../../shared/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';

class FocusPointTransactionTypesPicker extends BaseStatelessWidget {
  final String? initialValue;
  final List<FocusPointTransactionType> items;
  final Function(Item) onSelectItem;

  FocusPointTransactionTypesPicker(
      {Key? key,
      this.initialValue,
      required this.items,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return BottomSheetTextFieldRectangle(
      title: strings.point_type,
      hintText: strings.select_point_type,
      controller: controller,
      initValue: initialValue,
      items: items
          .map((e) => Item(index: e.id ?? 0, value: e.name.toString()))
          .toList(),
      onSelectItem: (item) async {
        controller.text = item.value;
        onSelectItem(item);
      },
    );
  }
}
