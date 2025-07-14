import 'package:flutter/material.dart';

import '../../../../../common/data/models/loans_request/loan_num_month_condition_dto.dart';
import '../../../../../common/domain/entities/loans_request/loan_num_month_condition.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../common/common_state.dart';

class InstallmentMonthsNumberPicker extends BaseStatelessWidget {
  final StreamStateInitial<LoanNumMonthCondition?> loanNumMonthConditionStream;
  final Function(LoansMonth?) onSelectItem;
  InstallmentMonthsNumberPicker({Key? key, required this.onSelectItem, required this.loanNumMonthConditionStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller = TextEditingController();
    return StreamBuilder<LoanNumMonthCondition?>(
      stream: loanNumMonthConditionStream.stream,
      builder: (context, snapshot) {
        return (snapshot.data?.loansMonths == null || snapshot.data!.loansMonths!.isEmpty) ? const SizedBox() :
          BuildTextFieldItem(
          title: strings.number_months_installment,
          hintText: strings.select_number_months_loan,
          suffixIcon: Icons.keyboard_arrow_down,
          controller: controller,
          onTap: () {
            ListPickerWidget.showPicker(
                context: context,
                setSearch: true,
                title: strings.select_number_months_loan,
                items: snapshot.data?.loansMonths?.map((e) => Item(index: e.id ?? 0, value: e.nameMonth ?? '',)).toList() ?? [],
                onSelectItem: (value){
                  controller.text = value.value;
                  final  loansMonth = snapshot.data?.loansMonths?.firstWhere((element) => element.id == value.index);
                  onSelectItem(loansMonth);
                });
          },
        );
      }
    );
  }
}
