import 'package:flutter/material.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../domain/entities/shift.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';

class WorkingPeriodShift extends BaseStatelessWidget {
  final StreamStateInitial<Shift?> shiftDataStream;
  final Function(Item, List<ListShift>) onSelectItem;
  final TextEditingController? workingPeriodController;
  final GlobalKey<FormState>  formContractFieldKey;
  final GlobalKey<FormFieldState>? formDateFieldKey;

  WorkingPeriodShift({Key? key, required this.shiftDataStream, required this.onSelectItem, this.workingPeriodController, required this.formContractFieldKey, this.formDateFieldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Shift?>(
        stream: shiftDataStream.stream,
        builder: (context, snapshot) {
          return BuildTextFieldItem(
            title: strings.working_period,
            hintText: strings.select_working_period,
            suffixIcon: Icons.keyboard_arrow_down,
            controller: workingPeriodController,
            isInfoRequired: true,
            messageTooltip: snapshot.data?.description ?? '',
            onTap: () {
              // It is not possible to choose the period without choosing the contract condition and date,
              // and based on the work period and choosing the contract condition and date,
              // the salary for the opportunity appears, so validation was made
         //     if (formContractFieldKey.currentState!.validate()) {
                ListPickerWidget.showPicker(
                    context: context,
                    setSearch: false,
                    title: strings.select_working_period,
                    isScrollControlled: false,
                    items: snapshot.data?.listShift?.map((e) => Item(index: e.id ?? 0, value: e.shiftName ?? ''))
                        .toList() ?? [],
                    onSelectItem: (item) async {
                      onSelectItem(item, snapshot.data?.listShift ?? []);
                    });
         //     }
            },
          );
        }
    );
  }
}
