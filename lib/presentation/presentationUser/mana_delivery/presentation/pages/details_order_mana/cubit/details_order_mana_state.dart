import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/domain/entities/shift/index_shift.dart';

import '../../../../domain/entities/order_mana.dart';
import '../../../../domain/entities/terms_mana.dart';

class DetailsOrderManaState extends Initialized {
  final List<TermsManaEntity> termsManaEntity;
  final OrderManaEntity orderManaEntity;

  DetailsOrderManaState({required this.orderManaEntity,
    required this.termsManaEntity,}
       ): super(data: orderManaEntity);
}
