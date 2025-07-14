import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../common/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../../shared/models/common_list_item_dto.dart';

class CashifterLoanTypePicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final String? initialValue;
  final List<CommonListItemDto> items;
  final Function(Item) onSelectItem;

  CashifterLoanTypePicker(
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
      title: title ?? strings.loan_type,
      hintText: hintText ?? strings.select_loan_type,
      initValue: initialValue,
      isScrollControlled: true,
      setSearch: true,
      items: items.map((e) => Item(index: e.id ?? 0, value: e.name ?? ''))
          .toList(),
      onSelectItem: (item) async {
        print(items.length);
        onSelectItem(item);
      },
    );
  }
}
