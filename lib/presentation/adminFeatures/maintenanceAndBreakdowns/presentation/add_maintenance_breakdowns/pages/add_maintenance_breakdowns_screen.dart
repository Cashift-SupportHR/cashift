import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../presentationUser/workHazards/presentation/addWorkHazard/widgets/upload_files_list.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../common/components/buttons/row_buttons.dart';
import '../../../../../shared/components/dropdown_filed.dart';
import '../../../../../shared/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../shared/components/underline_widget.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/add_maintenance_prams.dart';
import '../../../domain/entities/maintenance.dart';

class AddMaintenanceBreakdownsScreen extends BaseStatelessWidget {
  final List<CommonListItem> data;
  int? roundTripId;
  Function(AddMaintenancePrams params, List<File> filesAfter,
      List<File> fileBefore) onSave;
  AddMaintenanceBreakdownsScreen({
    Key? key,
    required this.data,
    required this.roundTripId,
    required this.onSave,
  }) : super(key: key);

  int? typeId;
  TextEditingController descriptionController = TextEditingController();

  List<File> afterFile = [];
  List<File> beforeFile = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(strings.add_breakdown,
                  style: kTextBold.copyWith(color: kPrimary, fontSize: 13)),
              UnderlineWidget(width: 80),
              SizedBox(
                height: 20,
              ),
              buildTypeMaintenanceDropdown(),
              buildDescriptionTextField(),
              Text(
                strings.image_before_maintenance,
                style: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
              ),
              SizedBox(
                height: 5,
              ),
              UploadFilesList(
                initialValueList: [],
                onPicker: (filesValue) {
                  beforeFile = filesValue;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                strings.image_after_maintenance,
                style: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
              ),
              SizedBox(
                height: 5,
              ),
              UploadFilesList(
                initialValueList: [],
                onPicker: (filesValue) {
                  afterFile = filesValue;
                },
              ),
              SizedBox(
                height: 40,
              ),
              buildRowButtons(context),
            ],
          )),
    );
  }

  BottomSheetTextFieldRectangle buildTypeMaintenanceDropdown() {
    return BottomSheetTextFieldRectangle(
      title: strings.type_operation,
      hintText: strings.select,
      items: CommonListItem.toItemsListPicker(data),
      onSelectItem: (Item position) {
        typeId = position.index;
      },
    );
  }

  BuildTextFieldItem buildDescriptionTextField() {
    return BuildTextFieldItem(
      title: strings.description,
      hintText: strings.description,
      controller: descriptionController,
      minLines: 4,
      keyboardType: TextInputType.text,
    );
  }

  RowButtons buildRowButtons(BuildContext context) {
    return RowButtons(
      textSaveButton: strings.add,
      textCancelButton: strings.cancel_button,
      onSave: () {
          if (formKey.currentState!.validate()) {
        if (beforeFile.isEmpty) {
        showErrorDialog(strings.shod_image_after_maintenance, context);
        } else if (afterFile.isEmpty) {
        showErrorDialog(strings.shod_image_before_maintenance, context);
        }else{
          onSave(
              AddMaintenancePrams(
                  id: 0,
                  description: descriptionController.text,
                  faultMaintainceTypeId: typeId,
                  roundTripId: roundTripId),
              afterFile,
              beforeFile);
        }

        }
      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }
}
