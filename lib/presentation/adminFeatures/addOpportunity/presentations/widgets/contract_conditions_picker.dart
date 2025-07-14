import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/stream_state_widget_v2.dart';
import 'package:shiftapp/common/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../domain/entities/contract_conditions.dart';

class ContractConditionsPicker extends BaseStatelessWidget {
  final StreamStateInitial<List<ContractConditions>?> contractConditionsStream;
  final TextEditingController? contractsController;
  final Function(Item, List<ContractConditions>) onSelectItem;

  ContractConditionsPicker(
      {Key? key,
      required this.contractConditionsStream,
      this.contractsController,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: contractConditionsStream.stream,
      builder: (context, snapshot) {
        if(snapshot.data?.length == 1){
          contractsController?.text = snapshot.data?[0].conditionNumber ?? '';
          onSelectItem(Item(index: snapshot.data?[0].id ?? 0, value: snapshot.data?[0].conditionNumber ?? ''), snapshot.data ?? []);
        }
        return snapshot.hasData ?
          BottomSheetTextFieldRectangle(
          title: strings.contract_clause,
          hintText: strings.select_contract_clause,
          suffixIcon: Icons.keyboard_arrow_down,
          controller: contractsController,
          initValue: contractsController?.text ?? '',
          isScrollControlled: true,
          setSearch: true,
          searchHint: strings.search_contract_clause,
          items: snapshot.data?.map((e) => Item(
                  index: e.id!,
                  value: e.conditionNumber ?? '',))
              .toList() ??
              [],
          onSelectItem: (item){
            onSelectItem(item, snapshot.data ?? []);
          },
        ) : SizedBox.shrink();
      }
    );
  }
}
