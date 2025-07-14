import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/buttons/row_buttons.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../common/domain/entities/required_tasks/confirm_attendance.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../../shared/components/texts/list_row_texts_icons.dart';

class ConfirmAttendanceDialog extends BaseStatelessWidget {
  final ConfirmAttendance data;
  final Function(String, bool) onConfirm;

  ConfirmAttendanceDialog(
      {Key? key, required this.onConfirm, required this.data})
      : super(key: key);
  TextEditingController reasonController = TextEditingController();

  StreamStateInitial<bool> isConfirmStream = StreamStateInitial();

  bool isConfirm = true;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.only(bottom: 20),
      content: SingleChildScrollView(
        child: Container(
          color: kWhite,
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    strings.confirm_attendance,
                    style: kTextSemiBold.copyWith(fontSize: 25, color: kPrimary),
                    textAlign: TextAlign.center,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: StreamBuilder<bool>(
                      initialData: isConfirm,
                      stream: isConfirmStream.stream,
                      builder: (context, snapshot) {
                        return snapshot.data == false ? BackButton(
                          color: kPrimary,
                          onPressed: () {
                            isConfirm = !isConfirm;
                            isConfirmStream.setData(isConfirm);
                          },
                        ) : SizedBox.shrink();
                      }
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              kBuildImage(
                data.iconLogo ?? '',
                size: 80,
              ),
              SizedBox(height: 15),
              StreamBuilder(
                initialData: isConfirm,
              stream: isConfirmStream.stream,
              builder: (context, snapshot) {
                isConfirm = snapshot.data ?? true;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    descriptionText(isConfirm),
                    SizedBox(height: 15),
                    if (isConfirm) opportunityInfo(context),
                    SizedBox(height: 14),
                    if (!isConfirm) reasonTextField(),
                    !isConfirm
                        ? AppCupertinoButton(
                            onPressed: () {
                              onConfirm(reasonController.text, isConfirm);
                            },
                            text: strings.confirm_button,
                            elevation: 0,
                            radius: BorderRadius.circular(5),
                            padding: const EdgeInsets.symmetric(vertical: 11),
                          )
                        : RowButtons(
                            textCancelButton: strings.apology,
                            textSaveButton: strings.attendance_confirm,
                            strokeColor: kOrange00,
                            cancelColor: kOrange00,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            onCancel: () {
                              isConfirm = !isConfirm;
                              isConfirmStream.setData(isConfirm);
                            },
                            onSave: () {
                              onConfirm('', isConfirm);
                            },
                          ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget opportunityInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: Decorations.boxDecorationBorder(
          color: kWhite, radius: 8, borderWidth: .5, borderColor: kPrimary),
      child: ListRowTextsIcons(
        icons: [
          AppIcons.nameMole,
          AppIcons.clockOutline,
          AppIcons.calendarOutline,
        ],
        titles: [
          strings.project_name,
          strings.opportunity_time,
          "${strings.opportunity_date} :",
        ],
        values: [
          data.projectName ?? '',
          DateFormatter.parseTimeOfDay(data.opportunitiesStrartTime.toString()).format(context) +
              " - " +
              DateFormatter.parseTimeOfDay(data.opportunitiesEndTime.toString()).format(context),
          DateFormatter.repairApiDate(data.workingDate ?? ''),
        ],
      ),
    );
  }

  Widget descriptionText(isConfirm) {
    return Text(
      isConfirm ? data.description ?? '' : strings.why_not_attended,
      style: kTextMedium.copyWith(fontSize: 16, color: kBlack.withOpacity(0.5)),
      textAlign: TextAlign.center,
    );
  }

  Widget reasonTextField() {
    return BuildTextFieldItem(
      title: strings.write_reason_apology,
      controller: reasonController,
      keyboardType: TextInputType.text,
      hintText: strings.write_reason_apology,
      validator: (value) {
        if (value!.isEmpty) {
          return strings.write_reason_apology;
        }
      },
      minLines: 3,
    );
  }
}
