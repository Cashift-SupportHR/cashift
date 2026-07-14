import 'package:shiftapp/presentation/presentationUser/mana_delivery/domain/entities/delivery_orde.dart';
import 'package:shiftapp/presentation/presentationUser/mana_delivery/domain/entities/my_order.dart';

class MainManaDeliverArgs {
  final DeliveryOrderEntity entity;
  final int initialPage;
  final MyOrderItemEntity? myOrderItem;

  const MainManaDeliverArgs({
    required this.entity,
    this.initialPage = 0,
    this.myOrderItem,
  });
}

