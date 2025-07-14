
 import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../../../../core/services/routes.dart';
import '../../../../../../../../../utils/app_utils.dart';
import '../../../../../../../../../common/components/index.dart';
import '../../../../../../../common/common_state.dart';
import '../../../../../../../resources/colors.dart';
import '../../../../../../../resources/constants.dart';
import '../../../../../../../verification/pages/verification_screen.dart';


class ConfirmRequestsUserScreen extends BaseStatelessWidget {
  final Function(String otp) onComplete;
  String otp = '';

  final Function() onResendOTP;
  ConfirmRequestsUserScreen({Key? key, required this.onComplete ,   required this.onResendOTP}) : super(key: key);

  StreamState<bool> otpStream= StreamStateInitial() ;

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(
        children: [
           SizedBox(height: 30,),
          kLoadSvgInCircle("person",),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
            child: Text(
              strings.confirm_code_ms,
              textAlign: TextAlign.center,
              style: kTextRegular.copyWith(fontSize: 14, color: kGray_64,),
            ),
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
          // OtpTimer(onClickResend: (){
          //   onResendOTP();
          // },)
          
        ],
      ),
    );
  }
}
