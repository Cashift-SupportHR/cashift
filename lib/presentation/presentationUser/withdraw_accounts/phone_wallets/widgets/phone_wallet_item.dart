import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/bankaccount/electronic_wallet.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text.dart';

class PhoneWalletItemWidget extends BaseStatelessWidget {
  final ElectronicWallet wallet;
  final Function()? onTapEdit;
  PhoneWalletItemWidget(this.wallet, {this.onTapEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: MaterialText(
            wallet.phone ?? '',
            padding: EdgeInsets.all(8),
            endIcon: onTapEdit != null
                ? IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      onTapEdit!();
                    },
                    color: kSilver,
                  )
                : null,
            mathWidth: true,
            subText: Text(
              wallet.providerName ?? '',
              style: kTextRegular,
            ),
            style: kTextRegular.copyWith(color: kGreyishBrown),
            startIcon: kBuildCircleImage(wallet.providerImage.toString(),
                showFullImage:false,
                placeHolder: 'images/bank.png'),
            startIconPadding: EdgeInsets.only(left: 8, right: 8),
          )),
    );
  }
}
