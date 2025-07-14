import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../common/components/base/base_stateless_widget.dart';
import '../../resources/colors.dart';


class AttendanceFingerprintDialog extends BaseStatelessWidget {
  final int id;
  final Function() onPressed;
  AttendanceFingerprintDialog({Key? key, required this.id, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(strings.attendance_fingerprint, style: kTextSemiBold.copyWith(fontSize: 24, color: kPrimary), textAlign: TextAlign.center),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      buttonPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kLoadSvgInCirclePath(
            AppIcons.qrCodeBorder,
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 20),
          Text(strings.attendance_fingerprint_desc, style: kTextMedium.copyWith(fontSize: 12, color: kBlack.withOpacity(0.5))),
        ],
      ),
      actions: [
       AppCupertinoButton(
         text: strings.scan_now,
         radius: BorderRadius.circular(4),
         margin: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
         onPressed: () {
         //  Navigator.pop(context);
            onPressed();
         },
       ),
      ],
    );
  }
}
