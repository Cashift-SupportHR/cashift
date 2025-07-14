import 'package:flutter/material.dart';

import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';

class FocusPointTimesTypesPicker extends BaseStatelessWidget {
  final int? id;
  final List<PointAttendanceType> items;
  final Function(Item) onSelectItem;

  FocusPointTimesTypesPicker(
      {Key? key, this.id, required this.items, required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = '';
    if(id != null) {
      print('FocusPointTimesTypesPicker ${id}');
      name = items.firstWhere((element) => element.id == id).name ?? '';
    }
    TextEditingController controller = TextEditingController(text: name);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          strings.type + ' :',
          style: kTextRegular.copyWith(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: BuildTextFieldItem(
            controller: controller,
            inputDecoration: kTextFieldDecorationLessRadiusForTime.copyWith(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              constraints: const BoxConstraints(
                minHeight: 20,
                maxHeight: 100,
              ),
              suffixIcon: Icon(Icons.keyboard_arrow_down, color: kPrimary),
            ),
            onTap: () {
              ListPickerWidget.showPicker(
                  context: context,
                  title: strings.select_shift_type,
                  isScrollControlled: false,
                  items: items
                      .map((e) => Item(index: e.id!, value: e.name ?? ''))
                      .toList(),
                  onSelectItem: (item) async {
                    controller.text = item.value;
                    onSelectItem(item);
                  });
            },
          ),
        ),
      ],
    );
  }
}
