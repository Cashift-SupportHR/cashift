import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/checkbox/multiple_choice_checkbox.dart';
import 'package:shiftapp/common/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../domain/entities/brand.dart';
import '../../../domain/entities/user_area.dart';

class AreasMultiPicker extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final List<UserArea>? initialValue;
  final List<UserArea> items;
  final Function(List<CheckboxItem>) onSelectItem;

  AreasMultiPicker(
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
      title: title ?? strings.area_name,
      hintText: hintText ?? strings.select_area,
      // Note: I used idString as id because it is String
      itemsSelected: initialValue
          ?.map((e) => CheckboxItem(id: 0, text: e.name, checked: true, idString: e.id))
          .toList(),
      isScrollControlled: true,
      setSearch: true,
      searchHint: hintText ?? strings.select_area,
      // Note: I used idString as id because it is String
      // So must index = 0 in case id is String
      items:
          items.map((e) => Item(index: 0, value: e.name ?? '', idString: e.id)).toList(),
      onMultiSelectItem: (items) async {
        // //    print(items.first.toMap());
        // print(items.length);
         onSelectItem(items);
        //fetchSelectedItemsByName(items);
      },
    );
  }

  // getInitialDataByName(){
  //   for(var item in initialValue!){
  //     if()
  //   }
  // }
  fetchSelectedItemsByName(List<CheckboxItem> selectedItems) {
    print('selectedItems: ${selectedItems.length}');
    List<String> itemsSelected = [];
       for(var item in selectedItems){
         for(var item2 in items){
           if(item.text == item2.name){
             itemsSelected.add(item2.id ?? '');
           }
         }
       }
       print('itemsSelected: ${itemsSelected.length}');
    //onSelectItem(itemsSelected);
  }
}
