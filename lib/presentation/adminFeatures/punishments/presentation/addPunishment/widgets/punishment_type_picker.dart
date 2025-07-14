
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../domain/entities/punishment_type.dart';

class PunishmentTypePicker extends BaseStatelessWidget {
  final String? initialValue;
  final List<PunishmentType> items;
  final Function(Item) onSelectItem;

  PunishmentTypePicker(
      {Key? key,
        this.initialValue,
        required this.items,
        required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      title: strings.punishment_type,
      hintText: strings.select_punishment_type,
      isScrollControlled: true,
      setSearch: true,
      initValue: initialValue,
      items: items.map((e) => Item(index: e.id ?? 0, value: e.name.toString()))
          .toList(),
      onSelectItem: (items) async {
        print(items);
        onSelectItem(items);
      },
    );
  }
}
