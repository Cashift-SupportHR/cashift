import 'package:flutter/material.dart';

import '../../../../../common/domain/entities/loans_request/loan_type.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../common/components/dropdown/dropdown_filed.dart';

class LoanRequestTypePicker extends BaseStatelessWidget {
  final List<LoanType> loanTypes;
  final Function(Item, String) onSelectItem;
  LoanRequestTypePicker({Key? key, required this.loanTypes, required this.onSelectItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller = TextEditingController();
    return BuildTextFieldItem(
      title: strings.loan_request_type,
      hintText: strings.select_loan_request_type,
      suffixIcon: Icons.keyboard_arrow_down,
      controller: controller,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return strings.validate_purpose_request;
      //   }
      //   return null;
      // },
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            setSearch: true,
            title: strings.select_loan_request_type,
            items: loanTypes
                .map((e) => Item(index: e.id ?? 0, value: e.name ?? '', description: e.loanValue ?? ''))
                .toList(),
            onSelectItem: (value) {
              controller.text = value.value;
              String crmValue = loanTypes.firstWhere((element) => element.id == value.index).crmValue ?? '';
              print('crmValue: $crmValue');

              onSelectItem(value, crmValue);
            });
      },
    );
  }
}
