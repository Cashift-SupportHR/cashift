import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';

class SeasonsPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final String? initialValue;
  final List<TimePrice> items;
  final Function(Item) onSelectItem;

  SeasonsPicker(
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
      title: title ?? '',
      hintText: hintText ?? '',
      initValue: initialValue,
      isScrollControlled: true,
      setSearch: true,
      searchHint: strings.search,
      items: items
          .map((e) => Item(index: e.id ?? 0, value: e.name ?? ''))
          .toList(),
      onSelectItem: (items) async {
        print(items);
        onSelectItem(items);
      },
    );
  }
}
