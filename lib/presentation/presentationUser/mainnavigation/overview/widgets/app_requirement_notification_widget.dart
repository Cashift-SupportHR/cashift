import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

class InAppRequirementNotification extends BaseStatelessWidget {
  final String message;
  final Widget? title;
  final String? buttonName;
  final Function()? onSubmit;
  /**
  * this called only in case confirmation buttons
   * **/
  final Function? onReject;

  InAppRequirementNotification(
      {required this.message,
      this.buttonName,
      this.title,
       this.onSubmit,
      this.onReject});

  @override
  Widget build(BuildContext context) {
    return inAppRequirementItem();
  }

  Widget inAppRequirementItem() {
    return Container(
        margin: EdgeInsets.only(bottom: 8),
        padding:
            const EdgeInsetsDirectional.only(start: 20, bottom: 12, top: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: (Colors.red).withOpacity(0.10)),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    title ?? Container(),
                    Text(
                      message,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: kTextLabelFontDark.copyWith(
                          fontSize: 12, color: Colors.red),
                    ),
                  ],
                )),
            buttonName == null
                ? confirmationButtons()
                : onSubmit != null ?AppCupertinoButton(
                  text: buttonName,
                  backgroundColor: kLipStick,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  radius: BorderRadius.circular(10),
                  textStyle: kTextMedium.copyWith(
                      fontSize: 12, color: Colors.white),
                  onPressed: onSubmit,
                ) : SizedBox(),
            SizedBox(
              width: 8,
            )
          ],
        ));
  }

  Widget confirmationButtons() {
    return Row(
      children: [
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: 40, minHeight: 30, minWidth: 30),
          child: AppCupertinoButton(
            child: Icon(Icons.done),
            backgroundColor: kLipStick,
            elevation: 0,
            padding: EdgeInsets.zero,
            radius: BorderRadius.circular(10),
            textStyle: kTextMedium.copyWith(fontSize: 12, color: Colors.white),
            onPressed: () {
              if (onSubmit != null){
                onSubmit!();
              }
            },
          ),
        ),
        SizedBox(
          width: 4,
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: 40, minHeight: 30, minWidth: 30),
          child: AppCupertinoButton(
            child: SvgPicture.asset(
              Assets.imagesIcClose,
              color: Colors.white,
            ),
            backgroundColor: Colors.grey.withOpacity(0.3),
            elevation: 0,
            padding: EdgeInsets.zero,
            radius: BorderRadius.circular(10),
            textStyle: kTextMedium.copyWith(fontSize: 12, color: Colors.white),
            onPressed: () {
              if (onReject != null) {
                onReject!();
              }
            },
          ),
        ),
      ],
    );
  }
}
