import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../usersManagement/domain/entities/company.dart';

class CompanyProjectPicker extends BaseStatelessWidget {
  final String? label;
  final String? hintText;
  final String? initialValue;
  final List<Company> items;
  final Function(Item) onSelectItem;

  CompanyProjectPicker({Key? key, this.label, this.hintText, this.initialValue, required this.items, required this.onSelectItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      title: label ?? strings.brand_name,
      hintText: hintText ?? strings.select_brand_name,
      isScrollControlled: true,
      setSearch: true,
      initValue: initialValue,
      searchHint: strings.search,
      items: items.map((e) => Item(index: e.id ?? 0, value: e.companyName.toString())).toList(),
      onSelectItem: (items) async {
        print(items);
        onSelectItem(items);
      },
    );
  }
}
