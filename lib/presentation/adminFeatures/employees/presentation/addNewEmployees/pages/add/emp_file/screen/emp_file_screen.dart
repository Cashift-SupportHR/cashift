import 'dart:io';

 import 'package:flutter/material.dart';
 import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../../../common/components/buttons/row_buttons.dart';
import '../../../../../../data/models/index.dart';
import '../../../../../../domain/entities/index.dart';
 import '../widget/emp_file_item.dart';

class EmployeeFileScreen extends BaseStatelessWidget {
  final Function() onPrevious;
  final Function() onNext;
  final Function(
          RequirementAttachmentPrams requirementAttachmentPrams, File file)?
      onAddEditFile;
  final Function(int requirementAttachmentId, File file)? onAddEditFileUser;
  int? freelancerId;
  int typeIndex;
  final List<AttachmentsEmp> data;
  bool isEdit;
  final Function(AcceptOrRejectAttachmentEmpPrams acceptOrRejectAttachmentEmpPrams ) onAcceptOrRejectAttachment;


  EmployeeFileScreen(
      {super.key,
      this.freelancerId,
      required this.onAcceptOrRejectAttachment,

      required this.typeIndex,
      required this.isEdit,
      this.onAddEditFileUser,
      this.onAddEditFile,
      required this.data,
      required this.onPrevious,
      required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        bottomNavigationBar: isEdit == true
            ? SizedBox()
            : RowButtons(
                textSaveButton: strings.next,
                textCancelButton: strings.previous,
                onSave: () {
                  onNext();
                },
                onCancel: () {
                  onPrevious();
                },
              ),
        body:ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),

          itemCount: data.length,
          itemBuilder: (context, index) => EmployeeFileItem(
              data: data[index],
              onAddEditFile: onAddEditFile,
            typeIndex: typeIndex,
              freelancerId: freelancerId,

            onAddEditFileUser:onAddEditFileUser, onAcceptOrRejectAttachment: onAcceptOrRejectAttachment ,

          ),
        ));
  }
}
