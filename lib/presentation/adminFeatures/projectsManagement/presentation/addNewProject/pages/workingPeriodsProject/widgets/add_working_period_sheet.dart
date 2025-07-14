import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/workingPeriodsProject/widgets/period_order_picker.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../../../utils/app_utils.dart';
import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/buttons/row_buttons.dart';
import '../../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';
import 'jobs_picker.dart';

///  Created by harbey on 7/25/2023.
class AddWorkingPeriodSheet extends BaseStatelessWidget {
  final InitializedAddWorkingPeriod state;
  final Function(AddWorkingPeriodParams) onAddPeriod;

  AddWorkingPeriodSheet({Key? key, required this.state, required this.onAddPeriod}) : super(key: key);

  TextEditingController periodNameArController = TextEditingController();
  TextEditingController periodNameEnController = TextEditingController();
  TextEditingController workingHoursController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController contractualPowerNumberController = TextEditingController();

  String startTime = '';
  int periodOrderId = 0;
  int occupationId = 0;
  final _formKey = GlobalKey<FormState>();
  WorkingPeriodLabels? labels;
  @override
  Widget build(BuildContext context) {
    _initialValues(context);
    labels = state.labels;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          color: kWhite,
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              PeriodOrderPicker(
                title: labels?.shiftHead,
                hintText: labels?.hintShiftHead,
                initialValue: state.workingPeriodInfo.shiftHeadName,
                items: state.periodOrder,
                onSelectItem: (item) {
                  periodOrderId = item.index;
                },
              ),
              BuildTextFieldItem(
                title: labels?.nameAr ?? strings.period_name_ar,
                hintText: labels?.hintNameAr ?? strings.write_period_name,
                keyboardType: TextInputType.name,
                controller: periodNameArController,
              ),
              BuildTextFieldItem(
                title: labels?.nameEn ?? strings.period_name_en,
                hintText: labels?.hintNameEn ?? strings.write_period_name,
                keyboardType: TextInputType.name,
                controller: periodNameEnController,
              ),
              JobsPicker(
                title: labels?.job,
                hintText: labels?.hintJob,
                initialValue: state.workingPeriodInfo.jobName,
                items: state.occupations,
                onSelectItem: (item) {
                  occupationId = item.index;
                },
              ),
              hoursCountShiftTextField(),
              startTimeTextField(context),
              contractualPowerTextField(),
              RowButtons(
                radius: 25,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 20),
                onSave: () {
                  if (_formKey.currentState!.validate()) {
                    onSavePressed();
                  }
                },
                onCancel: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  BuildTextFieldItem hoursCountShiftTextField(){
    return BuildTextFieldItem(
      title: labels?.hoursCountShift ?? strings.working_hours_num,
      hintText: labels?.hintHoursCountShift ?? '',
      controller: workingHoursController,
    );
  }

  BuildTextFieldItem startTimeTextField(BuildContext context){
    return BuildTextFieldItem(
      title: labels?.startTime ?? strings.beginning_work,
      hintText: labels?.hintStartTime,
      keyboardType: TextInputType.name,
      controller: startTimeController,
      suffixIcon: Icons.access_time,
      onTap: () => onShowTimeDayPicker(context),
    );
  }

  BuildTextFieldItem contractualPowerTextField(){
    return BuildTextFieldItem(
      title: labels?.contractualName ?? strings.contractual_power_number,
      hintText: labels?.hintContractualName ?? strings.type_contractual_power_number,
      controller: contractualPowerNumberController,
    );
  }

  onShowTimeDayPicker(BuildContext context) async {
    AppUtils.showTimeDayPicker(context, initialTime: DateFormatter.parseTimeOfDay(state.workingPeriodInfo.startTime ?? ''), onConfirm: (value) {
      print(value.toString());
      startTime = '${value.hour}:${value.minute}';
      startTimeController.text = value.format(context);
    });
  }

  _initialValues(BuildContext context) {
    periodNameArController.text = state.workingPeriodInfo.shiftAr ?? '';
    periodNameEnController.text = state.workingPeriodInfo.shiftEn ?? '';
    workingHoursController.text = state.workingPeriodInfo.hoursCount?.toString() ?? '';
    startTimeController.text = state.workingPeriodInfo.startTime == null ? '' : DateFormatter.parseTimeOfDay(state.workingPeriodInfo.startTime ?? '').format(context);
    startTime = state.workingPeriodInfo.startTime ?? '';
    periodOrderId = state.workingPeriodInfo.shiftHeadId ?? 0;
    occupationId = state.workingPeriodInfo.jobId ?? 0;
    contractualPowerNumberController.text = state.workingPeriodInfo.contractualNumber?.toString() ?? '';
  }

  onSavePressed() {
    onAddPeriod(
      AddWorkingPeriodParams(
        id: state.workingPeriodInfo.id ?? 0,
        projectId: state.workingPeriodInfo.projectId ?? 0,
        startTime: startTime,
        jobId: occupationId,
        shiftHeadId: periodOrderId,
        shiftAr: periodNameArController.text,
        shiftEn: periodNameEnController.text,
        hoursCount: int.parse(workingHoursController.text),
        jobName: '',
        shiftHeadName: '',
        contractualNumber: int.parse(contractualPowerNumberController.text),
      ),
    );
  }

}
