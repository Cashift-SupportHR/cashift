import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiftapp/common/data/exceptions/no_bank_account_exception.dart';
import 'package:shiftapp/common/data/exceptions/no_phone_wallet_exception.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/bank_account_info.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/shared/components/dropdown_filed.dart';
import '../../../../../../common/data/models/wallet/balance_by_exchange_params.dart';
import '../../../../../../common/data/models/wallet/name_by_id_number.dart';
import '../../../../../../common/domain/entities/bankaccount/electronic_wallet.dart';
import '../../../../../../common/domain/entities/bankaccount/with_draw_params.dart';
import '../../../../../../common/domain/validators/idnumber_validation.dart';
import '../../../../../../common/domain/entities/wallet/wallet_balance_item.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_by_phone_wallet_params.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_method.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_methods.dart';
import '../../../../../../common/domain/entities/wallet/withdraw_to_another_account_params.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../../utils/app_utils.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/bottom_sheet/bottom_sheet_text_field.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/error_handler_widget.dart';
import '../../../../../shared/components/image_builder.dart';
import '../../../../../shared/components/list_picker_item_widget.dart';
import '../../../../../shared/components/loading_widget.dart';
import '../../../../../shared/components/material_text_field.dart';
import '../../../../../shared/components/texts/row_rich_texts.dart';
import '../../../../appliedoffers/pages/qrcode_screen.dart';
import '../../../../collect_cash/pages/cashier/cashier_page.dart';
import '../../../../common/common_state.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import '../../../../withdraw_accounts/add_phone_wallet/page/add_phone_wallet_page.dart';
import '../../../../withdraw_accounts/bankaccont/pages/bank_account_page.dart';
import '../../../../withdraw_accounts/phone_wallets/widgets/phone_wallet_item.dart';
import '../../widgets/terms_and_conditions_widget.dart';
import '../bloc/initialize_withdraw.dart';
import 'confirm_withdraw_action_builder.dart';
import 'withdraw_page.dart';
import 'package:shiftapp/main_index.dart';

class WithdrawScreen extends BaseStatelessWidget {
  final InitializedWithdraw state;
  final WithdrawPageArgs args;
// final WithdrawData withdrawData;
  final Function fetchBank;
  final Function fetchWallet;
  final Function(WithdrawByPhoneWalletParams params) withdrawByPhone;
  final Function(WithdrawToAnotherAccountParams params) withdrawToAccount;
  final Function(WithDrawParams projectId) withdrawByBank;
  final Function(String idNumber) fetchIdNumber;
  WithdrawScreen(
      {Key? key,
      required this.fetchBank,
// required this.withdrawData,
      required this.fetchWallet,
      required this.withdrawToAccount,
      required this.withdrawByPhone,
      required this.withdrawByBank,
      required this.state,
      required this.args,
      required this.fetchIdNumber})
      : super(key: key);

