import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

class MaterialTextField extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final bool? obscureText;
  final bool? enableInteractiveSelection;
  final bool? readOnly;
  final Color? color;
  final int maxLines;
  final int? minLines;
  final Widget? endIcon;
  final GestureTapCallback? onTap;
  final String? initialValue;
  final InputDecoration? inputDecoration;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  const MaterialTextField({
    Key? key,
    this.style,
    this.inputFormatters,
    this.enableInteractiveSelection,
    this.controller,
    this.margin,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.focusNode,
    this.inputDecoration,
    this.keyboardType,
    this.onChanged,
    this.initialValue,
    this.enabled,
    this.color,
    this.obscureText,
    this.textInputAction = TextInputAction.next,
    this.endIcon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin != null ? margin! : EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              key: key,
              textInputAction: textInputAction,
              initialValue: initialValue,
              controller: controller,
              autovalidateMode: autovalidateMode,
              validator: validator,
              onTap: onTap,
              inputFormatters: inputFormatters,
              maxLength: maxLength,

              enableInteractiveSelection: enableInteractiveSelection ?? true,
              enabled: enabled,
              cursorColor: kPrimary,
              style: style ?? kTextRegular.copyWith(color: kAlmostBlack),
              maxLines: maxLines,
              minLines: minLines,
              readOnly: readOnly == true,
              autofocus: false,
              showCursor: readOnly == true ? false : true,
              obscureText: obscureText == true,
              cursorHeight: 16,
              onChanged: onChanged,
              keyboardType: keyboardType,
              decoration: inputDecoration != null ? inputDecoration! : kTextFieldDecoration,
            ),
          ),
          endIcon != null ? endIcon! : Container(),
        ],
      ),
    );
  }
}

class MaterialTextFieldWithCard extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final bool? obscureText;
  final bool? enableInteractiveSelection;
  final bool? readOnly;
  final Color? color;
  final int maxLines;
  final Widget? startIcon;
  final Widget? suffix;
  final GestureTapCallback? onTap;
  final String? initialValue;
  final String? hintText;
  final InputDecoration? inputDecoration;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  const MaterialTextFieldWithCard(
      {Key? key,
      this.style,
      this.inputFormatters,
      this.enableInteractiveSelection,
      this.controller,
      this.margin,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.validator,
      this.focusNode,
      this.inputDecoration,
      this.keyboardType,
      this.suffix,
      this.onChanged,
      this.initialValue,
      this.enabled,
      this.color,
      this.hintText,
      this.obscureText,
      this.textInputAction = TextInputAction.next,
      this.startIcon,
      this.onTap,
      this.readOnly = false,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin != null ? margin! : EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: kSilver, width: 0.5)),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                key: key,
                textInputAction: textInputAction,
                initialValue: initialValue,
                controller: controller,
                autovalidateMode: autovalidateMode,
                validator: validator,
                onTap: onTap,
                inputFormatters: inputFormatters,
                enableInteractiveSelection: enableInteractiveSelection ?? true,
                enabled: enabled,
                cursorColor: kPrimary,
                style: style ?? kTextRegular.copyWith(color: kAlmostBlack),
                maxLines: maxLines,
                readOnly: readOnly == true,
                autofocus: false,
                showCursor: readOnly == true ? false : true,
                obscureText: obscureText == true,
                cursorHeight: 16,
                onChanged: onChanged,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                    filled: false,
                    hintText: hintText,
                    hintStyle: kTextLabelFontDark.copyWith(fontSize: 14, color: kSilver),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kWhite),
                    ),
                    suffix: suffix,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kWhite, width: 1.1, style: BorderStyle.solid),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kWhite, width: 1.1, style: BorderStyle.solid),
                    )),
              ),
            ),
            startIcon != null ? startIcon! : Container(),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
