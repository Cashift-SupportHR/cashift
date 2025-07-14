import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/bottom_sheet/list_picker_widget.dart';
import 'package:shiftapp/common/components/material_text_field.dart';

import '../base/base_stateless_widget.dart';
import '../checkbox/multiple_choice_checkbox.dart';
import '../dropdown/dropdown_filed.dart';

class BottomSheetTextField extends BaseStatelessWidget {
  final String? title;
  final String? initValue;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final Widget? icon;
  final List<Item> items;
  final Function(Item position)? onSelectItem;
  final String? searchHint;
  final bool? setSearch;
  final Widget Function(BuildContext context, Item item)? itemBuilder;
  final InputDecoration? inputDecoration;

  final TextStyle? style;
  final bool isScrollControlled;
  final bool? isMultiChoice;
  final Function(List<CheckboxItem>)? onMultiSelectItem;

  BottomSheetTextField(
      {required this.items,
      this.onSelectItem,
      this.searchHint,
      this.setSearch,
      this.itemBuilder,
      this.icon,
      this.inputDecoration,
      this.validator,
      this.title,
      this.hint,
      this.initValue,
      this.style,
      this.isScrollControlled = true,
      this.isMultiChoice,
      this.onMultiSelectItem});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<CheckboxItem> itemsSelected = [];
    if (initValue != null) {
      controller.text = initValue!;
    }
    return MaterialTextField(
      style: style,
      inputDecoration: inputDecoration != null
          ? inputDecoration!.copyWith(
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: kLoadSvgIcon('arrow_down'),
              ),
              suffixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 40),
              hintStyle: kTextRegular.copyWith(fontSize: 13, color: kBlueGrey),
              hintText: hint)
          : kCommonDecoration(
              icon: icon,
              endIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: kLoadSvgIcon('arrow_down'),
              ),
              hint: hint),
      controller: controller,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            title: title ?? '',
            items: items,
            itemsSelected: itemsSelected,
            searchHint: searchHint,
            itemBuilder: itemBuilder,
            isScrollControlled: isScrollControlled,
            setSearch: setSearch,
            isMultiChoice: isMultiChoice,
            onMultiSelectItem: (items) {
              itemsSelected = items;
              controller.text = items.map((e) => e.text).join(', ');
              onMultiSelectItem!(items);
            },
            onSelectItem: (item) {
              controller.text = item.value;
              onSelectItem!(item);
            });
      },
      validator: validator,
      readOnly: true,
    );
  }
}
