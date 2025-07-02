import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shiftapp/data/models/bank/add_electronic_wallet.dart';
import 'package:shiftapp/domain/entities/bankaccount/electronic_wallet.dart';
import 'package:shiftapp/domain/entities/bankaccount/phone_wallet_required_data.dart';
import 'package:shiftapp/domain/entities/bankaccount/wallet_provider_item.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/validation.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/bottom_sheet/bottom_sheet_text_field.dart';
import 'package:shiftapp/presentation/shared/components/dropdown_filed.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';
import 'package:shiftapp/presentation/shared/components/material_text_field.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/widgets/disclosureText.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/widgets/item_field_screen.dart';

import '../../../../../core/utils/app_utils.dart';
import '../../../../shared/components/list_picker_item_widget.dart';

class AddPhoneWalletScreen extends BaseStatelessWidget{
  final PhoneWalletRequiredData phoneWalletRequiredData ;
  final Function(AddElectronicWalletParams params) onSubmit ;
  final ElectronicWallet ? wallet ;
  AddPhoneWalletScreen({Key? key , required this.phoneWalletRequiredData , required this.onSubmit,  this. wallet}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  int ? providerId ;
  TextEditingController textEditingController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return addAccountForm(context);
  }
  Widget addAccountForm(BuildContext context) {
    return Padding( padding: const EdgeInsets.all(16.0), child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      serviceProviderField(phoneWalletRequiredData.providers),
                      phoneNumberField(),
                    ],
                  )),
            ),
          ),
          DisclosureListWidget(disclosures:phoneWalletRequiredData.disclosure,),
          const SizedBox(
            height: 24,
          ),
          submitAccountButton()
        ],
      ),);
  }

  Widget submitAccountButton() {
    return AppCupertinoButton(
      text: wallet ==null ? strings.save_button : strings.edit,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          performSaveBankAccount();
        } else {}
      },
    );
  }

  Widget phoneNumberField() {
    if(wallet!=null){
      textEditingController.text = wallet?.phone??'';
    }
    return itemContainer(
      strings.phone,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Directionality(
            textDirection: TextDirection.ltr,
            child: MaterialTextField(
              inputDecoration: kCommonDecoration(
                hint: strings.please_entry_phone,
                textDirection: isRtl() ? TextDirection.rtl : TextDirection.ltr,
                endIcon:Image.asset(Assets.imagesSmartphone,color: kGrey_AA,),
                prefix: phoneSuffix(),

              ),
              controller: textEditingController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if (value!.isNullOrEmpty()) {
                  return strings.please_entry_phone;
                } else if (!Validation.isValidPhone(AppUtils.replaceArabicNumber(value))) {
                  return strings.invalid_phone;
                }
                return null;
              },
             
            ),
          ),
          phoneHelperText(),
        ],
      ),
    );
  }
  
  Widget phoneHelperText() {
    return Text(
      strings.saudi_phone_numbers_accepted,
      style: kHelperText,
    );
  }
  
  Widget phoneSuffix() {
    return Container(
        width: 60,
        child: MaterialText(
          '+966 ',
          style: kTextMedium.copyWith(color: kWarmkGrey),
          endIcon: Container(
            width: 2,
            height: 13,
            margin: const EdgeInsetsDirectional.only(end: 4, bottom: 4),
            color: kWarmkGrey,
          ),
        ));
  }

  void performSaveBankAccount() {
    onSubmit(createAddParams());
  }

  AddElectronicWalletParams createAddParams(){
    return AddElectronicWalletParams(
      phone: textEditingController.text ,
      providerId: providerId!,
      id: wallet==null ? 0 :wallet!.id
    );
  }
  Widget serviceProviderField(List<WalletProviderItem> providers) {
    String selectedName = '';
    if(wallet!=null){
      selectedName = wallet?.providerName??'';
      providerId = wallet?.providerId ;
    }
    return itemContainer(
      strings.service_provider,
      child: BottomSheetTextField(
        items:providers.map((e) => Item(index: e.id!, value: e.providerName!)).toList(),
        itemBuilder: (context, item) {
          final bank = providers.firstWhere((element) => element.id == item.index);
          return ListPickerItemWidget(name: item.value,logo: bank.providerLogo,);
        },
        setSearch: true,
        searchHint: strings.search,
        onSelectItem: (item) {
          providerId = item.index;
        },
        initValue: selectedName,
        validator: (value) {
          if (value?.isNullOrEmpty() == true) {
            return strings.select_service_provider;
          }
          return null;
        },
        hint: strings.select_service_provider,
        icon: kLoadSvgIcon('bank'),
      ),
    );
  }

}