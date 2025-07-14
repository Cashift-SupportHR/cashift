import 'package:flutter/material.dart';

import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';

class FocusPointAreaPicker extends BaseStatelessWidget {
  final String? initialValue;
  final StreamStateInitial<List<FocusPointArea>>? areasStream;
  final Function(Item) onSelectItem;

  FocusPointAreaPicker({Key? key, this.initialValue, this.areasStream, required this.onSelectItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController( text: initialValue);
    return StreamBuilder<List<FocusPointArea>>(
      stream: areasStream!.stream,
      builder: (context, snapshot) {
        if(snapshot.data == null || snapshot.data!.isEmpty){
          controller.text = '';
        } else {
          controller.text = initialValue ?? '';
        }
        return BuildTextFieldItem(
          title: strings.area,
          hintText: strings.select_area,
          suffixIcon: Icons.keyboard_arrow_down,
          controller: controller,
          onTap: () {
            ListPickerWidget.showPicker(
                context: context,
                title: strings.select_area,
                isScrollControlled: false,
                items: snapshot.data?.map((e) => Item(index: e.id ?? 0, value: e.name.toString())).toList() ?? [],
                onSelectItem: (item) {
                  controller.text = item.value;
                  onSelectItem(item);
                },
            );
          },
        );
      }
    );
  }
}
