import 'package:flutter/material.dart';

import '../../../../utils/validate.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../base_stateless_widget.dart';
import '../decorations/decorations.dart';
import '../image_builder.dart';
import '../material_text_field.dart';


class BuildTextFieldItem extends BaseStatelessWidget {
  final String? title;
  final String? hintText;
  final bool isInfoRequired;
  final String? messageTooltip;
  final bool isRequired;
  final void Function()? onTap;
  final void Function(String)? onChanged;
   final bool readOnly;
  final bool isSizedBox;
  final double? heightSizedBox;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? isValidator;
  final AutovalidateMode? autoValidateMode;
  final int? maxLength;
  final TextStyle? titleStyle;
  final Widget? endIconWidget;
  final InputDecoration? inputDecoration;
  final TextStyle? style;
  final bool? isPassword;
  final bool? obscureText;
  final Function()? onTapEndIcon;
  final String? endIcon;
  final double? sizeEndIcon;
  final bool? showCustomEndIcon;
  final int minLines;
  final String? iconTitle;
  final Widget? suffixWidget;
  final double? space;
  final String? prefixIcon;
  BuildTextFieldItem({Key? key, this.title, this.style, this.inputDecoration, this.heightSizedBox, this.autoValidateMode, this.isRequired = false, this.isInfoRequired = false, this.messageTooltip, this.onTap, this.onChanged, this.isSizedBox = true,  this.suffixIcon, this.controller, this.keyboardType, this.validator, this.isValidator = true, this.hintText, this.maxLength, this.titleStyle, this.endIconWidget, this.isPassword = false, this.obscureText = true, this.endIcon, this.onTapEndIcon, this.sizeEndIcon, this.showCustomEndIcon = false, this.minLines = 1, this.iconTitle, this.suffixWidget,this.readOnly=false, this.space, this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool obscureText = this.obscureText ?? true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != null) Row(
          children: [
            if(iconTitle != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 5),
                child: kLoadSvgInCirclePath(
                  iconTitle!,
                  width: 20,
                  height: 20,
                ),
              ),
            Expanded(
              child: Text(
                title ?? '',
                style: titleStyle ?? kTextMedium.copyWith(fontSize: 14, color: kPrimary),
              ),
            ),
            isRequired ?
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                '*',
                style: kTextMedium.copyWith(fontSize: 12, color: kPrimary),
              ),
            ) : const SizedBox(),
            isInfoRequired ?
            Tooltip(
              child: const Icon(
                Icons.info_outline,
                color: kSteal,
                size: 20,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              message: messageTooltip ?? '',
              triggerMode: TooltipTriggerMode.tap,
            )
                : const SizedBox(),
          ],
        ),
        SizedBox(
          height: space ?? (isInfoRequired ? 4 : 8),
        ),
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialTextField(
              keyboardType: keyboardType ?? TextInputType.number,
              key: key,
              minLines: minLines,

              maxLines: isPassword! ? 1 : 5,
              maxLength: maxLength,
              style: style ?? kTextRegular.copyWith(color: kAlmostBlack, fontSize: 14),
              obscureText: isPassword! ? obscureText : false,
              autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
              inputDecoration: inputDecoration ?? kRectangleTextFieldDecoration.copyWith(
                hintText: hintText,
                alignLabelWithHint: true,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                  maxHeight: 100,
                  maxWidth: 100,
                ),
                contentPadding: prefixIcon != null ? const EdgeInsetsDirectional.only(start: 10, top: 10, bottom: 10) : null,
                prefixIcon: prefixIcon != null ? Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 5),
                  child: kLoadSvgInCirclePath(
                    prefixIcon ?? '',
                    height: 20,
                    width: 20,
                  ),
                ) : null,
                suffixIcon: isPassword! ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: obscureText ? kGrey_AA : kPrimary,
                  ),
                  onPressed: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                ) : (suffixIcon != null ? Icon(suffixIcon, color: kPrimary) : suffixWidget),
                errorMaxLines: 2,
              ),

              onTap: onTap,
              readOnly: (onTap != null ? true : readOnly),
              controller: controller,
              onChanged: onChanged,
              validator: isValidator! ?  (validator ?? (value)=> Validate.validateRequired(value, strings.this_field_is_required)) : null,
              endIcon: showCustomEndIcon! ? _CustomEndIcon(
                onTap: onTapEndIcon,
                icon: endIcon!,
                size: sizeEndIcon,
              ) : endIconWidget,
            );
          }
        ),
        isSizedBox ? SizedBox(
          height: heightSizedBox ?? 24,
        ) : const SizedBox(),
      ],
    );
  }
}

class _CustomEndIcon extends StatelessWidget {
  final String icon;
  final double? size;
  final Function()? onTap;

  const _CustomEndIcon({Key? key,  required this.icon, this.size, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.boxDecorationBorder(radius: 3),
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsetsDirectional.only(start: 10, bottom: 2),
      width: 50,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: onTap,
          child: kLoadSvgInCirclePath(icon, height: size ?? 25, width: size ?? 25),
        ),
      ),
    );
  }
}
