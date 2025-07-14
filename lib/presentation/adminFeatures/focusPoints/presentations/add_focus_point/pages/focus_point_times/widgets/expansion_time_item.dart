import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../../common/components/buttons/row_small_button.dart';
import '../../../../../../../shared/components/image_builder.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';
import 'focus_point_time_types_picker.dart';
import 'text_field_time.dart';

///  Created by harbey on 5/16/2023.
class ExpansionTimeItem extends BaseStatelessWidget {
  final AddFocusAttendanceTimeParams item;
  final List<PointAttendanceType> types;
  final void Function(AddFocusAttendanceTimeParams)? onSaveTime;
  final void Function()? onDeleteTime;
  final bool isEdit;

  ExpansionTimeItem(
      {Key? key,
        required this.item,
        required this.types,
        this.onSaveTime,
        this.onDeleteTime,
        required this.isEdit
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddFocusAttendanceTimeParams newItem =  AddFocusAttendanceTimeParams(
      id: item.id,
      startTime: item.startTime,
      endTime: item.endTime,
      attendanceTypeId: item.attendanceTypeId,
      shiftId: item.shiftId,
      focusPointId: item.focusPointId,
    );
    final TextEditingController _controller = TextEditingController();

    StreamStateInitial<AddFocusAttendanceTimeParams> itemStream =
    StreamStateInitial<AddFocusAttendanceTimeParams>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<AddFocusAttendanceTimeParams>(
        stream: itemStream.stream,
        initialData: newItem,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldTime(
                                title: strings.from,
                                initialValue: DateFormatter.repairApiTimeUI(snapshot.data?.startTime ?? ''),
                                onSelectTime: (time) {
                                  newItem.startTime = time;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFieldTime(
                                title: strings.too,
                                initialValue: DateFormatter.repairApiTimeUI(snapshot.data?.endTime ?? ''),
                                onSelectTime: (time) {
                                  newItem.endTime = time;

                                },
                              ),
                            ),
                          ],
                        ),
                        FocusPointTimesTypesPicker(
                          id: snapshot.data?.attendanceTypeId,
                          items: types,
                          onSelectItem: (value) {
                            newItem.attendanceTypeId = value.index;
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: onDeleteTime,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10, top: 2),
                      child: kLoadSvgInCirclePath(AppIcons.deleteOutline,
                          color: kRed_1E, height: 20, width: 20),
                    ),
                  ),
                ],
              ),
              RowSmallButton(
                padding: const EdgeInsets.only(bottom: 10),
                mainAxisAlignment: MainAxisAlignment.center,
                radius: 25,
                textSave:   isEdit ? strings.save_edit : strings.save_button,
                onCancel: () {
                  print('onPressed1 ${newItem.startTime}');
                  itemStream.setData(item);
                },
                onSave: () {
                  print('onPressed2 ${newItem.toJson()}');
                  onSaveTime!(newItem);
                },
              ),
            ],
          );
        }
      ),
    );
  }
}
