
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/text_field/bottom_sheet_text_field_rectangle.dart';

import '../../../../../adminFeatures/usersManagement/domain/entities/brand.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../domain/entities/installment_with_cashift.dart';


class InstallmentPackagePicker extends BaseStatelessWidget {
  final String? initialValue;
  final List<InstallmentWithCashift> items;
  final Function(InstallmentWithCashift) onSelectItem;

  InstallmentPackagePicker(
      {Key? key,
      this.initialValue,
      required this.items,
      required this.onSelectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetTextFieldRectangle(
      title: strings.installment_package,
      hintText: strings.select_installment_package,
      setSearch: true,
      initValue: initialValue,
      items: items.map((e) => Item(index: e.id ?? 0, value: e.installmentCount ?? ''))
          .toList(),
      onSelectItem: (item) async {
        print(item);
        InstallmentWithCashift data = items.firstWhere((element) => element.id == item.index);
        onSelectItem(data);
      },
    );
  }
}
