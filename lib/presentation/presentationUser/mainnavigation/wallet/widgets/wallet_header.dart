import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiftapp/common/domain/entities/wallet/withdraw_method.dart';
import '../../../../../main_index.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/image_builder.dart';
import '../../../../../common/components/underline_widget.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../bloc/initialize_wallet_state.dart';
import '../user_qrcode/pages/qrcode_page.dart';

class WalletHeaderWidget extends StatefulWidget {
  final InitializeWalletState state;
  final Function(WithdrawMethod method) onSelectWithdrawMethod;
  const WalletHeaderWidget(
      {Key? key, required this.state, required this.onSelectWithdrawMethod}) : super(key: key);
  @override
  State<WalletHeaderWidget> createState() => _WalletHeaderWidgetState();
}

class _WalletHeaderWidgetState extends State<WalletHeaderWidget> {
  final strings = Get.context!.getStrings();
  bool isShow = false;
  IconData suffix = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    final balance = widget.state.walletBalance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              Container(
                height: 175,
                padding: const EdgeInsets.only(top: 24),
                width: double.infinity,
                decoration: Decorations.createRectangleDecorationOnlyBottom(),
                child: Text(
                  strings.wallet,
                  style: kTextMedium.copyWith(color: kWhiteF2),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 100,
                left: 16,
                right: 16,
                child: Container(
                  constraints: BoxConstraints(minHeight: 130),
                  padding:
                      const EdgeInsets.only(left: 10,right: 10,bottom: 16),
                    decoration: Decorations.boxDecorationShaded(
                    radius: 14
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isShow
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  Text(
                                    strings.current_balance,
                                    style: kTextMedium.copyWith(
                                      color: kPrimary,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "${balance.totalBalance}  ${strings.rs} ",
                                    style: kTextMedium.copyWith(
                                      color: kPrimary,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                alignment: Alignment.center,
                                height: 80,
                                child: Text(
                                  strings.balance_hidden,
                                  style: kTextMedium.copyWith(
                                    color: kPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 10),
                          child: kLoadSvgInCirclePath(
                            AppIcons.walletHome,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                suffix = Icons.visibility;
                                isShow = !isShow;
                                suffix = isShow
                                    ? Icons.visibility
                                    : Icons.visibility_off;
                              });
                            },
                            icon: Icon(
                              suffix,
                              color: kPrimary,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 200,
                  left: 34,
                  right: 34,
                  child: Center(
                      child:
                          withDrawMethodsList(widget.state.withdrawMethods))),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          decoration: Decorations.boxDecorationShaded(),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          suffix = Icons.visibility;
                          isShow = !isShow;
                          suffix = isShow
                              ? Icons.visibility
                              : Icons.visibility_off;
                        });
                      },
                      child: Center(
                        child: Text(
                          strings.click_access_account,
                          style: kTextMedium.copyWith(
                            color: kPrimary,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.qrCodePage);
                    },
                    child: kLoadSvgInCirclePath(AppIcons.walletQrCode,
                        height: 25, width: 25),
                  ),
                ],
              ),
              isShow
                  ? Column(
                    children: [
                      UnderlineWidget(
                        height: 3,
                        width: 150,
                      ),
                      SizedBox(height: 12,),
                      FittedBox(
                        child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //fundsOut
                              imageAndTextFunds(
                                  image: AppIcons.fundsIn,
                                  text: strings.withdrawn_balance,
                                  value: "${balance.withdrawnBalance} ${strings.rs} "),

                              imageAndTextFunds(
                                  image: AppIcons.fundsOut,
                                  text: strings.remaining_balance,
                                  value: "${balance.totalBalance} ${strings.rs} "),
                            ],
                          ),
                      ),
                    ],
                  )
                  : Container(),
            ],
          )
        ),
      ],
    );
  }

  Widget listFundsWidget(
      {required String text,
      required String imagePath,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 20),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: kBuildCircleContainer(
                size: 60,
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(imagePath,scale: 0.9,),
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 50,
            child: Text(
              text,
              style: kTextMedium.copyWith(
                color: kPrimary,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget imageAndTextFunds(
      {required String image, required String text, required String value}) {
    return Row(
      children: [
        kLoadSvgInCirclePath(image, height: 25, width: 25),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: kTextMedium.copyWith(
            color: kPrimary,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: kTextMedium.copyWith(
            color: kFontDark,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget withDrawMethodsList(List<WithdrawMethod> withdrawMethods) {
    return Container(
      height: 100,
      child: ListView.builder(
          itemCount: withdrawMethods.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final item = withdrawMethods[index];
            return listFundsWidget(
                text: item.name ?? '',
                imagePath: item.logo ?? '',
                onTap: () {
                  widget.onSelectWithdrawMethod(item);
                  //  Get.to(WithdrawFromWalletScreen());
                });
          }),
    );
  }
}
