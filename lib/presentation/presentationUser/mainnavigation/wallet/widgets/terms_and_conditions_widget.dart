import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../../common/components/decorations/decorations.dart';
import '../../../resources/constants.dart';


class TermsAndConditionsWidget extends BaseStatelessWidget {
  final String? companyName;
  final String? amount;
  final Function() onConfirm ;

  TermsAndConditionsWidget({ this.companyName, this.amount, required this.onConfirm});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: AlignmentDirectional.topStart,
      margin: const EdgeInsets.all(16),
      decoration: Decorations.boxDecorationShaded(),
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             strings.copy_rights_title,
              style: kTextMedium.copyWith(
                color: kPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 2,
              width: 50,
              color: kOrange47,
            ),
            const SizedBox(
              height: 15,
            ),
            rowAndValue(
                text: strings.submit_your_request, istext: false),
            rowAndValue(text: strings.cancellation_transfer_request, istext: false),
            rowAndValue(
                text: strings.application_not_responsible,
                istext: false),
            rowAndValue(
                text: strings.not_entitled_ask,
                istext: false),
            rowAndValue(text: strings.further_information, istext: true),
            const SizedBox(
              height: 10,
            ),
            AppCupertinoButton(

              onPressed: onConfirm,
            text: strings.confirm_button,)//
          ],
        ),
      ),
    );
  }

  Widget rowAndValue({required String text, required bool istext}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: kGrey,
            radius: 3,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              text,
              style: kTextMedium.copyWith(
                color: kGrey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //لمعلومات أخرى يمكنك التواصل مع
          istext == true
              ? Row(
                  children: [
                    Text(
                      strings.technical_support,
                      style: kTextMedium.copyWith(
                        color: kPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
