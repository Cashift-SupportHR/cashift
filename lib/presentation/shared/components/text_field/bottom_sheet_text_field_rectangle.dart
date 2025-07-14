import 'package:flutter/material.dart';

import 'build_text_field_item.dart';
import '../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../common/components/checkbox/multiple_choice_checkbox.dart';
import '../dropdown_filed.dart';

///  Created by harbey on 6/5/2023.
class BottomSheetTextFieldRectangle extends StatelessWidget {
  final String? title;
  final String? initValue;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final List<Item> items;
  final Function(Item position)? onSelectItem;
  final String? searchHint;
  final bool? setSearch;
  final Widget Function(BuildContext context, Item item)? itemBuilder;
  final bool isScrollControlled;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final bool? isMultiChoice;
  final List<CheckboxItem>? itemsSelected;
  final Function(List<CheckboxItem>)? onMultiSelectItem;
  final String? iconTitle;
  final bool isSelectAll;
  final bool isSelectAllCheckBox;

  BottomSheetTextFieldRectangle(
      {required this.items,
      this.onSelectItem,
      this.searchHint,
      this.setSearch,
      this.itemBuilder,
      this.title,
      this.hintText,
      this.initValue,
      this.isScrollControlled = false,
      this.controller,
      this.suffixIcon,
      this.validator,
      this.isMultiChoice,
      this.onMultiSelectItem,
      this.itemsSelected,
      this.iconTitle,
      this.isSelectAll = false,
      this.isSelectAllCheckBox = false});

  @override
  Widget build(BuildContext context) {
    List<CheckboxItem> itemsSelected = this.itemsSelected ?? [];
    TextEditingController controller =
        this.controller ?? TextEditingController();
    controller.text = controller.text.isNotEmpty ? controller.text : initValue ??
        (isFoundItem(itemsSelected)
            ? itemsSelected.map((e) => e.text).join(', ')
            : '');
    return BuildTextFieldItem(
      title: title,
      hintText: hintText,
      iconTitle: iconTitle,
      suffixIcon: suffixIcon ?? Icons.keyboard_arrow_down,
      controller: controller,
      validator: validator,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            title: hintText ?? '',
            isScrollControlled: isScrollControlled,
            items: items,
            itemsSelected: isFoundItem(itemsSelected) ? itemsSelected : [],
            itemBuilder: itemBuilder,
            searchHint: searchHint,
            setSearch: setSearch,
            isMultiChoice: isMultiChoice,
            isSelectAll: isSelectAll,
            isSelectAllCheckBox: isSelectAllCheckBox,
            onMultiSelectItem: (items) {
              itemsSelected = items;
              if (itemsSelected.isNotEmpty) {
                controller?.text =  itemsSelected.map((e) => e.text).join(', ');
                if (itemsSelected.first.id == 0) {
                  onMultiSelectByName(itemsSelected);
                } else {
                  onMultiSelectItem!(itemsSelected);
                }
              } else {
                controller?.text = '';
                onMultiSelectItem!(itemsSelected);
              }
            },
            onSelectItem: (item) async {
              controller?.text = item.value;
              onSelectItem!(item);
            });
      },
    );
  }

  bool isFoundItem(List<CheckboxItem> itemsSelected) {
    if (items.isNotEmpty &&items.first.index == 0) {
      for (var item in items) {
        for (var selected in itemsSelected) {
          if (item.value == selected.text) {
            return true;
          }
        }
      }
    } else {
      // check if item is found in itemsSelected
      for (var item in items) {
        for (var selected in itemsSelected) {
          if (item.index == selected.id) {
            return true;
          }
        }
      }
    }
    return false;
  }

  onSelect() {}

  onMultiSelectByName(List<CheckboxItem> itemsSelected) {
    List<CheckboxItem> data = [];
    for (var item in itemsSelected) {
      for (var item2 in items) {
        if (item.text == item2.value) {
          data.add(CheckboxItem(idString: item2.idString, text: item2.value));
        }
      }
    }
    print('itemsSelected: ${itemsSelected.length}');
    print('itemsSelected: ${itemsSelected.first.idString}');
    onMultiSelectItem!(data);
  }
}
