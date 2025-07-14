import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import 'multiple_choice_checkbox.dart';

///  Created by harbey on 6/20/2023.
class SingleChoiceCheckbox extends StatelessWidget {
  final List<CheckboxItem> items;
  final TextStyle? textStyle;
  final Function(CheckboxItem)? onChanged;

  const SingleChoiceCheckbox({required this.items, this.onChanged, this.textStyle});

  @override
  Widget build(BuildContext context) {
   // CheckboxItem selectedItem = CheckboxItem();
    return SingleChildScrollView(
      child: StatefulBuilder(builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: items
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                            value:  e.checked,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            side: BorderSide(
                              color: kPrimary,
                              width: 1.5,
                            ),
                            visualDensity: VisualDensity.standard,
                            onChanged: (_) {
                             // remove all checked items and set the current item as checked
                              items.forEach((element) {
                                element.checked = false;
                              });
                              e.checked = true;
                              onChanged!(e);
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                            e.text ?? '',
                            style: kTextMedium.copyWith(
                                fontSize: 12, color: kPrimary),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        );
      }),
    );
  }
}
