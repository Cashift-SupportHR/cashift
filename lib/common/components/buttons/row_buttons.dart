import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import 'app_cupertino_button.dart';
import '../base/base_stateless_widget.dart';
import '../outlint_button.dart';

class RowButtons extends BaseStatelessWidget {
  final String? textSaveButton;
  final String? textCancelButton;
  final Function()? onSave;
  final Function()? onCancel;
  final EdgeInsetsGeometry? margin;
  Color? strokeColor;
  Color? cancelColor;
  Color? backgroundColor;
  final double? radius;
  RowButtons({Key? key, this.backgroundColor, this.textSaveButton, this.cancelColor, this.strokeColor, this.textCancelButton, this.onSave, required this.onCancel, this.margin, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      child: Row(
        children: [
          Expanded(
            child: AppCupertinoButton(
              onPressed: onSave,
              text: textSaveButton ?? strings.save_button,
              elevation: 0,
              backgroundColor: backgroundColor??kPrimary,
              radius: BorderRadius.circular(radius ?? 5),
              padding: const EdgeInsets.symmetric(vertical: 11),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: AppOutlineButton(
              onClick: onCancel,
              textColor: cancelColor ?? kBlack,
              strokeColor: strokeColor ?? kPrimary,
              text: textCancelButton ?? strings.discard,
              radius: radius ?? 5,
              padding: const EdgeInsets.symmetric(vertical: 15.5),
            ),
          ),
        ],
      ),
    );
  }
}
