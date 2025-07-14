import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shiftapp/common/data/models/auth/register_params.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/validation.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateful_widget.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/base/base_widget.dart';
import 'package:shiftapp/common/components/material_text.dart';
import 'package:shiftapp/common/components/material_text_field.dart';
import 'package:shiftapp/utils/app_utils.dart';

class SignupScreen extends BaseWidget {
  final Function(RegisterParams) performLogin;

  String? fcmToken;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignupScreen({Key? key, required this.performLogin}) : super(key: key);

  getFcmToken() {
    FirebaseMessaging.instance.getToken().then((token) {
      fcmToken = token;
      print("FCM TOKEN IS  $token"); // Print the Token in Console
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    getFcmToken();
    return createUI(context);
  }

  Widget createUI(BuildContext context) {
    FocusNode focusNode = FocusNode();
    final _formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    strings.register_title,
                    style: kTextMedium.copyWith(fontSize: 18),
                  )),
              const SizedBox(
                height: 32,
              ),
              phoneNumberField(onChange: (t) {},
              ),
              createPassword(),
              confirmPassword(),
              const SizedBox(
                height: 18,
              ),
              AppCupertinoButton(
                padding: const EdgeInsets.all(12),
                text: strings.register,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    performLogin(RegisterParams(
                        phone: phoneController.text,
                        appId: fcmToken,
                        confirmPassword: passwordController.text,
                        password: passwordController.text));
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    strings.have_account,
                    style: kTextRegular.copyWith(color: kPrimary, fontSize: 13),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget phoneNumberField({required Function(dynamic phone) onChange}) {
    return PhoneNumberField(
      onChange: onChange,
      controller: phoneController,
    );
  }

  Widget createPassword() {
    return passwordField(
        controller: passwordController,
        title: strings.password,
        hint: strings.please_entry_password);
  }

  Widget confirmPassword() {
    return passwordField(
        title: strings.confirm_password,
        hint: strings.enter_password_again,
    validator: (value){
          if(value!=passwordController.text){
            return strings.password_not_match;
          }
          return null;
    });
  }

  Widget passwordField(
      { TextEditingController ? controller,
      required String title,
      required String hint,
        FormFieldValidator<String>? validator
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        MaterialText(
          title,

          style: kTextMedium.copyWith(fontSize: 14),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 8,
        ),
        MaterialTextField(
          inputDecoration: kTextFieldDecoration.copyWith(
              hintText: hint,
              suffixIconConstraints: const BoxConstraints(maxWidth: 90),
              prefixIconConstraints: const BoxConstraints(maxWidth: 50),
              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(start: 16, end: 12),
                child: Icon(Icons.lock_outline_rounded),
              )),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: validator??(value) {
            if (value!.isNullOrEmpty()) {
              return strings.invalid_password;
            } else if (value.length<6) {
              return strings.invalid_password;
            }
            return null;
          },
          controller: controller,
        ),
      ],
    );
  }
}

class PhoneNumberField extends BaseStatelessWidget {
  final Function(String text) onChange;
  final TextEditingController ? controller ;
  PhoneNumberField({Key? key, required this.onChange , this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialText(
          strings.phone,
          style: kTextMedium.copyWith(fontSize: 14),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 8,
        ),
        MaterialTextField(
          inputDecoration: kTextFieldDecoration.copyWith(
              hintText: strings.enter_phone_number,
              suffixIconConstraints: const BoxConstraints(maxWidth: 90),
              prefixIconConstraints: const BoxConstraints(maxWidth: 50),
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 12),
                child: SvgPicture.asset(
                  'images/call.svg',
                  width: 20,
                ),
              ),
              suffixIcon: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('966+', style: kTextRegular),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'images/saudi_flag.png',
                    width: 28,
                  ),
                ],
              )),
          keyboardType: TextInputType.phone,
          controller: controller,
          validator: (value) {
            if (value!.isNullOrEmpty()) {
              return strings.please_entry_phone;
            } else if (!Validation.isValidPhone(
                AppUtils.replaceArabicNumber(value))) {
              return strings.invalid_phone;
            }
            return null;
          },
          onChanged: (t) {
            onChange(AppUtils.replaceArabicNumber(t));
          },
        ),
      ],
    );
  }
}

class SelectGender extends StatefulWidget {
  final Function(Gender) onSelect;
  final Gender? initValue;
  const SelectGender({Key? key, required this.onSelect, this.initValue})
      : super(key: key);

  @override
  _SelectGenderState createState() {
    return _SelectGenderState();
  }
}

enum Gender { Male, Female, None }

class _SelectGenderState extends BaseState<SelectGender> {
  Gender? selectedBrand;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedBrand ??=
        widget.initValue != null ? widget.initValue! : Gender.None;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          strings.gender,
          style: kTextMedium.copyWith(color: kDark, fontSize: 14),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectedBrand = Gender.Male;
                      widget.onSelect(selectedBrand!);
                      setState(() {});
                    },
                    child:
                        genderItem(strings.male, Gender.Male, selectedBrand!),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectedBrand = Gender.Female;
                      widget.onSelect(selectedBrand!);
                      setState(() {});
                    },
                    child: genderItem(
                        strings.female, Gender.Female, selectedBrand!),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget genderItem(String label, Gender type, Gender selectedBrand) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                color: selectedBrand == type ? kPrimary : kGrey_EB, width: 1)),
        child: ListTile(
          dense: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('images/profile.svg'),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: kTextMedium.copyWith(fontSize: 14),
              ),
            ],
          ),
        ));
  }
}
