import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';

class PeriodOrderPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final String? initialValue;
  final List<PeriodOrder> items;
  final Function(Item) onSelectItem;

  PeriodOrderPicker(
      {Key? key,
      this.title,
      this.hintText,
      this.initialValue,
      required this.items,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      title: title ?? strings.period_order,
      hintText: hintText ?? strings.select_period_order,
      initValue: initialValue,
      isScrollControlled: true,
      setSearch: true,
      searchHint: strings.search_period,
      items: items
          .map((e) => Item(index: e.id ?? 0, value: e.name.toString()))
          .toList(),
      onSelectItem: (items) async {
        print(items);
        onSelectItem(items);
      },
    );
  }
}
