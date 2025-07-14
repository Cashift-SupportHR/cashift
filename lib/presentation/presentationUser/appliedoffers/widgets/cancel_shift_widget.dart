import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/material_text_field.dart';

class CancelShiftWidget extends BaseStatelessWidget {
  static  showCancelShiftDialog(BuildContext context,
      {required Function(String message) onConfirm}) {

     showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: CancelShiftWidget(
            onConfirm: (String reason)  {
              // Navigator.pop(context, true);
              Navigator.pop(context);
              onConfirm(reason);
            },
          ),
        );
      },
      transitionBuilder: (context, a1, a2, child) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: child),
        );
      },
    );
  }

  final Function(String reason) onConfirm;
  String reason = '';

  CancelShiftWidget({required this.onConfirm});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: LayoutBuilder(builder: (context, constraints) {
        final heightPercent = (constraints.maxHeight / 100);
        final widthPercent = constraints.maxWidth;
        return _body(heightPercent ,widthPercent ,context);
      }),
    );
  }
  Widget _body(double heightPercent , double width , BuildContext context){
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width - 24,
        height: heightPercent * 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      child: Text(
                        strings.cancel_shift_title,
                        textAlign: TextAlign.start,
                        style: kTextBold.copyWith(
                            fontSize: 16, color: kAlmostBlack),
                      ),
                    ),
                    SizedBox(
                      height: heightPercent * 2,
                    ),
                    Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          strings.whats_reason_for_cancel,
                          style: kTextRegular,
                        )),
                    SizedBox(
                      height: heightPercent * 5,
                    ),
                    MaterialTextField(
                      onChanged: (text) {
                        reason = text;
                      },
                      maxLines: 3,
                      validator: (value) {
                        if (value.isNullOrEmpty()) {
                          return 'Please fill data';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: heightPercent * 1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            onConfirm(reason);
                          }
                        },
                        child: Text(
                          strings.confirm_button,
                          style: kTextBold.copyWith(
                              color: kPrimary, fontSize: 14),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        strings.cancel_button,
                        style: kTextBold.copyWith(
                            color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
