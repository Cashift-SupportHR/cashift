import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../domain/entities/employee_opportunity_type.dart';
import 'accept_opportunity_method_item.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';

class AttendanceDepartureMethodPicker extends BaseStatelessWidget {
  final int? initialId;
  final List<EmployeeOpportunityType> data;
  final dynamic Function(int) onSelectItem;

  AttendanceDepartureMethodPicker(
      {Key? key,
      required this.onSelectItem,
      this.initialId,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: getInitialName());

    return BuildTextFieldItem(
      title: strings.method_arrival_departure,
      suffixIcon: Icons.keyboard_arrow_down,
      controller: controller,
      onTap: () {
        ListPickerWidget.showPicker(
            context: context,
            setSearch: false,
            title: strings.select_method_arrival_departure,
            isScrollControlled: true,
            itemBuilder: (context, item) {
              return AcceptOpportunityMethodItem(
                data: data[item.index],
              );
            },
            items: data.map((e) => Item(index: data.indexOf(e), value: e.name ?? ''),)
                .toList(),
            onSelectItem: (item) async {
              EmployeeOpportunityType employeeType = data[item.index];
              controller.text = employeeType.name ?? '';
              onSelectItem(employeeType.id!);
            },
        );
      },
    );
  }

  String getInitialName() {
    print('initialId is ${initialId}');
    if (initialId == null) return '';
    // if (data.any((element) => element.id == initialId) == false) return '';
    return data.firstWhereOrNull((element) => element.id == initialId)?.name ?? '';
  }
}
