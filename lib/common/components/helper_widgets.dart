import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/slide_animation.dart';

import 'package:sizer/sizer.dart';

import 'material_text_field.dart';

Widget buildSearchWidget({required Function(String text) onChange, required String hint, TextEditingController? controller}) {
  return MaterialTextField(
    style: kTextRegular.copyWith(fontSize: 13),
    controller: controller,
    onChanged: onChange,
    inputDecoration: kTextFieldDecoration.copyWith(
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
          child: SvgPicture.asset(
            'images/ic_search.svg',
            width: 15,
            height: 15,
          ),
        ),
        hintText: hint,
        contentPadding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 15,
        ),
        hintStyle: kTextRegular.copyWith(fontSize: 10.sp, color: kBattleShipGrey)),
  );
}

Future showAppModalBottomSheet({
  required BuildContext context,
  bool? isScrollControlled = true,
  required Widget child,
  String? title,
  double? topMargin,
  TextStyle? titleStyle,
  Widget? titleWidget,
  EdgeInsetsGeometry? titlePadding,
  EdgeInsetsGeometry? padding,
  double? radius,
  bool isCloseButton = true,
  bool? isDivider = true,
  bool? isDismissible = true,
  bool? enableDrag = true,
  Widget? headerWidget,
  Color? backgroundColor,
}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled == true,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      constraints: isScrollControlled == true ? null : const BoxConstraints(maxHeight: 500),
      backgroundColor: backgroundColor ?? Colors.transparent,
      builder: (BuildContext builder) {
        return SlideAnimationWidget(
          child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(radius ?? 30.0), topRight: Radius.circular(radius ?? 30.0))),
              margin: isScrollControlled == true ? EdgeInsets.only(top: topMargin ?? 100) : EdgeInsets.zero,
              child: Column(
                children: [
                  headerWidget ??
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: titlePadding ?? const EdgeInsetsDirectional.only(start: 40),
                                child: titleWidget ??
                                    Text(
                                      title ?? '',
                                      style: titleStyle ?? kTextSemiBold.copyWith(fontSize: 18.sp),
                                      textAlign: TextAlign.center,
                                    ),
                              )),
                              isCloseButton
                                  ? CloseButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          isDivider!
                              ? const Divider(
                                  color: kSilverThree,
                                )
                              : const SizedBox(),
                        ],
                      ),
                  Expanded(
                    child: Padding(
                      padding: padding ?? const EdgeInsetsDirectional.only(start: 16, end: 16, top: 20),
                      child: child,
                    ),
                  ),
                ],
              )),
        );
      });
}

Widget loadSvgIcon(String s) {
  return kLoadSvgIcon(s);
}

showAppDialog(BuildContext context, {required Widget child, double? height, double? width}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        TextButton(
          child: Text("اغلاق"),
          onPressed: () {

            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ],
      insetPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
      backgroundColor: Colors.white,
      content: child,
    ),
  );
}
