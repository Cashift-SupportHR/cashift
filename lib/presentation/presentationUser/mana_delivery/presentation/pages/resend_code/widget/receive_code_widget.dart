 import '../../../../../../shared/components/index.dart';
import '../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart' show kTextMedium, kTextRegular;

class ReceiveCodeWidget extends BaseStatelessWidget {
  final TextEditingController resendNumberController;
  final String title;
  final String notsTxt;
    ReceiveCodeWidget( {super.key,required this.resendNumberController, required this.title, required this.notsTxt,});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(10),
      decoration: Decorations.createRectangleDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kTextMedium.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 15),
          receiveCodeTextField(),

          nots(),
        ],
      ),
    )  ;
  }
    BuildTextFieldItem receiveCodeTextField() {
      return BuildTextFieldItem(
        title: strings.number_receive_code,
        hintText: strings.write_receive_code,
        controller: resendNumberController,
        keyboardType: TextInputType.text,
      );
    }

    Container nots() {
      return Container(
        decoration: Decorations.decorationOnlyRadius(
          color: kOrange00.withOpacity(.1),
          radius: 5,
        ),
        margin: const EdgeInsets.only(bottom: 8.0),
        padding: EdgeInsets.all(5.0),
        child: Row(
          children: [
            Icon(Icons.error, size: 25, color: kOrange00),
            SizedBox(width: 7),
            Expanded(
              child: Text(
                notsTxt,
                style: kTextRegular.copyWith(color: kOrange00, fontSize: 12),
              ),
            ),
          ],
        ),
      );
    }
}
