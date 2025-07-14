import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/wallet/withdraw_methods.dart';
import 'package:shiftapp/common/domain/entities/wallet/withdraw_method.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateful_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text.dart';

class WithDrawMethodWidget extends StatefulWidget {
  final Function(WithDrawMethodEnum method) onSubmit;
  final List<WithdrawMethod> withDrawMethods;
  const WithDrawMethodWidget(
      {Key? key, required this.onSubmit, required this.withDrawMethods})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _WithDrawMethodState();
  }
}

class _WithDrawMethodState extends BaseState<WithDrawMethodWidget> {
  var selectMethod = WithDrawMethodEnum.None;

  bool methodEnabled(String id) {
    if (widget.withDrawMethods.indexWhere((element) => element.code == id) >
        -1) {
      return widget.withDrawMethods
          .firstWhere((element) => element.code == id)
          .status==true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              methodEnabled('123-1')
                  ? withDrawItem(
                      iconPath: Assets.imagesCashier,
                      text: strings.withdraw_by_cashier,
                      value: WithDrawMethodEnum.Cashier,
                    )
                  : Container(),
              methodEnabled('123-2')
                  ? withDrawItem(
                      iconPath: Assets.imagesBankCard,
                      text: strings.withdraw_by_bank_account,
                      value: WithDrawMethodEnum.Bank,
                    )
                  : Container(),
              withDrawItem(
                iconPath: Assets.imagesSmartphone,
                text: strings.withdraw_by_smart_wallet,
                value: WithDrawMethodEnum.SmartWallet,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        AppCupertinoButton(
          text: strings.follow,
          onPressed: selectMethod == WithDrawMethodEnum.None
              ? null
              : () {
                  widget.onSubmit(selectMethod);
                },
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }

  Widget withDrawItem(
      {required String iconPath,
      required String text,
      required WithDrawMethodEnum value}) {
    return InkWell(
      child: MaterialText(
        text,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        style: kTextRegular,
        mathWidth: true,
        startIconPadding: EdgeInsetsDirectional.only(end: 20, start: 16),
        endIcon: Radio(
            value: value,
            groupValue: selectMethod,
            onChanged: (v) {
              setState(() {
                selectMethod = value;
              });
            }),
        startIcon: kBuildCircleShape(
            child: Image.asset(
              iconPath,
              scale: 3.5,
              color: kPrimary,
            ),
            size: 34,
            color: kPrimary.withAlpha(50)),
      ),
      onTap: () {
        setState(() {
          selectMethod = value;
        });
      },
    );
  }
}
