import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiftapp/common/data/models/auth/login_params.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/validation.dart';
import 'package:shiftapp/utils/app_utils.dart';
import '../../../components/app_cupertino_button.dart';
import '../../../components/base_widget.dart';
import '../../../components/material_text.dart';
import '../../../components/material_text_field.dart';
import '../../../components/outlint_button.dart';
import '../../../components/password_field_widget.dart';
import 'package:shiftapp/main_index.dart';

class LoginScreen extends BaseWidget {
  final Function(LoginParams) performLogin;
  final Function performLoginBio;
  String? phone;
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  StreamState<bool>  phoneStream= StreamStateInitial() ;
  String? fcmToken;

  LoginScreen({Key? key, required this.performLogin , required this.performLoginBio}) : super(key: key);

  getFcmToken() async {
    await FirebaseMessaging.instance.deleteToken();
    FirebaseMessaging.instance.getToken().then((token) {
      fcmToken = token;
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    if(kDebugMode){
      // phone = '559135678';
      // phoneController.text = '559135678';
      // passwordController.text = '123456';
      // phone = '559135678';
      // phoneController.text = '559135678';
      // passwordController.text = '123456';
      phone = '0582708625';
      phoneController.text = '0582708625';
      passwordController.text = 'Asdf@123';
      // phone = '506666666';
      // phoneController.text = '506666666';
      // passwordController.text = 'Asdf@123';
      phoneStream.setData(true);
    }
    getFcmToken();
    return createUI(context);
  }

  Widget createUI(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 24,right: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60,),
              Text(
                strings.welcome_log_in,
                style: kTextMedium.copyWith(fontSize: 18),
              ),
             /* SizedBox(height: 7,),
               Text(
                'ادخل رقم الهاتف الخاص بك لتسجيل الدخول',
                style: kTextRegular.copyWith(fontSize: 14,color: kWarmGrey),
              ),*/

              const SizedBox(
                height: 100,
              ),

             phoneNumberField(onChange: (phone){
               this.phone = phone;
               phoneStream.setData(_formKey.currentState!.validate());
             }),

              passwordField(onChange: (text){
                phoneStream.setData(_formKey.currentState!.validate());
              }),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgetpassword);
                    },
                    child: Text(
                      strings.forgot_password,
                      style: kTextRegular.copyWith(color: kBluish,fontSize: 12),
                    )),
              ),

              const SizedBox(
                height: 75,
              ),
              Row(
                children: [
                  Container(
                      width: 60,
                      height: 44,
                      child: AppOutlineButton(
                        onClick: () async {
                          performLoginBio();
                        },
                        borderWidth: 1.5,
                        radius: 12,
                        child: const Icon(Icons.fingerprint),
                      )),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: StreamBuilder<bool>(
                      stream: phoneStream.stream,
                      builder: (context, snapshot) {
                        return AppCupertinoButton(
                          text: strings.login_button,
                          padding: const EdgeInsets.all(12),
                          enable: snapshot.data==true,
                          onPressed: () {
                              performLogin(LoginParams(phone: phone, appId: fcmToken,password:passwordController.text ));
                          },
                        );
                      }
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signupPage );
                  },
                  child: Text(
                    strings.dont_have_acount,
                    style: kTextRegular.copyWith(color: kPrimary,fontSize: 13),
                  ))

            ],
          ),
        ),
      ),
    );
  }

  Widget phoneNumberField( {required Function(dynamic phone) onChange}) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialText(  strings.phone,
          style: kTextMedium.copyWith(fontSize: 14),
          textAlign: TextAlign.start,),
        const SizedBox(height: 8,),
        MaterialTextField(
          controller: phoneController,
          inputDecoration: kTextFieldDecoration.copyWith(
              hintText: strings.enter_phone_number,
              suffixIconConstraints: const BoxConstraints(maxWidth: 90),
              prefixIconConstraints: const BoxConstraints(maxWidth: 50),
              prefixIcon:Padding(
                padding: const EdgeInsetsDirectional.only(start: 16,end: 12),
                child: SvgPicture.asset('images/call.svg',width: 20,),
              ) ,
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
          validator: (value) {
            if (value!.isNullOrEmpty()) {
              return strings.please_entry_phone;
            } else if (!Validation.isValidPhone(AppUtils.replaceArabicNumber(value))) {
              return strings.invalid_phone;
            }
            return null;
          },
          onChanged: (t) {
            onChange(AppUtils.replaceArabicNumber(t));
          },
        ),
      ],
    ) ;
  }

  Widget passwordField( {required Function(String password) onChange}) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        MaterialText(  strings.password,
          style: kTextMedium.copyWith(fontSize: 14),
          textAlign: TextAlign.start,),
        const SizedBox(height: 8,),
        PasswordFieldWidget(controller: passwordController,
        onChange: onChange,),
      ],
    ) ;
  }

}
