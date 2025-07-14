import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import 'custom_radio_list.dart';

///  Created by harbey on 7/11/2023.
class RadioGridList extends StatelessWidget {
  final List<RadioItem> items;
  final String groupValue;
  final Color? color;
  final int crossAxisCount;
  final void Function(RadioItem)? onChanged;
  const RadioGridList({
    Key? key,
    required this.items,
    this.color,
    required this.groupValue,
    required this.onChanged,
    this.crossAxisCount = 2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String groupValue = this.groupValue;
    return StatefulBuilder(builder: (context, setState) {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: crossAxisCount == 2 ? 3 : 2.5,
          ),
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Tooltip(
              message: items[index].tooltipMessage,
              triggerMode: TooltipTriggerMode.tap,
              textStyle: kTextRegular.copyWith(fontSize: 14, color: kWhite),
              child: CustomRadioList(
                title: items[index].title,
                color: color,
                value: items[index].value,
                groupValue: groupValue,
                onChanged: (value) {
                  groupValue = value as String;
                  onChanged!(items[index]);
                  setState(() {});
                },
              ),
            );
          });
    });
  }
}

class RadioItem {
  final String value;
  final String title;
  final String tooltipMessage;
  String? id;
  RadioItem({required this.value, required this.title, this.id, this.tooltipMessage = ''});

  static listFrom(List items) {
    List<RadioItem> list = [];
    for (var item in items) {
      list.add(RadioItem(value: item.id, id: item.id, title: item.name, tooltipMessage: item.tooltipMessage ?? ''));
    }
    return list;
  }
}
