import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../core/utils/app_icons.dart';
import '../text_field/build_text_field_item.dart';
import '../../../adminFeatures/employmentManagement/data/models/popup_employment_management_dto.dart';
import '../base_stateless_widget.dart';

class BlockEmployeeDialog extends BaseStatelessWidget {
  final BlockDto popup;
  final Function(String) onConfirm;

  BlockEmployeeDialog({Key? key, required this.popup, required this.onConfirm}) : super(key: key);
  TextEditingController reasonController = TextEditingController();

  StreamStateInitial<bool> isConfirmStream = StreamStateInitial();

  bool isConfirm = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(15),
      contentPadding: EdgeInsets.all(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: kWhite,
      titlePadding: EdgeInsets.zero,
      title: Container(
        width: 600,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            PositionedDirectional(end: 0, top: 0, child: CloseButton()),
            popup.icon != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: kBuildImage(popup.icon!, size: 50, fit: BoxFit.cover, border: 0),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: kLoadSvgInCirclePath(AppIcons.ban_employee),
                  ),
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          reasonTextField(),
          confirmButton(context, isConfirm),
        ],
      ),
    );
  }

  Widget reasonTextField() {
    return BuildTextFieldItem(
      title: strings.type_reason_ban,
      controller: reasonController,
      keyboardType: TextInputType.text,
      hintText: strings.type_reason,
      validator: (value) {
        if (value!.isEmpty) {
          return strings.write_reason_apology;
        }
      },
      minLines: 3,
    );
  }

  Widget confirmButton(BuildContext context, bool isConfirm) {
    return AppCupertinoButton(
      onPressed: () {
        onConfirm(reasonController.text);
      },
      text: popup.confirmButtonName ?? strings.save_button,
      elevation: 0,
      radius: BorderRadius.circular(5),
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 11),
    );
  }
}
