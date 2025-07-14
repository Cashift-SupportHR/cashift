import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shiftapp/common/data/models/bank/add_bank_info_params.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/bank_page_data.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/validation.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/bottom_sheet/bottom_sheet_text_field.dart';
import 'package:shiftapp/common/components/dropdown/dropdown_filed.dart';
import 'package:shiftapp/common/components/material_text.dart';
import 'package:shiftapp/common/components/material_text_field.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/widgets/disclosureText.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/widgets/item_field_screen.dart';

import '../../../../../common/components/list_picker_item_widget.dart';

class BankAccountScreen extends BaseStatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final BankPageData pageData;
  Function(AddBankInfoParams params) onSave;

  BankAccountScreen({Key? key, required this.pageData, required this.onSave})
      : super(key: key);
  int? bankId;
  String? iban;
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
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    bankNameField(),
                    iBanCodeField(),
                    confirmIbanField(),
                  ],
                )),
          ),
        ),
        disclosureText(),
        const SizedBox(
          height: 24,
        ),
        submitAccountButton()
      ],
    );
  }

  Widget submitAccountButton() {
    return AppCupertinoButton(
      text: strings.save_button,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          performSaveBankAccount();
        } else {}
      },
    );
  }

  Widget bankNameField() {
    final bankList = pageData.bankList;
    return itemContainer(
      strings.bank_name,
      child: BottomSheetTextField(
        items:
            bankList.map((e) => Item(index: e.id, value: e.bankName)).toList(),
        itemBuilder: (context, item) {
          final bank = bankList.firstWhere((element) => element.id == item.index); 
          return ListPickerItemWidget(name: bank.bankName, logo: bank.bankLogo??'',);
        },
        setSearch: true,
        searchHint: strings.search,
        onSelectItem: (item) {
          bankId = item.index;
        },
        validator: (value) {
          if (value?.isNullOrEmpty() == true) {
            return strings.please_select_bank;
          }
          return null;
        },
        hint: strings.select_bank_name,
        icon: kLoadSvgIcon('bank'),
      ),
    );
  }

  Widget iBanCodeField() {
    return itemContainer(
      strings.bank_iban,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: MaterialTextField(
              inputDecoration: kCommonDecoration(
                hint: strings.bank_iban,
                textDirection: isRtl() ? TextDirection.rtl : TextDirection.ltr,
                endIcon: kLoadSvgIcon('iban'),
                prefix: iBanSuffix(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if (value?.isNullOrEmpty() == true) {
                  return strings.please_fill_iban;
                }
                if (!Validation.validIban('SA$value')) {
                  return strings.invalid_iban;
                }

                return null;
              },
              onChanged: (text) {
                iban = 'SA$text';
              },
            ),
          ),
          iBanHelperText(),
        ],
      ),
    );
  }

  Widget iBanHelperText() {
    return Text(
      strings.iban_numbers_saudi_bank_customers_accepted,
      style: kHelperText,
    );
  }

  Widget confirmIbanField() {
    return itemContainer(
      strings.confirm_iban,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: MaterialTextField(
              inputDecoration: kCommonDecoration(
                hint: strings.confirm_iban,
                helperStyle: kHelperText,
                prefix: iBanSuffix(),
                endIcon: kLoadSvgIcon('iban'),
                textDirection: isRtl() ? TextDirection.rtl : TextDirection.ltr,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if (value.isNullOrEmpty() == true) {
                  return strings.please_fill_iban;
                }
                if (value != 'SA$iban') {
                  return strings.iban_not_matched;
                }
                return null;
              },
              onChanged: (text) {},
              enableInteractiveSelection: false,
            ),
          ),
        ],
      ),
    );
  }


  Widget disclosureText() {
    final disclosures = pageData.disclosure;
    return DisclosureListWidget(disclosures: disclosures,);
  }


  void performSaveBankAccount() {
    onSave(createAccountParams());
  }

  AddBankInfoParams createAccountParams() {
    return AddBankInfoParams(bankId: bankId!, iban: iban!);
  }

  Widget iBanSuffix() {
    return Container(
        width: 30,
        child: MaterialText(
          'SA ',
          style: kTextMedium.copyWith(color: kWarmkGrey),
          endIcon: Container(
            width: 2,
            height: 13,
            margin: const EdgeInsetsDirectional.only(end: 4, bottom: 4),
            color: kWarmkGrey,
          ),
        ));
  }

}
