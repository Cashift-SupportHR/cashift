import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../../../shared/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';

///  Created by harbey on 6/6/2023.
class ShiftsFocusPointPicker extends BaseStatelessWidget {
  final List<ShiftFocusPoint>? initialValues;
  final Function(List<int>) onSelectItem;
  final StreamStateInitial<List<ShiftFocusPoint>>? shiftsStream;
  final Function(int) onDeleteShift;

  ShiftsFocusPointPicker({
    Key? key,
    this.initialValues,
    this.shiftsStream,
    required this.onSelectItem,
    required this.onDeleteShift,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();
  List<ShiftFocusPoint> selectedShifts = [];
  List<int> selectedShiftsIds = [];
  List<int> initialValuesIds = [];
  StreamStateInitial<List<ShiftFocusPoint>> selectedShiftsStream =
      StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<List<ShiftFocusPoint>>(
            stream: shiftsStream!.stream,
            builder: (context, snapshot) {
              _initialValues(snapshot.data ?? []);
              return BottomSheetTextFieldRectangle(
                title: strings.work_periods,
                hintText: strings.add_work_the_period,
                controller: controller,
                suffixIcon: Icons.add,
                initValue:
                    selectedShifts.isEmpty ? null : strings.add_more_the_work_periods,
                items: snapshot.data
                        ?.map((e) => Item(
                            index: e.shiftId ?? 0,
                            value: e.shiftName.toString(),
                            description: e.id.toString()))
                        .toList() ??
                    [],
                onSelectItem: (item) {
                  onSelectItemPressed(item);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return strings.this_field_is_required;
                  }
                  return null;
                },
              );
            }),
        StreamBuilder<List<ShiftFocusPoint>>(
            stream: selectedShiftsStream.stream,
            builder: (context, snapshot) {
              return snapshot.data == null || snapshot.data!.isEmpty
                  ? const SizedBox()
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,

                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return _ShiftItem(
                          shiftName: selectedShifts[index].shiftName ?? '',
                          onDelete: () {
                            onDeletePressed(selectedShifts[index]);
                          },
                        );
                      },
                    );
            }),
      ],
    );
  }

  _initialValues(List<ShiftFocusPoint> shifts) {
    if (initialValues == null || initialValues!.isEmpty || shifts.isEmpty) {
      selectedShifts = [];
      selectedShiftsStream.setData(selectedShifts);
    } else {
      selectedShifts = initialValues ?? [];
      selectedShiftsIds = selectedShifts.map((e) => e.shiftId ?? 0).toList();
      selectedShiftsStream.setData(selectedShifts);
      initialValuesIds = initialValues!.map((e) => e.shiftId ?? 0).toList();
    }
  }

  // Note: we delete the shift by id not by shiftId
  // and edit shift by shiftId not by id
  onDeletePressed(ShiftFocusPoint shift) {
    // we check if initialValues is not null and not empty to know if we are in edit mode
    // we use initialValuesIds to know if the shift is already saved in the database or not
    // to know if we should call onDeleteShift or removeItem
    if (initialValues != null && initialValues!.isNotEmpty) {

      if (  initialValuesIds.contains(shift.shiftId)) {
       onDeleteShift(shift.id ?? 0);
      } else {
        removeItem(shift.shiftId ?? 0);
      }
    } else {
      removeItem(shift.shiftId ?? 0);
    }
  }

  removeItem(int id) {
    selectedShifts.removeWhere((element) => element.shiftId == id);
    initialValuesIds.removeWhere((element) => element == id);
    selectedShiftsIds.removeWhere((element) => element == id);
    selectedShiftsStream.setData(selectedShifts);
    onSelectItem(selectedShiftsIds);

    controller.text = selectedShifts.isEmpty ? '' : strings.add_more_the_work_periods;
  }

  onSelectItemPressed(Item item) {
    controller.text = strings.add_more_the_work_periods;
    if (selectedShifts.any((element) => element.shiftName == item.value)) {
      return;
    }
    selectedShifts
        .add(ShiftFocusPoint(shiftId: item.index, shiftName: item.value));
    selectedShiftsStream.setData(selectedShifts);
    selectedShiftsIds.add(item.index);
    onSelectItem(selectedShiftsIds);
  }
}

class _ShiftItem extends StatelessWidget {
  final String shiftName;
  final Function()? onDelete;

  const _ShiftItem({Key? key, required this.shiftName, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: Decorations.boxDecorationBorder(
        color: kGrey_EF,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
              child:
                  Text(shiftName, style: kTextRegular.copyWith(fontSize: 10))),
          InkWell(
            child: kLoadSvgInCirclePath(AppIcons.deleteOutline),
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}
