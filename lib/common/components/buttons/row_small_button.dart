import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import 'app_cupertino_button.dart';
import '../base/base_stateless_widget.dart';
import '../outlint_button.dart';

class RowSmallButton extends BaseStatelessWidget {
  final String? textCancel;
  final String? textSave;
  final Function()? onCancel;
  final Function()? onSave;
  final bool? isShowCancelButton1;
  final bool? isShowSaveButton2;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final double? radius;
  final double? heightSaveButton;
  final double? width;
  RowSmallButton({Key? key, this.width, this.textCancel, this.textSave, this.padding, this.onCancel, this.onSave, this.isShowCancelButton1 = true, this.isShowSaveButton2 = true, this.mainAxisAlignment, this.radius, this.heightSaveButton, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
        children: [
          if(isShowSaveButton2!)
          SizedBox(
            width: width??100,
            child: AppCupertinoButton(
              onPressed: onSave,
              text: textSave ?? strings.save_button,
              elevation: 0,
              height: heightSaveButton,
              radius: BorderRadius.circular(radius ?? 8),
              textStyle: kTextBold.copyWith(
                fontSize: 12,
                color: kWhite,
              ),
              padding: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          if(isShowCancelButton1!)
          SizedBox(
            width: width??100,
            child: AppOutlineButton(
              onClick: onCancel,
              text: textCancel ?? strings.cancel_button,
              radius: radius ?? 8,
              textStyle: kTextBold.copyWith(
                fontSize: 12,
                color: kRed_3B,
              ),
              height: heightSaveButton,
              strokeColor: kRed_19.withOpacity(0.4),
              padding:  const EdgeInsets.symmetric( vertical: 5.5),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
