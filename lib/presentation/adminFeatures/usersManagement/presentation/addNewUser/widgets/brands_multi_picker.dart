import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/checkbox/multiple_choice_checkbox.dart';
import 'package:shiftapp/common/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../domain/entities/brand.dart';

class BrandsMultiPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final List<Brand>? initialValue;
  final List<Brand> items;
  final Function(List<CheckboxItem>) onSelectItem;

  BrandsMultiPicker(
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
      isMultiChoice: true,
      title: title ?? strings.brand_name,
      hintText: hintText ?? strings.select_brand_name,
      itemsSelected: initialValue?.map((e) => CheckboxItem(id: e.id, text: e.name, checked: true)).toList(),
      isScrollControlled: true,
      setSearch: true,
      searchHint: strings.search_brand_name,
      items: items.map((e) => Item(index: e.id ?? 0, value: e.name.toString()))
          .toList(),
      onMultiSelectItem: (items) async {
        print(items.length);
        onSelectItem(items);
      },
    );
  }
}
