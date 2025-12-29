import '../../../../../../shared/components/index.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../domain/entities/nearby_warehouses.dart';
import '../../../intent/mana_delevery_intents.dart';
import '../cubit/nearest_warehouse_state.dart';
import '../widget/confirm_widget.dart';
import '../widget/nearest_warehouse_item.dart';

class NearestWarehouseScreen extends BaseStatelessWidget {
  final Function(NearbyWarehousesEntity) onNext;
  final NearestWarehouseState state;
  final Function(ManaDeliveryIntents intent) intentCallBack;
  final int orderId;

  NearestWarehouseScreen({
    super.key,
    required this.intentCallBack,
    required this.orderId,
    required this.state,
    required this.onNext,
  });

  int? selectedWarehouseId;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context,setState) {
        if (selectedWarehouseId == null &&
            state.nearbyWarehousesEntity.isNotEmpty) {
          selectedWarehouseId =
              state.nearbyWarehousesEntity.first.id;
        }
        return Scaffold(
          backgroundColor: kBackground,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCupertinoButton(
              onPressed: selectedWarehouseId == null
                  ? null
                  : () {
                showAppModalBottomSheet(
                  isDivider: false,
                  isScrollControlled: false,
                  headerWidget: const SizedBox(),
                  context: context,
                  child: ConfirmWidget(
                    orderId: orderId,
                    warehouseId: selectedWarehouseId!,
                    intentCallBack: intentCallBack,
                    data: state.penaltyWarningEntity,
                  ),
                );
              },
              text: strings.receive_code,
              elevation: 0,
              backgroundColor: kPrimary,
              radius: BorderRadius.circular(5),
              padding: const EdgeInsets.symmetric(vertical: 11),
            ),
          ),
          body: Column(
            children: [
              Text(
                "${state.nearbyWarehousesEntity.length} ${strings.number_of_nearest_warehouses}",
                style: kTextRegular.copyWith(
                  fontSize: 14,
                  color: kGreen_85,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.nearbyWarehousesEntity.length,
                  itemBuilder: (context, index) {
                    final warehouse =
                    state.nearbyWarehousesEntity[index];
                    return NearestWarehouseItem(
                      data: warehouse,
                      index: index,
                      selectedIndex: selectedWarehouseId ?? 0,
                      onSelect: (data) {

                        setState(() {
                          selectedWarehouseId = data.id;
                          print("selectedWarehouseId  $selectedWarehouseId");
                        });
                        onNext(data);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
