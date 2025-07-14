import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../../../utils/app_utils.dart';
import '../../../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../../../common/components/files/custom_p_d_f_view.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';

class EmployeeFileItem extends BaseStatelessWidget {
  File? images;
  final int? freelancerId;
  final AttachmentsEmp data;
  final Function(
          RequirementAttachmentPrams requirementAttachmentPrams, File file)?
      onAddEditFile;
  final Function(int requirementAttachmentId, File file)? onAddEditFileUser;
  bool isAdmin;

  EmployeeFileItem(
      {super.key,
      required this.data,
      this.onAddEditFile,
      this.freelancerId,
      this.onAddEditFileUser,
      required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        decoration: Decorations.decorationTabs,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      AppUtils.showMediaPicker(context, onPicker: (files) {
                        images = files;
                        isAdmin == true
                            ? onAddEditFile!(
                                RequirementAttachmentPrams(
                                    freelancerId: freelancerId,
                                    requirementAttachmentId: data.id ?? 0),
                                files)
                            : onAddEditFileUser!(data.id ?? 0, files);
                        setState(() {});
                      });
                    },
                    child: kLoadSvgInCirclePath(AppIcons.edit, color: kBlack)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            widgetImageOrPdf(
                path: data.attachmentExtensionType ?? "",
                url: data.requirementAttachmentPath ?? "",
                context: context),
            SizedBox(
              height: 10,
            ),
            Text(
              data.requirementName ?? "",
              style: kTextMedium.copyWith(fontSize: 14),
            )
          ],
        ),
      );
    });
  }

  widgetImageOrPdf({required String path, required String url, context}) {
    if (images == null || images!.path == "") {
      if (path.contains("pdf")) {
        return InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, Routes.filesPreviewPage,
                  arguments: [url]);
            },
            child: kLoadSvgInCirclePath(AppIcons.pdf, height: 75, width: 100));
      } else if (path.contains("png") ||
          path.contains("jpg") ||
          path.contains("jpeg")) {
        return InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, Routes.filesPreviewPage,
                  arguments: [url]);

            },
            child: kBuildImage(url, width: 100, height: 75));
      } else {
        return kLoadSvgInCirclePath(AppIcons.upload_files,
            width: 70, height: 75);
      }
    } else {
      if (images!.path.contains("pdf")) {
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.fileViewPdfOrImageFromFile,
                  arguments: images);
            },
            child: kLoadSvgInCirclePath(AppIcons.pdf, height: 75, width: 100));
      } else {
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.fileViewPdfOrImageFromFile,
                  arguments: images);
            },
            child: Image.file(images!, height: 75, width: 100));
      }
    }
  }
}
