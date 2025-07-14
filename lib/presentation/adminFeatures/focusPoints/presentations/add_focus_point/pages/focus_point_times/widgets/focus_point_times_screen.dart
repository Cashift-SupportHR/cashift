import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/buttons/row_buttons.dart';

import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';
import 'focus_point_time_item.dart';

///  Created by harbey on 5/15/2023.
class FocusPointTimesScreen extends BaseStatelessWidget {
  final int focusPointId;
  final Function(AddFocusAttendanceTimeParams) onSaveEditTime;
  final Function(int id)? onDeleteTime;
  final Function(List<AddFocusAttendanceTimeParams>) onSaveAddFocusPoint;
  final InitializedFocusPointTimes state;
  FocusPointTimesScreen({Key? key, required this.focusPointId, required this.onSaveEditTime, required this.onSaveAddFocusPoint, this.onDeleteTime, required this.state}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pointNameController = TextEditingController();
  int project = 0;
  int pointType = 0;
  int priorityLevel = 0;
  int employeeType = 0;
  String idNumber = '';
  LocationData? locationData;
  @override
  Widget build(BuildContext context) {
    print('covenants focusPointId: $focusPointId');
    List<AddFocusAttendanceTimeParams> allParams = [];
    StreamStateInitial<List<AddFocusAttendanceTimeParams>> isHaseDataStream =
    StreamStateInitial<List<AddFocusAttendanceTimeParams>>();

    return Scaffold(
      backgroundColor: kBackground,
      bottomSheet: state.isEdit ? const SizedBox() : StreamBuilder<List<AddFocusAttendanceTimeParams>>(
          stream: isHaseDataStream.stream,
          builder: (context, snapshot) {
          return RowButtons(
            textCancelButton: strings.next,
            onCancel: snapshot.hasData ?() {
              onSaveAddFocusPoint(allParams);
            } : null,
          );
        }
      ),
      body: ListView.builder(
        itemCount: state.shifts.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
        itemBuilder: (context, index) => FocusPointTimeItem(
          focusPointId: focusPointId,
          shift: state.shifts[index],
          types: state.focusPointsAttendanceTypes,
          isEdit: state.isEdit,
          focusPointsAttendanceTimes: savedTimesForShift(state.shifts[index].id!),
            onDeleteTime: (id) {
              onDeleteTime?.call(id);
            },
          onSaveEditTime: (param) {
            onSaveEditTime(param);
          },
          onSaveListTimes: (params) {
            allParams.addAll(params);
            isHaseDataStream.setData(allParams);
          },
        ),
      ),
    );
  }

  List<AddFocusAttendanceTimeParams> savedTimesForShift(int id) {
    final list = state.focusPointTimes.where((e) => e.shiftId==id).toList();
    return list;
  }
}
