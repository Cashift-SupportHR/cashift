import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/buttons/row_buttons.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../data/models/popup_employment_management_dto.dart';

class ResetMobileNumberDialog extends BaseStatelessWidget {
  final UpdateDto popup;
  final Function() onConfirm;

  ResetMobileNumberDialog(
      {Key? key, required this.popup, required this.onConfirm})
      : super(key: key);
  TextEditingController reasonController = TextEditingController();

  StreamStateInitial<bool> isConfirmStream = StreamStateInitial();

  bool isConfirm = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (popup.icon == null)
            kLoadSvgInCirclePath(AppIcons.ban_employee)
          else
            kBuildImage(popup.icon!, border: 0, size: 70),
          SizedBox(height: 10),
          Text(
            popup.headerLabel ?? '',
            style: kTextSemiBold.copyWith(
                fontSize: 22, color: kBlack_3C),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            popup.detailsLabel ?? '',
            style: kTextRegular.copyWith(
                fontSize: 14, color: kGray_64),
            textAlign: TextAlign.center,
          ),
          buttons(context),
        ],
      ),
    );
  }

  Widget buttons(BuildContext context) {
    return RowButtons(
      textCancelButton: popup.canelButtonName,
      textSaveButton: popup.confirmButtonName,
      margin: EdgeInsets.only(top: 40),
      onCancel: () {
        Navigator.pop(context);
      },
      onSave: () {
        onConfirm();
      },
    );
  }
}