  var amountValueController = TextEditingController();
  var nationalIdController = TextEditingController();
  String selectedName = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (args.company != null) {
      amountValueController.text =
          (args.company!.balance.toString()).addCurrency(context);
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: args.company != null ? 160 : 80,
                child: Stack(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration:
                          Decorations.createRectangleDecorationOnlyBottom(),
                      child: Column(
                        children: [],
                      ),
                    ),
                    args.company != null ? companyDetailsWidget() : Container(),
                    args.method != null ? methodDetailsWidget() : Container(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsets.all(16),
                decoration: Decorations.boxDecorationShaded(),
                child: Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        strings.transfer,
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
                      Text(
                        strings.transfer_from,
                        style: kTextMedium.copyWith(
                          color: kPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      companiesPickerField(context),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        strings.transfer_method,
                        style: kTextMedium.copyWith(
                          color: kPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      withdrawPickerField(context),
                      selectedWithDrawMethodAccountStream(context),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        strings.amount_value,
                        style: kTextMedium.copyWith(
                          color: kPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      selectedCompanyStream(context),
                    ],
                  ),
                ),
              ),
              TermsAndConditionsWidget(
                companyName: args.method?.name ?? '',
                amount: amountValueController.text,
                onConfirm: () {
                  showConfirmationWidget(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showConfirmationWidget(BuildContext context) {
    if (selectedWithDrawMethod?.code == WithdrawCode.ONE_TO_ONE &&
        selectedAccount == null) {
      return;
    }
    if (_formKey.currentState?.validate() == true) {
      confirmWithdrawAction(
        context: context,
        title: strings.transfer_details,
        message: withDrawConfirmMessage(),
        params: BalanceByExchangeParams(
          companyId: selectCompany?.companyId ?? 0,
          exchangeId: selectedWithDrawMethod?.exchangeId ?? 0,
          type: selectCompany?.type,
          headId: selectCompany?.id,
        ),
        onConfirm: () {
          performWithdrawAction();
        },
      );
    }
  }

  WalletBalanceItem? selectCompany;
  Widget companiesPickerField(BuildContext context) {
    if (args.company != null) {
      selectCompany = args.company!;
    }
    return state.availableCompanies != null
        ? BottomSheetTextField(
            items: state.availableCompanies!
                .map((e) => Item(
                      index: e.hashCode,
                      value: e.companyName ?? '',
                    ))
                .toList(),
            setSearch: true,
            itemBuilder: (context, item) {
              final availableCompanies = state.availableCompanies!
                  .firstWhere((element) => element.hashCode == item.index);
              return ListPickerItemWidget(
                name: item.value,
                logo: availableCompanies.logo,
              );
            },
            inputDecoration: kTextFieldDecorationLessRadius,
            searchHint: strings.search_for_company,
            onSelectItem: (item) {
              final company = state.availableCompanies!
                  .firstWhere((element) => element.hashCode == item.index);
              selectCompany = company;
              amountValueController.text =
                  (company.balance.toString()).addCurrency(context);
            },
            initValue: selectedName,
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return strings.please_select_company;
              }
              return null;
            },
            hint: strings.select_company,
          )
        : MaterialTextField(
            inputDecoration: kTextFieldDecorationLessRadius,
            initialValue: args.company?.companyName ?? '',
            readOnly: true,
          );
  }

  Widget companyDetailsWidget() {
    final company = args.company!;
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      decoration: Decorations.boxDecorationShaded(),
      child: Row(
        children: [
          Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: kBuildImage(company.logo.toString(), size: 20, border: 0)),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 2,
              ),
              Text(
                company.companyName ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: kTextMedium.copyWith(
                  color: kPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    strings.current_balance,
                    style: kTextMedium.copyWith(
                      color: kGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "${company.balance.toString()}  ${strings.rs}",
                    style: kTextMedium.copyWith(
                      color: kPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  WithdrawMethod? selectedWithDrawMethod;
  Widget withdrawPickerField(BuildContext context) {
    if (args.withDrawByMethod) {
      selectedWithDrawMethod = args.method;
    }
    return args.withDrawByMethod
        ? MaterialTextField(
            inputDecoration: kTextFieldDecorationLessRadius,
            initialValue: args.method?.fullName ?? '',
            readOnly: true,
          )
        : BottomSheetTextField(
            items: state.availableMethods!
                .map((e) => Item(
                      index: e.id!,
                      value: e.fullName ?? "",
                    ))
                .toList(),
            setSearch: true,
            itemBuilder: (context, item) {
              final withDrawByMethod = state.availableMethods!
                  .firstWhere((element) => element.id == item.index);
              return ListPickerItemWidget(
                name: item.value,
                logo: withDrawByMethod.logo,
              );
            },
            inputDecoration: kTextFieldDecorationLessRadius,
            searchHint: strings.search,
            onSelectItem: (item) {
              final method = state.availableMethods!
                  .firstWhere((element) => element.id == item.index);
              onChangeWithdrawMethod(method);
            },
            initValue: selectedName,
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return strings.select_transfer_method;
              }
              return null;
            },
            hint: strings.transfer_method,
          );
  }

  Widget phoneWalletStream(BuildContext context) {
    return StreamBuilder<List<ElectronicWallet>?>(
        stream: state.phoneWalletsStream.stream,
        builder: (context, snapshot) {
          if (snapshot.error != null &&
              snapshot.error is NoPhoneWalletException) {
            return ErrorPlaceHolderWidget(
              error: strings.not_added_phone_wallet_data,
              buttonName: strings.add_wallet,
              onClickReload: () async {
                final update = await Navigator.pushNamed(
                    context, Routes. addPhoneWallet);
                if (update == true) {
                  fetchWallet();
                }
              },
            );
          }
          if (snapshot.data != null && snapshot.data!.isEmpty == false) {
            return phoneWalletsField(snapshot.data!);
          }
          return LoadingView();
        });
  }

  Widget bankAccountStream(BuildContext context) {
    return StreamBuilder<BankAccountInfo?>(
        stream: state.bankAccountStream.stream,
        builder: (context, snapshot) {
          if (snapshot.error != null &&
              snapshot.error is NoBankAccountException) {
            return ErrorPlaceHolderWidget(
              error: strings.not_have_bank_account_data,
              buttonName: strings.add_bank_account,
              onClickReload: () async {
                final update = await BankAccountPage.show(context,
                    neededForCallback: true);
                if (update == true) {
                  fetchBank();
                }
              },
            );
          }
          if (snapshot.data != null) {
            return MaterialTextField(
              inputDecoration: kTextFieldDecorationLessRadius,
              initialValue: snapshot.data!.iban ?? '',
            );
          }

          return Container();
        });
  }

// Dialog
  ElectronicWallet? wallet;
  Widget phoneWalletsField(List<ElectronicWallet> phoneWallets) {
    return BottomSheetTextField(
      items: phoneWallets
          .map((e) =>
              Item(index: e.id!, value: '${e.phone!} - ${e.providerName}'))
          .toList(),
      inputDecoration: kTextFieldDecorationLessRadius,
      itemBuilder: (context, item) {
        final wallet =
            phoneWallets.firstWhere((element) => element.id == item.index);
        return PhoneWalletItemWidget(
          wallet,
        );
      },
      setSearch: true,
      searchHint: strings.search,
      onSelectItem: (item) {
        wallet = phoneWallets.firstWhere((element) => element.id == item.index);
      },
      initValue: selectedName,
      validator: (value) {
        if (value?.isNullOrEmpty() == true) {
          return strings.please_select_wallet;
        }
        return null;
      },
      hint: strings.select_wallet,
      icon: kLoadSvgIcon('bank'),
    );
  }

  Widget selectedCompanyStream(BuildContext context) {
    return MaterialTextField(
      inputDecoration: kTextFieldDecorationLessRadius.copyWith(
        hintText: "${strings.saudi_riyals} x",
      ),
      controller: amountValueController,
      readOnly: true,
    );
  }

  NameByIdNumber? selectedAccount;
  Widget nationalIdTextField(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: MaterialTextField(
                inputDecoration: kTextFieldDecorationLessRadius.copyWith(
                    hintText: strings.id_number_recipient_account),
                controller: nationalIdController,
                onChanged: (text) {
                  if (IdNumberValidator(AppUtils.replaceArabicNumber(text))
                      .isValid()) {
                    selectedAccount = null;
                    FocusScope.of(context).unfocus();
                    fetchIdNumber(text);
                  }
                },
                validator: (value) {
                  if (!IdNumberValidator(
                          AppUtils.replaceArabicNumber(value ?? ''))
                      .isValid()) {
                    state.nameByIdNumberStream.setData(null);
                    return strings.invalid_id_number;
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                      context, Routes.qrScanner);
                  //   final result = QrCode('1006985566');
                  if (result is QrCode) {
                    nationalIdController.text = result.code;
                    if (IdNumberValidator(
                            AppUtils.replaceArabicNumber(result.code))
                        .isValid()) {
                      fetchIdNumber(nationalIdController.text);
                    }
                  }
                },
                child: kLoadSvgInCirclePath(AppIcons.walletQrCode,
                    height: 25, width: 25),
              ),
            ),
          ],
        ),
        StreamBuilder<NameByIdNumber?>(
            stream: state.nameByIdNumberStream.stream,
            builder: (context, snapshot) {
              if (snapshot.error != null) {
                return ErrorPlaceHolderWidget(
                  exception: snapshot.error,
                  height: 100,
                  image: SvgPicture.asset(
                    'images/place_holder.svg',
                    height: 40,
                  ),
                );
              } else if (!snapshot.hasData) {
                return const SizedBox();
              }
              selectedAccount = snapshot.data!;
              return Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(30, 134, 111, 0.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RowRichTexts(
                      child: SizedBox(
                        child: CustomRichText(
                          title: strings.employee_name,
                          subTitle: snapshot.data?.name ?? '',
                          padding: const EdgeInsets.only(
                              right: 10, top: 10, bottom: 12),
                        ),
                      ),
                      subChild: CustomRichText(
                        title: strings.mobile_number,
                        subTitle: snapshot.data?.phoneNumber ?? '',
                        padding: const EdgeInsets.only(
                            right: 10, top: 10, bottom: 12),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  void onChangeWithdrawMethod(WithdrawMethod method) {
    selectedWithDrawMethod = method;
    if (selectedWithDrawMethod?.code == WithdrawCode.PHONE_WALLET) {
      fetchWallet();
    }
    if (selectedWithDrawMethod?.code == WithdrawCode.BANK_ACCONT) {
      fetchBank();
    }
    selectedWithdrawMethodCodeStream.setData(method.code!);
  }

  final selectedWithdrawMethodCodeStream = StreamStateInitial<String>();
  Widget selectedWithDrawMethodAccountStream(BuildContext context) {
    return StreamBuilder<String>(
        initialData: args.method?.code,
        stream: selectedWithdrawMethodCodeStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data != WithdrawCode.CASHIER) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  strings.account_received,
                  style: kTextMedium.copyWith(
                    color: kPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                withDrawMethodAccountField(snapshot.data!, context),
              ],
            );
          }
          return Container();
        });
  }

  Widget withDrawMethodAccountField(String method, BuildContext context) {
    print('withDrawMethodAccountField $method');
    if (method == WithdrawCode.ONE_TO_ONE) {
      return nationalIdTextField(context);
    }
    if (method == WithdrawCode.BANK_ACCONT) {
      return bankAccountStream(context);
    }
    if (method == WithdrawCode.PHONE_WALLET) {
      return phoneWalletStream(context);
    }
    if (method == WithdrawCode.CASHIER) {}
    return Container();
  }

  void performWithdrawAction() {
    final selectCompanyId = selectCompany!.companyId!;
    if (selectedWithDrawMethod?.code == WithdrawCode.CASHIER) {
      withDrawByCashier(
          _formKey.currentContext!, selectCompanyId, selectCompany!.type!);
    }
    if (selectedWithDrawMethod?.code == WithdrawCode.PHONE_WALLET) {
      if (wallet == null) {
        return;
      }
      withdrawByPhone(WithdrawByPhoneWalletParams(
          projectId: selectCompanyId,
          providerId: wallet!.providerId!,
          type: selectCompany!.type,
          transferId: selectCompany!.id));
    }
    if (selectedWithDrawMethod?.code == WithdrawCode.BANK_ACCONT) {
      withdrawByBank(createWithdrawByBankParams(selectCompany!));
    }
    if (selectedWithDrawMethod?.code == WithdrawCode.ONE_TO_ONE) {
      if (selectedAccount == null) {
        return;
      }
      withdrawToAccount(WithdrawToAnotherAccountParams(
        companyId: selectCompanyId,
        idNumber: nationalIdController.text,
        type: selectCompany!.type,
        id:selectCompany!.id
      ));
    }
  }

  withDrawByCashier(BuildContext context, int selectCompanyId, int type) async {
    await Navigator.pushNamed(context,  Routes.cashierPage,
        arguments: CashierPageArgs(selectCompanyId, type));
    Navigator.pop(context, true);
  }

  Widget methodDetailsWidget() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      decoration: Decorations.boxDecorationShaded(),
      child: Row(
        children: [
          kBuildCircleImageCard(imagePath: args.method!.logo ?? ''),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              args.method?.description ?? '',
              style: kTextRegular.copyWith(
                color: kBattleShipGrey,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  withDrawConfirmMessage() {
    return strings.transfer_confirm_message(
      selectCompany!.companyName.toString(),
      selectCompany!.balance.toString(),
      selectedWithDrawMethod!.fullName.toString(),
    );
  }

  WithDrawParams createWithdrawByBankParams(
      WalletBalanceItem walletBalanceItem) {
    return WithDrawParams(
        projectId: walletBalanceItem.companyId!,
        transferId: walletBalanceItem.id!,
        bankCode: '',
        transactionType: 2);
  }
}
