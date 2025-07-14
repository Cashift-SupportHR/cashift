import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button_icon.dart';
import 'package:shiftapp/common/components/buttons/row_buttons.dart';
import 'package:shiftapp/common/components/checkbox/check_box_terms_and_conditions.dart';
import 'package:shiftapp/common/components/checkbox/custom_check_box.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../../../../utils/app_utils.dart';
import '../../../../../../../../../common/components/buttons/row_small_button.dart';
import '../../../../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../../../../common/components/files/custom_p_d_f_view.dart';
import '../../../../../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../../data/models/index.dart';
import '../../../../../../domain/entities/index.dart';

class EmployeeFileItem extends BaseStatelessWidget {
  File? images;
  final int? freelancerId;
  final AttachmentsEmp data;
  int typeIndex;
  final Function(
          RequirementAttachmentPrams requirementAttachmentPrams, File file)?
      onAddEditFile;
  final Function(int requirementAttachmentId, File file)? onAddEditFileUser;
  final Function(
          AcceptOrRejectAttachmentEmpPrams acceptOrRejectAttachmentEmpPrams)
      onAcceptOrRejectAttachment;

  final resonRejectController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  EmployeeFileItem({
    super.key,
    required this.data,
    required this.onAcceptOrRejectAttachment,
    required this.typeIndex,
    this.onAddEditFile,
    this.freelancerId,
    this.onAddEditFileUser,
  });

  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        decoration: Decorations.decorationTabs,
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      color: (data.requirementAttachmentPath == "" ||
                              data.requirementAttachmentPath == null)
                          ? kGray_D7
                          : kOrange00,
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(10),
                        bottomEnd: Radius.circular(10),
                      )),
                  child: Text(
                      (data.requirementAttachmentPath == "" ||
                              data.requirementAttachmentPath == null)
                          ? strings.not_completed
                          : strings.completed,
                      style:
                          kTextRegular.copyWith(color: kWhite, fontSize: 12)),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      if (data.requirementAttachmentPath != "" ||
                          data.requirementAttachmentPath != null) {
                        Navigator.pushNamed(context, Routes.filesPreviewPage,
                            arguments: [data.requirementAttachmentPath ?? ""]);
                      }
                    },
                    child: kLoadSvgInCirclePath(AppIcons.view,
                        color: kBlack, width: 20, height: 20)),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      AppUtils.showMediaPicker(context, onPicker: (files) {
                        images = files;
                        onAddEditFile!(
                            RequirementAttachmentPrams(
                                freelancerId: freelancerId,
                                requirementAttachmentId: data.id ?? 0),
                            files);

                        setState(() {});
                      });
                    },
                    child: kLoadSvgInCirclePath(
                      AppIcons.edit,
                      color: kBlack,
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.requirementName ?? "",
                          style: kTextMedium.copyWith(fontSize: 14),
                        ),
                        if (typeIndex == 1 &&
                            data.isAdded == true &&
                            data.allowEdit == true)
                          RowSmallButton(
                            width: 60,
                            mainAxisAlignment: MainAxisAlignment.start,
                            onCancel: () {
                              showAppModalBottomSheet(
                                  context: context,
                                  isScrollControlled: false,
                                  isDivider: false,
                                  headerWidget: SizedBox(),
                                  child: acceptOrRejectWidget(
                                      isAccept: false,
                                      context: context,
                                      attachmentId: data.id ?? 0,
                                      onAcceptOrRejectAttachment:
                                          onAcceptOrRejectAttachment,
                                      title: strings.pledge_title_reject,
                                      subTitle: strings.pledge_sub_reject));
                            },
                            onSave: () {
                              showAppModalBottomSheet(
                                  context: context,
                                  isScrollControlled: false,
                                  isDivider: false,
                                  headerWidget: SizedBox(),
                                  child: acceptOrRejectWidget(
                                      isAccept: true,
                                      attachmentId: data.id ?? 0,
                                      context: context,
                                      onAcceptOrRejectAttachment:
                                          onAcceptOrRejectAttachment,
                                      title: strings.pledge_title_accept,
                                      subTitle: strings.pledge_sub_accept));
                            },
                            textSave: strings.approval,
                            textCancel: strings.reject,
                            heightSaveButton: 25,
                          ),
                        if (typeIndex == 3 &&
                            data.rejectReason != "" &&
                            data.rejectReason != null)
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
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  widgetImageOrPdf(
                      path: data.attachmentExtensionType ?? "",
                      url: data.requirementAttachmentPath ?? "",
                      context: context),
                ],
              ),
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

  acceptOrRejectWidget(
      {required bool isAccept,
      required String title,
      required String subTitle,
      required int attachmentId,
      required BuildContext context,
      required Function(
              AcceptOrRejectAttachmentEmpPrams acceptOrRejectAttachmentEmpPrams)
          onAcceptOrRejectAttachment}) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SvgPicture.asset(
              AppIcons.ms,
              color: isAccept ? kPrimary : kRed,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: kTextBold.copyWith(fontSize: 14, color: kBlack),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subTitle,
              style: kTextRegular.copyWith(fontSize: 12, color: kBlack),
            ),
            SizedBox(
              height: 10,
            ),
            if (isAccept == false)
              BuildTextFieldItem(
                title: strings.rejection_reason,
                hintText: strings.write_rejection_reason,
                keyboardType: TextInputType.text,
                minLines: 3,
                controller: resonRejectController,
              ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: Decorations.boxDecorationBorder(
                color: isAccept == true
                    ? kPrimary.withOpacity(0.1)
                    : kRed.withOpacity(.1),
                radius: 3,
                borderColor: isAccept == true
                    ? kPrimary.withOpacity(0.1)
                    : kRed.withOpacity(.1),
              ),
              child: isAccept == true
                  ? CustomCheckBox(
                      title: strings.pledge_attachment_accept,
                      value: isAccepted,
                      checkColor: kPrimary,
                      textStyle:
                          kTextRegular.copyWith(color: kPrimary, fontSize: 12),
                      onChanged: (value) {
                        isAccepted = value!;
                      },
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: kRed,
                        ),
                        Expanded(
                          child: Text(
                            strings.pledge_attachment_reject,
                            style:
                                kTextRegular.copyWith(color: kRed, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
            ),
            RowButtons(
              onCancel: () {
                Navigator.pop(context);
              },
              textSaveButton: strings.confirm_button,
              onSave: () {
                if (isAccept == true && isAccepted == false) {
                  handleErrorDialog(strings.please_agree_pledge, context);
                } else {
                  if(_formKey.currentState!.validate()){
                    Navigator.pop(context);
                    onAcceptOrRejectAttachment(AcceptOrRejectAttachmentEmpPrams(
                        freelancerId: freelancerId,
                        attachmentId: attachmentId,
                        rejectReason: resonRejectController.text,
                        statusCode: isAccept == true ? 2 : 3));
                  }

                }
              },
            )
          ],
        ),
      ),
    );
  }
}
