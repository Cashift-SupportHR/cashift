import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';

class JobsPicker extends BaseStatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final String? initialValue;
  final List<Job> items;
  final Function(Item) onSelectItem;

  JobsPicker(
      {Key? key,
      this.controller,
      this.title,
      this.hintText,
      this.initialValue,
      required this.items,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      controller: controller,
      title: title ?? strings.occupation,
      hintText: hintText ?? strings.select_occupation,
      initValue: initialValue,
      isScrollControlled: true,
      setSearch: true,
      searchHint: strings.search_occupation,
      items: items
          .map((e) => Item(index: e.id ?? 0, value: e.jobName ?? ''))
          .toList(),
      onSelectItem: (items) async {
        print(items);
        onSelectItem(items);
      },
    );
  }
}
