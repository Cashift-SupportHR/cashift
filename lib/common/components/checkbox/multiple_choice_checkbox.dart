import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../presentation/presentationUser/resources/colors.dart';


///  Created by harbey on 6/20/2023.
class MultipleChoiceCheckbox extends StatelessWidget {
  final List<CheckboxItem> items;
  final List<CheckboxItem>? selectedItems;
  final bool? isDivider;
  final Function(List<CheckboxItem>)? onChanged;
  const MultipleChoiceCheckbox({required this.items, this.onChanged, this.isDivider, required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    List<CheckboxItem> selected = selectedItems ?? [];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: items.map((e) => StatefulBuilder(builder: (context, setState) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: selected.any((element) => element.id == e.id),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      visualDensity: VisualDensity.standard,
                      onChanged: (_) {
                        if (e.checked == true) {
                          e.checked = false;
                          // The method remove() in this case is not working
                          // so I used removeWhere() instead
                          if(selected.isNotEmpty)
                          selected.removeWhere((element) {
                            if(element.id == 0){
                              return element.text == e.text;
                            } else {
                              return element.id == e.id;
                            }
                          }); // deselect
                        } else {
                          e.checked = true;
                          selected.add(e); // select
                        }
                        onChanged!(selected);
                        setState(() {});
                      },
                    ),
                    Expanded(
                      child: Text(
                        e.text ?? '',
                        style: kTextMedium.copyWith(fontSize: 13, color: kPrimary),
                      ),
                    ),
                  ],
                ),
              ),
              if (isDivider == true)
              const Divider(
                thickness: 1,
                color: kSilverThree,
              ),
            ],
          );
        })).toList(),
      ),
    );
  }
  bool isItemSelected(CheckboxItem item, {List<CheckboxItem>? selectedItems}) {
    for (CheckboxItem item in selectedItems ?? []) {
      return (item.id ==  item.id);
    }
    return false;
  }
}

class CheckboxItem {
  int? id;
  String? idString;
  String? text;
  bool? checked;

  CheckboxItem({this.id, this.text, this.checked = false, this.idString});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idString': idString,
      'text': text,
      'checked': checked,
    };
  }
}
