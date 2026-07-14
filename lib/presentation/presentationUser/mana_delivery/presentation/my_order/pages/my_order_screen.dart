import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/shared/widgets/term_and_condition_item.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../mainnavigation/overview/widgets/my_order_cart.dart';
import '../../../domain/entities/my_order.dart';

class MyOrderScreen extends BaseStatelessWidget {
  List<MyOrderItemEntity> data;
  final VoidCallback onRefresh;
  MyOrderScreen({required this.data,required this.onRefresh,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      itemBuilder: (context, index) {
        return MyOrderCart(
          onRefresh: onRefresh,
          data: data[index],
          isExpanded: true,
        );
      },
    );
  }
}
