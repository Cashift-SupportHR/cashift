 import 'package:get/get.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/pages/qrcode_screen.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../../core/services/routes.dart';
import '../../../../../../shared/components/index.dart';
import '../../../../../resources/colors.dart';

class ScanQrVehicleScreen extends StatefulWidget {
  final Function(String code) onNext;

  const ScanQrVehicleScreen({super.key, required this.onNext});

  @override
  State<ScanQrVehicleScreen> createState() => _ScanQrVehicleScreenState();
}

class _ScanQrVehicleScreenState extends State<ScanQrVehicleScreen> {
  String? text;

  @override
  Widget build(BuildContext context) {
    final strings = Get.context!.getStrings();
    return AppScaffold(

      bottomNavigationBar: RowButtons(
        onCancel: () => Navigator.pop(context),
        onSave: () => widget.onNext(text ?? ''),
        textSaveButton: strings.next_button,
        backgroundColor: text==null?kPrimary.withOpacity(.5):kPrimary,
      ),
      body: Center(
        child: InkWell(
            onTap: () async {
              final result = await Navigator.pushNamed(context, Routes.qrScanner);
              if (result is QrCode) {
                text = result.code;
                print(result.image);
                print("result.image");
                setState(() {});
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  kLoadSvgInCirclePath(
                    AppIcons.qrCodeBorder,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    text ?? strings.scan_code_car,
                    style: kTextMedium,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
