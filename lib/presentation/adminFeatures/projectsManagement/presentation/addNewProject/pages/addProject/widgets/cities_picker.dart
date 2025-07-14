import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';


class CitiesPicker extends BaseStatelessWidget {
  final String? label;
  final String? hintText;
  final String? initialValue;
  final List<City> items;
  final Function(Item) onSelectItem;

  CitiesPicker(
      {Key? key,
      this.label,
      this.hintText,
      this.initialValue,
      required this.items,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      title: label ?? strings.city_name,
      initValue: initialValue,
      hintText: hintText ?? strings.select_city_name,
      isScrollControlled: true,
      setSearch: true,
      searchHint: strings.search_city_name,
      items: items.map((e) => Item(index: e.id ?? 0, value: e.cityName.toString()))
          .toList(),
      onSelectItem: (items) async {
        print(items);
        onSelectItem(items);
      },
    );
  }
}
