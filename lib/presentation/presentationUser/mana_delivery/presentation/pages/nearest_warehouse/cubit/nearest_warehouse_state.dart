import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/domain/entities/shift/index_shift.dart';

import '../../../../domain/entities/index.dart';
import '../../../../domain/entities/order_mana.dart';
import '../../../../domain/entities/terms_mana.dart';

class NearestWarehouseState extends Initialized {
  final List<NearbyWarehousesEntity> nearbyWarehousesEntity;
  final PenaltyWarningEntity penaltyWarningEntity;

  NearestWarehouseState({required this.nearbyWarehousesEntity,
    required this.penaltyWarningEntity,}
       ): super(data: nearbyWarehousesEntity);
}
