import 'package:flutter/material.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../domain/entities/calc_opportunity.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';
import 'expansion_tile_item.dart';

class MethodCalculatingOpportunity extends BaseStatelessWidget {
  final CalcOpportunity calcOpportunity;
  final  dynamic Function(Item) onSelectItem;
  final   TextEditingController? methodCalcOppController;
  MethodCalculatingOpportunity({Key? key, required this.calcOpportunity, required this.onSelectItem, required this.methodCalcOppController }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BuildTextFieldItem(
      title: strings.method_calculating_opportunity,
      suffixIcon: Icons.keyboard_arrow_down,
      isInfoRequired: true,
      messageTooltip: calcOpportunity.description,
      controller: methodCalcOppController,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            setSearch: false,
            title: strings.select_method_calculating_opportunity,
            isScrollControlled: false,
            itemBuilder: (context, index) {
              return ExpansionTileItem(
                title: index.value,
                description: index.description,

              );
            },
            items: calcOpportunity.listCalc!
                .map((e) => Item(index: e.id!, value: e.calcOppName ?? '', description: e.description ?? ''))
                .toList(),
            onSelectItem: onSelectItem
        );
      },
      // validate: () {},
    );
  }
}
