import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/focus_point_data/widgets/focus_point_transaction_types_picker.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/focus_point_data/widgets/shifts_focus_point_picker.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/focus_point_data/widgets/coverage_break_focus_point_picker.dart';
import 'package:shiftapp/common/components/buttons/row_buttons.dart';
import 'package:shiftapp/presentation/shared/components/snckBar/snack_bar_manager.dart';

import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../shared/components/app_cupertino_button.dart';
import '../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';
import 'widgets/current_location.dart';
import 'widgets/employee_type_picker.dart';
import 'widgets/focus_point_area_picker.dart';
import 'widgets/point_type_picker.dart';
import 'widgets/priority_level_picker.dart';
import 'widgets/projects_picker.dart';
import 'widgets/scan_qr_code_text_field.dart';

///  Created by harbey on 5/15/2023.
class FocusPointDataScreen extends BaseStatelessWidget {
  final Function(AddFocusPointParams) onSaveAddFocusPoint;
  final InitializedFocusPointData state;
  final StreamStateInitial<List<FocusPointArea>>? areasStream;
  final Function(int) onFetchFocusPointAreas;
  final StreamStateInitial<List<ShiftFocusPoint>>? shiftsStream;
  final Function(int) onFetchShifts;
  final Function(int) onDeleteShift;


  FocusPointDataScreen({
    Key? key,
    required this.onSaveAddFocusPoint,
    required this.state,
    this.areasStream,
    required this.onFetchFocusPointAreas,
    this.shiftsStream,
    required this.onFetchShifts,
    required this.onDeleteShift,
  }) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pointNameController = TextEditingController();
  int projectId = 0;
  int focusPointsTransactionId = 0;
  int pointType = 0;
  int focusPointsPriorityId = 0;
  int employeeType = 0;
  String focusPointId = '';
  LocationData? locationData;
  String radius = '';
  int coverageBreakId = 0;
  List<int> shiftsIds = [];
  StreamStateInitial<AddFocusPointParams> isHaseDataStream =
      StreamStateInitial<AddFocusPointParams>();
  int focusPointsAreaId = 0;

  FocusPointById focusPointById = FocusPointById();

  @override
  Widget build(BuildContext context) {
    _initialViewData(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            ProjectsPicker(
              initialValue: focusPointById.projectName,
              items: state.projects,
              onSelectItem: (item) {
                projectId = item.index;
                onFetchFocusPointAreas(projectId);
                onFetchShifts(projectId);
              },
            ),
            FocusPointTransactionTypesPicker(
              initialValue: focusPointById.focusPointsTransactionName,
              items: state.focusPointTransactionTypes,
              onSelectItem: (item) {
                focusPointsTransactionId = item.index;
              },
            ),
            PointTypePicker(
              initialValue: focusPointById.focusPointsTypeName,
              items: state.focusPointsType,
              onSelectItem: (item) {
                pointType = item.index;
              },
            ),
            BuildTextFieldItem(
              title: strings.point_name,
              hintText: strings.write_point_name,
              keyboardType: TextInputType.text,
              controller: pointNameController,
            ),
            PriorityLevelPicker(
              initialValue: focusPointById.focusPointsPriorityName,
              items: state.priorityLevel,
              onSelectItem: (item) {
                focusPointsPriorityId = item.index;
              },
            ),
            EmployeePicker(
              initialValue: focusPointById.freelanceTypeName,
              items: state.employeesTypes,
              onSelectItem: (item) {
                employeeType = item.index;
              },
            ),
            FocusPointAreaPicker(
              initialValue: focusPointById.focusPointsAreaName,
              areasStream: areasStream,
              onSelectItem: (item) {
                focusPointsAreaId = item.index;
              },
            ),
            CoverageBreakFocusPointPicker(
            initialValue: focusPointById.coverageBreakName,
              items: state.coverageBreak,
              onSelectItem: (item) {
                coverageBreakId = item.index;
              },
            ),
            ScanQrCodeTextField(
              focusPointId: focusPointById.focusPointId ?? '',
              fetchFocusPointId: (text) {
                focusPointId = text;
              },
            ),
            ShiftsFocusPointPicker(
              initialValues: focusPointById.listShifts,
              shiftsStream: shiftsStream,
              onDeleteShift: onDeleteShift,
              onSelectItem: (item) {
                shiftsIds = item;
              },
            ),
            CurrentLocation(
              initialLocation: locationData,
              onGetLocation: (location) {
                locationData = location;
                print('onGetLocation: ${locationData!.latitude}');
              },
            ),
            const SizedBox(height: 30),
            StreamBuilder<AddFocusPointParams>(
                stream: isHaseDataStream.stream,
                builder: (context, snapshot) {
                  if (focusPointById.id != null) {
                    return AppCupertinoButton(
                      onPressed: () {
                        onAddFocusPoint(context);
                      },
                      text: strings.save_button,
                    );
                  }
                  return RowButtons(
                    textCancelButton: strings.next,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    onCancel: () {
                      if (formKey.currentState!.validate()) {
                        onAddFocusPoint(context);
                      }
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }

  onAddFocusPoint(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (locationData != null) {
        AddFocusPointParams params = _createFocusPointParams();
        onSaveAddFocusPoint(params);
        isHaseDataStream.setData(params);
      } else {
        SnackBarManager.showErrorSnackBar(
          context,
          strings.focus_point_location_message,
        );
      }
    }
  }

  void _initialViewData(BuildContext context) {
    focusPointById = state.focusPointById;
    if (focusPointById.id != null) {
      pointNameController.text = focusPointById.focusPointsName ?? '';
      projectId = focusPointById.projectId ?? 0;
      pointType = focusPointById.focusPointsTypeId ?? 0;
      focusPointsPriorityId = focusPointById.focusPointsPriorityId ?? 0;
      employeeType = focusPointById.freelanceTypeId ?? 0;
      focusPointId = focusPointById.focusPointId ?? '';
      locationData = LocationData.fromMap({
        'latitude': double.parse(focusPointById.latitude ?? '0.0'),
        'longitude': double.parse(focusPointById.longtude ?? '0.0'),
      });
      radius = focusPointById.radius ?? '';
      focusPointsAreaId = focusPointById.focusPointsAreaId ?? 0;
      coverageBreakId = focusPointById.coverageBreakId ?? 0;
      focusPointsTransactionId = focusPointById.focusPointsTransactionId ?? 0;
      shiftsIds = focusPointById.listShifts?.map((e) => e.shiftId!).toList() ?? [];
      onFetchFocusPointAreas(projectId);
      onFetchShifts(projectId);
    }
  }

  AddFocusPointParams _createFocusPointParams() {
    return AddFocusPointParams(
      id: focusPointById.id,
      projectId: projectId,
      focusPointsTypeId: pointType,
      focusPointName: pointNameController.text,
      focusPointsPriorityId: focusPointsPriorityId,
      freeLanceType: employeeType,
      focusPointId: focusPointId,
      longtude: locationData?.longitude.toString() ?? '0.0',
      latitude: locationData?.latitude.toString() ?? '0.0',
      radius: locationData?.accuracy.toString() ?? '0.0',
      focusPointsAreaId: focusPointsAreaId,
      focusPointsTransactionId: focusPointsTransactionId,
      listShift: shiftsIds,
      coverageBreak: coverageBreakId,
    );
  }
}
