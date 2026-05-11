import '../../../../../../shared/components/index.dart';

import '../../../../../resources/colors.dart';
import '../../../../domain/entities/index.dart';
import '../../resend_code/widget/receive_code_widget.dart';
import '../widget/customer_order_widget.dart';
import '../widget/delivery_customer_widget.dart';


class GoToCustomerManaScreen extends BaseStatelessWidget {
  final Function(String) onNext;
final OrderManaEntity orderManaEntity;
  DeliveryOrderEntity deliveryOrderEntity;
final NearbyWarehousesEntity nearbyWarehousesEntity;
  GoToCustomerManaScreen({Key? key, required this.onNext,required this.orderManaEntity,required this.deliveryOrderEntity,required this.nearbyWarehousesEntity}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController resendNumberController = TextEditingController();
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
          text: strings.confirm_delivery,
          elevation: 0,
          backgroundColor: kPrimary,
          radius: BorderRadius.circular(5),
          padding: const EdgeInsets.symmetric(vertical: 11),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DeliveryCustomerWidget( data: orderManaEntity, nearbyWarehousesEntity: nearbyWarehousesEntity,deliveryOrderEntity: deliveryOrderEntity,),

            CustomerOrderWidget(data: orderManaEntity,),
            SizedBox(height: 20),
            Form(
              key: formKey,
              child: ReceiveCodeWidget(
                title: strings.delivery_code_to_customer,
                notsTxt: strings.details_delivery_code,
                resendNumberController: resendNumberController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
