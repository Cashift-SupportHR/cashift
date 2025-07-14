import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shiftapp/common/domain/entities/resume/resume.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_component_data.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_widget.dart';
import 'package:shiftapp/presentation/shared/components/error_handler_widget.dart';
import 'package:shiftapp/presentation/shared/components/loading_widget.dart';
import 'package:shiftapp/presentation/shared/components/material_text_field.dart';
import 'package:shiftapp/presentation/shared/components/outlint_button.dart';

import '../../resources/colors.dart';

abstract class BaseResumeWidget<T> extends BaseWidget {
  final ResumeComponentData resumeComponentData;
  final ScrollController controller;
  final Function? onBack;
  final bool isLastStep;

  Stream<bool> get haveFillData => _haveFillData.stream;
  final _haveFillData = BehaviorSubject<bool>();


  final labelStyle = kTextMedium.copyWith(fontSize: 14, color: kFontDark);
  final itemDecoration = kTextFieldDecoration;
  final labelFloatStyle = kTextLabelFontDark.copyWith(color: kAccent);
  ResumeBloc? resumeBloc;
  BaseResumeWidget(
      {Key? key,
      required this.resumeComponentData,
      required this.controller,
      this.onBack,
      this.isLastStep = false})
      : super(key: key);

  Resume resume() => resumeComponentData.resume;

  @protected
  Widget buildResumeWidget(BuildContext context, T? model);

  @protected
  onClickSubmit();

  @protected
  validate();

  void loadInitialData(ResumeBloc bloc) {}

  @protected
  Stream<T> setStream();

  @override
  Widget buildWidget(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (resumeComponentData.resume.isCompleted()) {
        WidgetsBinding.instance.addPostFrameCallback((_) => validate());
      }
    });
    resumeBloc = BlocProvider.of<ResumeBloc>(context);
    loadInitialData(resumeBloc!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: SingleChildScrollView(
            controller: controller,
            child: StreamBuilder<T>(
                stream: setStream(),
                builder: (context, snapshot) {
                  print('Base StreamBuilder $snapshot');
                  return snapshot.data != null
                      ? buildResumeWidget(context, snapshot.data)
                      : snapshot.hasError
                          ? SizedBox(
                              height: 500,
                              child: ErrorPlaceHolderWidget(
                                exception: snapshot.error,
                              ))
                          : SizedBox(height: 500, child: LoadingView());
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 16, bottom: 24),
          child: Row(
            children: [
              onBack != null
                  ? Expanded(
                      child: AppOutlineButton(
                        onClick: () {
                          onBack!();
                        },
                        radius: 20,
                        padding: EdgeInsets.all(16),
                        text: strings.previous_button,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: StreamBuilder<bool>(
                    stream: haveFillData,
                    initialData: false,
                    builder: (context, snapshot) {
                      return AppCupertinoButton(
                        text: isLastStep
                            ? strings.save_button
                            : strings.next_button,
                        onPressed: snapshot.data == false
                            ? null
                            : () {
                                onClickSubmit();
                                kHideKeyboard();
                              },
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget militaryServiceDisclosureText(){
    return RichText(
      textAlign: TextAlign.start,
      softWrap: true,
      text: TextSpan(
        text: strings.military_service_disclosure ,
        style:
        kTextMedium.copyWith(
          fontSize: 13,color: kDullOrange,
        ),
        children: [
          TextSpan(
            text: strings.clicking_check_mark_means_you_agree,
            style:  kTextMedium.copyWith(
              color: kPrimary,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
  validateForm(bool isValid) {
    _haveFillData.sink.add(isValid);
  }

  Widget buildTextFieldItemClickable(
      {String? initialValue,
      Widget? icon,
      String? hint,
      Widget? endIcon,
      TextInputType? keyboardType,
      required Function() onTap,
      required Function(String value) onChanged,
      TextEditingController? controller,
      FormFieldValidator<String>? validator,
      required String title}) {
    return buildTextFieldItem(
        onChange: onChanged,
        title: title,
        onTap: onTap,
        hint: hint,
        icon: icon,
        initialValue: initialValue,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        readOnly: true,
        endIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: endIcon ?? loadSvgIcon('arrow_down'),
        ));
  }

/*
* Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kTextMedium.copyWith(fontSize: 14, color: kFontDark),
        ),
        const SizedBox(
          height: 8,
        ),
        MaterialTextField(
          inputDecoration: kTextFieldDecoration.copyWith(
            prefixIcon: icon,
            hintText: hint,
            hintStyle: kTextRegular.copyWith(fontSize: 12, color: kBlueGrey),
            contentPadding: EdgeInsetsDirectional.only(start: 30, end: 10),
            prefixIconConstraints: BoxConstraints(maxHeight: 20),
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: endIcon ?? loadSvgIcon('arrow_down'),
            ),
            suffixIconConstraints: BoxConstraints(maxHeight: 20),
          ),
          readOnly: true,
          controller: controller,
          onTap: onTap,
          style: kTextRegular.copyWith(color: kAlmostBlack, fontSize: 12),
          autovalidateMode: AutovalidateMode.disabled,
          onChanged: (t) {
            onChanged(t);
            validate();
          },
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );*/

  Widget buildTextFieldItem(
      {String? initialValue,
      String? hint,
      bool? readOnly,
      Widget? icon,
      Widget? endIcon,
      TextInputType? keyboardType,
      required Function(String value) onChange,
      Function()? onTap,
      TextEditingController? controller,
      FormFieldValidator<String>? validator,
      required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: labelStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        MaterialTextField(
          inputDecoration: itemDecoration.copyWith(
              prefixIcon: icon,
              hintText: hint,
              suffixIcon: endIcon,
              suffixIconConstraints: BoxConstraints(maxHeight: 20),
              hintStyle: kTextRegular.copyWith(fontSize: 12, color: kBlueGrey),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 30)),
          keyboardType: keyboardType,
          style: kTextRegular.copyWith(color: kAlmostBlack, fontSize: 12),
          validator: validator,
          onTap: onTap,
          initialValue: initialValue,
          readOnly: readOnly,
          controller: controller,
          autovalidateMode: AutovalidateMode.disabled,
          onChanged: (t) {
            onChange(t);
            validate();
          },
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
