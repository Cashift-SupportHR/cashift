import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/text_field/build_text_field_item.dart';
import 'package:shiftapp/presentation/adminFeatures/employmentManagement/presentation/employmentManagement/widgets/working_periods_multi_picker.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/texts/underline_text.dart';

import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/checkbox/multiple_choice_checkbox.dart';
import '../../../../../shared/components/radio/radio_grid_list.dart';
import '../../../../usersManagement/presentation/addNewUser/widgets/projects_multi_picker.dart';
import '../../../data/models/save_order_status_params.dart';
import '../../../domain/entities/employee_data.dart';
import '../../../domain/entities/employee_order_status.dart';
import '../../../domain/entities/employee_order_status_constants.dart';
import '../../../domain/entities/order_status.dart';
import 'employee_order_status_picker.dart';
import 'employment_management_item.dart';

///  Created by harbey on 7/4/2023.
class EmployeeDataSheet extends BaseStatelessWidget {
  final EmployeeData item;
  final InitializedSaveEmployeeData state;
  final Function(SaveOrderStatusParams) onSave;

  EmployeeDataSheet({
    Key? key,
    required this.item,
    required this.state,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmploymentManagementItem(
              isDecorations: false,
              item: item,
              onBlockEmployee: (value){},
              onAllowEditFaceRecognition: (id){},
            ),
            _OrderStatus(
              item: item,
              state: state,
              onSave: onSave,
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderStatus extends BaseStatelessWidget {
  final EmployeeData item;
  final InitializedSaveEmployeeData state;
  final Function(SaveOrderStatusParams) onSave;

  _OrderStatus({
    Key? key,
    required this.item,
    required this.state,
    required this.onSave,
  }) : super(key: key);

  StreamStateInitial<int> radioGroupStream = StreamStateInitial<int>();
  TextEditingController notesController = TextEditingController();
  List<ListProject> listProject = [];
  List<ListShift> listShift = [];
  int? orderStatusId;

  final _formKey = GlobalKey<FormState>();

  StreamStateInitial<bool> isShowOrderStatusIfAcceptStream =
      StreamStateInitial<bool>();
  StreamStateInitial<OrderStatus> orderStatusStream = StreamStateInitial<OrderStatus>();
  StreamStateInitial<bool> isShowProjectsStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isShowShiftsStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isShowDescription = StreamStateInitial<bool>();
  int successAprovedLevel = 0;
  int isAcceptedForAllProject = 0;
  int isAcceptedForAllShift = 0;

  @override
  Widget build(BuildContext context) {
    _initialValues();
    print('item.freeLanceId ${item.freeLanceId}');
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UnderlineText(text: strings.order_status, fontSize: 14),
            RadioGridList(
              crossAxisCount: 3,
              items: state.orderStatus
                  .map((e) => RadioItem(
                        value: e.id?.toString() ?? '0',
                        title: e.name ?? '',
                      ))
                  .toList(),
              groupValue: state.employeeOrderStatus.isAccept?.toString() ??
                  EmployeeOrderStatusConstants.accepted,
              onChanged: (item) {
                OrderStatus orderStatus = state.orderStatus.firstWhere(
                    (element) => element.id == int.parse(item.value));
                onChangedRadio(orderStatus);
              },
            ),
            SizedBox(height: 10),
            StreamBuilder<int>(
              initialData: orderStatusId,
              stream: radioGroupStream.stream,
              builder: (context, snapshot) => ifAccept(),
            ),
            saveButtonStream(),
          ],
        ),
      ),
    );
  }

