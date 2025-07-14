import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../common/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../domain/entities/company.dart';

class CompanyPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final String? initialValue;
  final List<Company> items;
  final Function(Item) onSelectItem;

  CompanyPicker(
      {Key? key,
      this.title,
      this.hintText,
      this.initialValue,
      required this.items,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('initialValue: ${initialValue}');
    return BottomSheetTextFieldRectangle(
      title: title ?? strings.company_name,
      hintText: hintText ?? strings.select_company_name,
      initValue: initialValue,
      isScrollControlled: true,
      setSearch: true,
      searchHint: strings.search_company_name,
      items: items.map((e) => Item(index: e.id ?? 0, value: e.companyName ?? ''))
          .toList(),
      onSelectItem: (item) async {
        print(items.length);
        onSelectItem(item);
      },
    );
  }
}
