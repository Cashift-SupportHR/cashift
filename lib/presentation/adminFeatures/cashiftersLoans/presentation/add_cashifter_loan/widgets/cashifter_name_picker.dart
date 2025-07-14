import 'package:flutter/material.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../common/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../../shared/models/common_list_item_dto.dart';

class CashifterNamePicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final String? initialValue;
  final StreamStateInitial<List<CommonListItemDto>>? cashiftersStream;
  final Function(Item) onSelectItem;

  CashifterNamePicker(
      {Key? key,
      this.title,
      this.hintText,
      this.initialValue,
      required this.cashiftersStream,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommonListItemDto>>(
      stream: cashiftersStream?.stream,
      builder: (context, snapshot) {
        return BottomSheetTextFieldRectangle(
          title: title ?? strings.cashifter_name,
          hintText: hintText ?? strings.select_cashifter,
          initValue: initialValue,
          isScrollControlled: true,
          setSearch: true,
          items: snapshot.data?.map((e) => Item(index: e.id ?? 0, value: e.name ?? ''))
              .toList() ??
              [],
          onSelectItem: (item) async {
         //   print(items.length);
            onSelectItem(item);
          },
        );
      }
    );
  }
}