  ifAccept() {
    return StreamBuilder<OrderStatus>(
      stream: orderStatusStream.stream,
      builder: (context, snapshot) {
        final isShowProjects = snapshot.data?.isShowProjects ?? false;
        final isShowShifts = snapshot.data?.isShowShifts ?? false;
        final isShowDescription = snapshot.data?.isShowDescription ?? false;
        final isShowFreeLanceAcceptedType =
            snapshot.data?.isShowFreeLanceAcceptedType ?? false;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           if(isShowFreeLanceAcceptedType)
             EmployeeOrderStatusPicker(
             initialValue:
             state.employeeOrderStatus.successAprovedLevel?.toString() ?? '',
             items: state.orderStatusIfAccept,
             onSelectItem: (value) {
               successAprovedLevel = value.index;
             },
           ),
            if(isShowFreeLanceAcceptedType)
              ProjectsMultiPicker(
                iconTitle: AppIcons.bagSquareOutline,
                initialValue: state.employeeOrderStatus.listProject,
                items: state.projects,
                isSelectAll: state.employeeOrderStatus.isAcceptedForAllProject == 1 ? true : false,
                isSelectAllCheckBox: true,
                onMultiSelectItem: (value) {
                  onMultiSelectProjects(value);
                },
              ),
            if(isShowFreeLanceAcceptedType || listProject!.length != state.projects.length)
              WorkingPeriodsMultiPicker(
                iconTitle: AppIcons.workingPeriodOutline,
                initialValue: state.employeeOrderStatus.listShift ?? [],
                items: state.workingPeriods,
                isSelectAll: state.employeeOrderStatus.isAcceptedForAllShift == 1 ? true : false,
                isSelectAllCheckBox: true,
                onMultiSelectItem: (value) {
                  listShift = value
                      .map((e) => ListShift(shiftHeadId: e.id))
                      .toList();
                  if(listShift.length == state.workingPeriods.length){
                    isAcceptedForAllShift = 1;
                  } else {
                    isAcceptedForAllShift = 2;
                  }
                },
              ),
            if(isShowDescription)
            BuildTextFieldItem(
              title: strings.your_notes,
              iconTitle: AppIcons.writeNotesOutline,
              hintText: strings.write_your_notes_here,
              minLines: 5,
              controller: notesController,
              keyboardType: TextInputType.multiline,
            )
          ],
        );
      }
    );
  }

  _initialValues() {
    EmployeeOrderStatus initialValue = state.employeeOrderStatus;
    successAprovedLevel = initialValue.successAprovedLevel ?? 0;
    isAcceptedForAllProject = initialValue.isAcceptedForAllProject ?? 0;
    isAcceptedForAllShift = initialValue.isAcceptedForAllShift ?? 0;
    orderStatusId = initialValue.isAccept ?? 0;
    listProject = initialValue.listProject
            ?.map((e) => ListProject(projectId: e.id))
            .toList() ??
        [];
    listShift = initialValue.listShift
            ?.map((e) => ListShift(shiftHeadId: e.id))
            .toList() ??
        [];
    notesController.text =
        EmployeeOrderStatusConstants.contacted == orderStatusId
            ? (initialValue.descriptionConnect ?? '')
            : initialValue.description ?? '';

    if(state.orderStatus.any((element) => element.id == orderStatusId)){
      OrderStatus orderStatus = state.orderStatus.firstWhere(
              (element) => element.id == orderStatusId);
  //    onChangedRadio(orderStatus);
      notesController.text = initialValue.description ?? '';
      orderStatusStream.setData(orderStatus);
      radioGroupStream.setData(orderStatusId ?? 0);
    } else{
      orderStatusId = 0;
    }
    radioGroupStream.setData(orderStatusId ?? 0);
  }

  onChangedRadio(OrderStatus value) {
    listProject = [];
    listShift = [];
    isAcceptedForAllProject = 0;
    isAcceptedForAllShift = 0;
    notesController.clear();
    orderStatusId = value.id ?? 0;
    radioGroupStream.setData(orderStatusId ?? 0);
    orderStatusStream.setData(value);
    print('OrderStatus isShowDescription ${value.isShowDescription}');
    print('OrderStatus isShowProjects ${value.isShowProjects}');
    print('OrderStatus isShowFreeLanceAcceptedType ${value.isShowFreeLanceAcceptedType}');
    print('OrderStatus isShowShifts ${value.isShowShifts}');
    radioGroupStream.setData(orderStatusId ?? 0);
    print('orderStatusId $orderStatusId');
  }

  saveButtonStream() {
    return StreamBuilder<int>(
        initialData: orderStatusId,
        stream: radioGroupStream.stream,
        builder: (context, snapshot) {
          print('snapshot.data ${snapshot.data}');
          return AppCupertinoButton(
                      text: strings.save_button,
                      radius: BorderRadius.circular(4),
                      margin: const EdgeInsets.only(bottom: 16),
                      onPressed: (snapshot.data == null || snapshot.data == 0) ? null : () {
                        onSavePressed();
                      },
                    );
        });
  }

  onSavePressed() {
    // Note: isAcceptedForAllProject == true or 1 means that the user has selected all projects
    // Note: isAcceptedForAllProject == false or 2 means that the user has selected some projects
    if (_formKey.currentState!.validate()) {
      onSave(SaveOrderStatusParams(
        id: item.id ?? 0,
        freeLanceId: item.freeLanceId ?? 0,
        description: notesController.text,
        descriptionConnect: notesController.text,
        isAccept: orderStatusId,
        isAllow: true,
        listProject: isAcceptedForAllProject == 1 ? [] : listProject,
        listShift: isAcceptedForAllShift == 1 ? [] : listShift,
        successAprovedLevel: successAprovedLevel,
        isAcceptedForAllProject: isAcceptedForAllProject,
        isAcceptedForAllShift: isAcceptedForAllShift,
      ));
    }
  }

  onMultiSelectProjects(List<CheckboxItem> value){
    listProject = value
        .map((e) => ListProject(projectId: e.id))
        .toList();
    if(listProject!.length == state.projects.length){
      isAcceptedForAllProject = 1;
      isAcceptedForAllShift = 1;
      isShowShiftsStream.setData(false);
    } else {
      isAcceptedForAllProject = 2;
      isAcceptedForAllShift = 2;
      isShowShiftsStream.setData(true);
    }
  }
}
