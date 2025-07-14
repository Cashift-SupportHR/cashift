import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/bank_account_info.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/material_text_field.dart';
// for the utf8.encode method
class BankAccountInfoScreen extends BaseStatelessWidget {

  final BankAccountInfo bankAccountInfo ;

  BankAccountInfoScreen({required this.bankAccountInfo});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: addAccountForm(context),
    );
  }

  Widget addAccountForm(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              bankNameField(bankAccountInfo.bankName),
              iBanCodeField(bankAccountInfo.iban),
            ],
          ),
        ),
      ],
    );
  }

  Widget bankNameField(String value) {
    return itemContainer(
      strings.bank_name,
      child: MaterialTextField(
        inputDecoration: kCommonDecoration(
          icon: kLoadSvgIcon('bank'),
        ),
        initialValue: value,
        readOnly: true,
      ),
    );
  }

  Widget iBanCodeField(String iban) {
    return itemContainer(
      strings.bank_iban,
      child: MaterialTextField(
        inputDecoration: kCommonDecoration(
          icon: kLoadSvgIcon('iban'),
        ),

        initialValue: iban,
        readOnly: true,
      ),
    );
  }

  Widget itemContainer(String text, {required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
        ),
        Text(
          text,
          style: kTextMedium.copyWith(fontSize: 16, color: kFontDark),
        ),
        SizedBox(
          height: 10,
        ),
        child
      ],
    );
  }

}
