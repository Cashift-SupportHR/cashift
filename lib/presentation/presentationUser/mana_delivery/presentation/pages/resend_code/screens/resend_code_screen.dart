import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../shared/components/index.dart';
import '../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../domain/entities/nearby_warehouses.dart';
import '../../../../domain/entities/order_mana.dart';
import '../widget/delivery_widget.dart';
import '../widget/receive_code_widget.dart';

class ResendCodeScreen extends BaseStatelessWidget {
  final Function(String resendNumber) onNext;
  OrderManaEntity data;
  final NearbyWarehousesEntity nearbyWarehousesEntity;
  ResendCodeScreen({
    super.key,
    required this.onNext,
    required this.data,
    required this.nearbyWarehousesEntity,
  });

  final resendNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppCupertinoButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onNext(resendNumberController.text);
            }
          },
          text: strings.go_to_customer,
          elevation: 0,
          backgroundColor: kPrimary,
          radius: BorderRadius.circular(5),
          padding: const EdgeInsets.symmetric(vertical: 11),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DeliveryWidget(
              data: data,
              nearbyWarehousesEntity: nearbyWarehousesEntity,
            ),
            SizedBox(height: 20),
            Form(
              key: formKey,
              child: ReceiveCodeWidget(
                title: strings.receive_code_from_warehouse,
                notsTxt: strings.details_receive_code,
                resendNumberController: resendNumberController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BuildTextFieldItem receiveCodeTextField() {
    return BuildTextFieldItem(
      title: strings.number_receive_code,
      hintText: strings.write_receive_code,
      controller: resendNumberController,
      keyboardType: TextInputType.name,
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
              strings.details_receive_code,
              style: kTextRegular.copyWith(color: kOrange00, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
