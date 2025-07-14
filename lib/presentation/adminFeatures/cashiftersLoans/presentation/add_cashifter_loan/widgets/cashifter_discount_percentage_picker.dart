import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../common/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../../shared/models/common_list_item_dto.dart';

class CashifterDiscountPercentagePicker extends BaseStatelessWidget {
  final String? initialValue;
  final List<CommonListItemDto> items;
  final Function(Item) onSelectItem;

  CashifterDiscountPercentagePicker(
      {Key? key,
      this.initialValue,
      required this.items,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomSheetTextFieldRectangle(
      title: strings.discount_percentage,
      hintText: strings.select_discount_percentage,
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
