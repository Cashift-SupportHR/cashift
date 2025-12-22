import '../../../../../../shared/components/index.dart';
import '../../../../../resources/colors.dart';

import '../../../../../resources/constants.dart';
import '../../../intent/mana_delevery_intents.dart';
import '../cubit/nearest_warehouse_state.dart';
import '../widget/confirm_widget.dart';
import '../widget/nearest_warehouse_item.dart';

class NearestWarehouseScreen extends BaseStatelessWidget {
  final Function() onNext;
  NearestWarehouseState state;
  final Function(ManaDeliveryIntents intent) intentCallBack;

  int orderId;
  NearestWarehouseScreen({required this.intentCallBack,required this.orderId,required this.state, required this.onNext});



  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppCupertinoButton(
          onPressed: () {
        showAppModalBottomSheet(
            isDivider: false,
            isScrollControlled: false,
            headerWidget: SizedBox(),
            context: context, child: ConfirmWidget(
          orderId: orderId,
          warehouseId:selectedIndex,
          intentCallBack:intentCallBack ,
          data: state.penaltyWarningEntity,));
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
            " ${state.nearbyWarehousesEntity.length ?? 0} ${strings.number_of_nearest_warehouses}",
            style: kTextRegular.copyWith(fontSize: 14, color: kGreen_85),
          ),
          Expanded(
            child: StatefulBuilder(
              builder: (context, setState) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.nearbyWarehousesEntity.length,
                  itemBuilder: (context, index) {
                    selectedIndex= state.nearbyWarehousesEntity.first.id??0;
                    return NearestWarehouseItem(
                      data: state.nearbyWarehousesEntity[index],
                      index: index,
                      selectedIndex: selectedIndex,

                      onSelect: (data) {
                        setState(() => selectedIndex = data.id ?? 0);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
