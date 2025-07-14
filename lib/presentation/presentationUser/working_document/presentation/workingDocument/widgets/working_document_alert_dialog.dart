import 'package:flutter/material.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../../common/domain/entities/job_offers/check_working_document.dart';
import '../../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/image_builder.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import '../pages/working_document_page.dart';

showWorkingDocumentDialog(BuildContext context, {required int jobId, required CheckWorkingDocument data}) {
  showDialog(
    context: context,
    builder: (context) {
      return WorkingDocumentAlertDialog(
        jobId: jobId,
        data: data,
      );
    },
  );
}

///  Created by harbey on 8/26/2023.
class WorkingDocumentAlertDialog extends BaseStatelessWidget {
  final int jobId;
  final CheckWorkingDocument data;

  WorkingDocumentAlertDialog({Key? key, required this.jobId, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.only(bottom: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kBuildImage(
            data.icon ?? '',
            border: 0,
            size: 80,
          ),
          SizedBox(height: 16),
          Text(
            data.description ?? '',
            style: kTextSemiBold.copyWith(fontSize: 18, color: kBlack_3C),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            data.notes ?? '',
            style: kTextMedium.copyWith(fontSize: 12, color: kGray_78),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        AppCupertinoButton(
          text: strings.click_here,
          radius: BorderRadius.circular(4),
          margin: EdgeInsets.symmetric(horizontal: 30),
          onPressed: () {
            Navigator.pushNamed(context,  Routes.workingDocumentPage, arguments: jobId);
          },
        ),
      ],
    );
  }
}
