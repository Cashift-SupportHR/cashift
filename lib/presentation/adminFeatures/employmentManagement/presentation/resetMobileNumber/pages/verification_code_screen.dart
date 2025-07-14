import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../utils/app_utils.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../presentationUser/verification/pages/verification_screen.dart';
import '../../../../../../common/components/buttons/app_cupertino_button.dart';


class VerificationCodeScreen extends BaseStatelessWidget {
  final Function() onResendOTP;
  final Function(String)? onsSend;

  VerificationCodeScreen({
    Key? key,
    required this.onResendOTP,
    this.onsSend,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<String> streamStateInitial = StreamStateInitial();
    TextEditingController controller = TextEditingController();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: kLoadSvgInCirclePath(AppIcons.verification_code),
                  ),
                  SizedBox(height: 16),
                  Text(
                    strings.verification_code_sent_desc,
                    style: kTextRegular.copyWith(
                      fontSize: 14,
                      color: kGray_64,
                    ),
                  ),
                  SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        controller: controller,
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
                        onCompleted: (value) {
                          final otp = AppUtils.replaceArabicNumber(value);
                          streamStateInitial.setData(otp);
                        },

                        appContext: context,
                      ),
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return OtpTimer(onClickResend: (){
                        onResendOTP();
                        controller.clear();
                        streamStateInitial.setData('');
                        setState(() {});
                      },);
                    }
                  )
                ],
              ),
            ),
          ),
        ),
        StreamBuilder<String>(
          stream: streamStateInitial.stream,
          builder: (context, snapshot) {
            return AppCupertinoButton(
              text: strings.send,
              margin: EdgeInsets.all(20),
              onPressed: (snapshot.data == null || snapshot.data!.isEmpty) ? null :
                () {
                if (_formKey.currentState!.validate()) {
                  onsSend!(snapshot.data ?? '');
                }
              },
            );
          }
        ),
      ],
    );
  }
}
