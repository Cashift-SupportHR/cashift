import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../../../utils/app_utils.dart';
import '../../../../adminFeatures/employees/data/models/requirement_attachment_prams.dart';
import '../../../../adminFeatures/employees/domain/entities/AttachmentsEmp.dart';
import '../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../common/components/decorations/decorations.dart';

class AttachmentEmployeeItem extends BaseStatelessWidget {
  File? images;
  final int tabIndex;
  final AttachmentsEmp data;
  final Function(
          RequirementAttachmentPrams requirementAttachmentPrams, File file)?
      onAddEditFile;
  final Function(int requirementAttachmentId, File file)? onAddEditFileUser;

  AttachmentEmployeeItem({
    super.key,
    required this.data,
    this.onAddEditFile,
    required this.tabIndex,
    this.onAddEditFileUser,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        decoration: Decorations.decorationTabs,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      if (data.requirementAttachmentPath != "" ||
                          data.requirementAttachmentPath != null) {
                        Navigator.pushNamed(context, Routes.filesPreviewPage,
                            arguments: [data.requirementAttachmentPath ?? ""]);
                      }
                    },
                    child: kLoadSvgInCirclePath(AppIcons.view, color: kBlack,height: 25,width: 25)),

              SizedBox(width: 20,),
                if (data.allowEdit == true)
                  InkWell(
                      onTap: () {
                        AppUtils.showMediaPicker(context, onPicker: (files) {
                          images = files;
                          onAddEditFileUser!(data.id ?? 0, files);
                          setState(() {});
                        });
                      },
                      child:
                          kLoadSvgInCirclePath(AppIcons.edit, color: kBlack)),
              ],
            ),
            Row(
              children: [

                 widgetImageOrPdf(
                    path: data.attachmentExtensionType ?? "",
                    url: data.requirementAttachmentPath ?? "",
                    context: context),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.requirementName ?? "",
                      style: kTextMedium.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (tabIndex == 3 && data.rejectReason != ""&& data.rejectReason != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info,
                            color: kRed_01,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            data.rejectReason ?? "",
                            style: kTextRegular.copyWith(
                                fontSize: 11, color: kRed_01),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            // if (data.allowEdit == true)
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       SizedBox(
            //         width: 100,
            //         child: AppCupertinoButton(
            //           onPressed: () {
            //             AppUtils.showMediaPicker(context, onPicker: (files) {
            //               images = files;
            //               onAddEditFileUser!(data.id ?? 0, files);
            //               setState(() {});
            //             });
            //           },
            //           text: strings.update_button,
            //           elevation: 0,
            //           height: 30,
            //           radius: BorderRadius.circular(15),
            //           textStyle: kTextBold.copyWith(
            //             fontSize: 12,
            //             color: kWhite,
            //           ),
            //           padding: const EdgeInsets.symmetric(vertical: 5),
            //         ),
            //       ),
            //     ],
            //   ),
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
              Navigator.pushNamed(context, Routes.filesPreviewPage,
                  arguments: [url]);
            },
            child: kLoadSvgInCirclePath(AppIcons.pdf, height: 40, width: 60));
      } else if (path.contains("png") ||
          path.contains("jpg") ||
          path.contains("jpeg")) {
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.filesPreviewPage,
                  arguments: [url]);
            },
            child: kBuildImage(url, width: 60, height: 40));
      } else {
        return kLoadSvgInCirclePath(AppIcons.upload_files,
            width: 50, height: 40);
      }
    } else {
      if (images!.path.contains("pdf")) {
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.fileViewPdfOrImageFromFile,
                  arguments: images);
            },
            child: kLoadSvgInCirclePath(AppIcons.pdf, height: 40, width: 50));
      } else {
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.fileViewPdfOrImageFromFile,
                  arguments: images);
            },
            child: Image.file(images!, height: 40, width: 50));
      }
    }
  }
}
