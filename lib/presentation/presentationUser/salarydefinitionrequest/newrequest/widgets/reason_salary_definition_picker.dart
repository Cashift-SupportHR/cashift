import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/salary-definition-request/reason_salary_definition_request.dart';

 import '../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../shared/components/dropdown_filed.dart';

class ReasonSalaryDefinitionRequestPicker extends BaseStatelessWidget {
  final List<ReasonSalaryDefinitionRequest> reasons;
  final TextEditingController? contractsController;
  final Function(Item) onSelectItem;
  ReasonSalaryDefinitionRequestPicker({Key? key, required this.reasons, this.contractsController, required this.onSelectItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildTextFieldItem(
      title: strings.purpose_request,
      hintText: strings.select_purpose_request,
      suffixIcon: Icons.keyboard_arrow_down,
      controller: contractsController,
      validator: (value) {
        if (value!.isEmpty) {
          return strings.validate_purpose_request;
        }
        return null;
      },
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            setSearch: true,
            title: strings.purpose_request,
            items: reasons
                .map((e) => Item(index: 0, value: e.name ?? '', description: e.id ?? ''))
                .toList(),
            onSelectItem: onSelectItem);
      },
    );
  }
}
