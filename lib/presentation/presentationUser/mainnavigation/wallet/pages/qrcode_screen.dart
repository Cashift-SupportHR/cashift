

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/image_builder.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';


class QrCodeScreen extends BaseStatelessWidget {
  QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: kPrimary,

      appBar: AppBar(
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: kPrimary,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          strings.withdraw,
          style: kTextMedium.copyWith(color: kWhiteFA, fontSize: 16),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Container(
              height: 450,
              decoration: Decorations.boxDecorationShaded(),
            ),
          ),
          const Positioned(
              top: 50,
              child: CircleAvatar(
                backgroundColor: kPrimary,
                radius: 50,
              )),
          Positioned(
              top: 60,
              child: CircleAvatar(
                backgroundColor: kWhiteFA,
                radius: 40,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: kLoadSvgInCirclePath(AppIcons.qrCoded,
                      height: 50, width: 50),
                ),
              )),
          Positioned(
              top: 170,
              child: Column(
                children:   [
                    Text(
                    strings.transfer_amount,
                    style: kTextMedium.copyWith(
                      color: kPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10,),
                    Text(
                    '500  ${strings.rs}',
                      style: kTextMedium.copyWith(
                        color: kPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 30),
                    child: QrImageView(
                      data: "14423",
                      version: QrVersions.auto,
                      size: 200,
                      embeddedImage:AssetImage(AppIcons.avatarQr),
                       constrainErrorBounds: true,
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: const Size(90, 90),

                      ),
                    ),
                  ),
                    Text(
                    strings.scan_your_code,
                    style: kTextMedium.copyWith(
                      color: kPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              )),
        ],
      ),
    );
  }
}
