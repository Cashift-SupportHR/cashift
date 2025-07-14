import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_widget.dart';
import 'package:shiftapp/utils/app_utils.dart';

class VerificationScreen extends BaseWidget {
  final Function(String otp) onComplete;
  String otp = '';
  final String phone ;
  final Function() onResendOTP;
  VerificationScreen({Key? key, required this.onComplete , required this.phone, required this.onResendOTP}) : super(key: key);

  StreamState<bool> otpStream= StreamStateInitial() ;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(mainAxisSize: MainAxisSize.max, children: [

          const SizedBox(height: 60,),
          Text(
            strings.confirm_phone_number,
            style: kTextMedium.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 7,),
          Text(
            strings.confirm_phone_number_desc,
            style: kTextRegular.copyWith(fontSize: 14,color: kWarmGrey),
          ),
          Text(phone,
            style: kTextRegular.copyWith(fontSize: 14,color: kWarmGrey),
          ),

          const SizedBox(
            height: 50,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: PinCodeTextField(
                length: 5,
                hintStyle: kTextLabel.copyWith(
                    fontSize: 20, color: kGrey_AA),
                obscureText: false,
                showCursor: false,
                enableActiveFill: true,
                autoFocus: true,
                keyboardType: TextInputType.number,
                cursorColor: kDark,
                textStyle: kTextMedium,
                onTap: (){
                  print('PinCodeTextField');
                },
                enablePinAutofill: false,
                pinTheme: PinTheme(
                    fieldHeight: 50,
                    fieldWidth: 50,
                    shape: PinCodeFieldShape.box,
                    activeColor:kPaleGrey_F5,
                    selectedColor: kPrimary,
                    disabledColor: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                    selectedFillColor:kPaleGrey_F5,
                    inactiveColor: kPaleGrey_F5,
                    activeFillColor: kPaleGrey_F5,
                    inactiveFillColor:kPaleGrey_F5,
                    errorBorderColor: Colors.redAccent),
                animationDuration: const Duration(milliseconds: 300),
                onChanged: (value) {
                  otp = AppUtils.replaceArabicNumber(value);
                  otpStream.setData(otp.length==5);
                },

                appContext: context,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          StreamBuilder<bool>(
              stream: otpStream.stream,
              builder: (context, snapshot) {
                return AppCupertinoButton(
                  text: strings.confirm_button,
                  onPressed: () {
                    print('onComplete ${otp}');
                    onComplete(otp);
                  },
                  enable: snapshot.data==true,
                  padding: const EdgeInsets.all(16),
                  backgroundColor: kPrimaryDark,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                );
              }
          ),
          SizedBox(height: 25,),
          OtpTimer(onClickResend: (){
            onResendOTP();
          },)
        ]));
  }
}
class OtpTimer extends BaseWidget{
  final Function onClickResend ;
  OtpTimer({Key? key ,required this.onClickResend}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    final time  = DateTime.now().add(Duration(seconds: 59));
    final CountdownTimerController controller = CountdownTimerController(endTime: time.millisecondsSinceEpoch);
    return   CountdownTimer(
      controller: controller,
      onEnd: (){

      },
      widgetBuilder: (context, time) {
          if (time != null) {
            return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: strings.code_expires_within,
                style: kTextLabelFontDark.copyWith(fontSize: 13),
              ),
              TextSpan(text: '${time.sec}  : 00',style: kTextMedium.copyWith(color: kDustyOrange,fontSize: 13)),
            ],
          ),
        );
          } else {
            return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: strings.did_not_receive_code,
                style: kTextLabelFontDark.copyWith(fontSize: 13),
              ),

              TextSpan(
                text: strings.resend_code,
                recognizer: TapGestureRecognizer()..onTap = () {
                  onClickResend();
                  },
                style: kTextMedium.copyWith(fontSize: 13 , color: kDustyOrange),
              ),
            ],
          ),
        );
          }
      });

  }

}
