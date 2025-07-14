import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/profile/attachment/widget/attachment_emp_item.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../adminFeatures/employees/data/models/requirement_attachment_prams.dart';
import '../../../../adminFeatures/employees/domain/entities/AttachmentsEmp.dart';

class AttachmentEmpScreen extends BaseStatelessWidget {
  final Function(
          RequirementAttachmentPrams requirementAttachmentPrams, File file)?
      onAddEditFile;
  final Function(int requirementAttachmentId, File file)? onAddEditFileUser;
  int? freelancerId;
  final List<AttachmentsEmp> data;
int tabIndex;
  AttachmentEmpScreen({
    super.key,
    this.freelancerId,
    this.onAddEditFileUser,
    this.onAddEditFile,
    required this.data,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: data.length,
      itemBuilder: (context, index) => AttachmentEmployeeItem(
        data: data[index],
        onAddEditFile: onAddEditFile,

        tabIndex: tabIndex,
        onAddEditFileUser: onAddEditFileUser,
      ),
    );
  }
}
