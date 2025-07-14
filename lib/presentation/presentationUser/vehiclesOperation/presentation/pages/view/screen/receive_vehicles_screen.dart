import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/view/widget/receive_vehicles_item.dart';

import '../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../domain/entities/receiveVehicle.dart';

class ReceiveVehiclesScreen extends BaseStatelessWidget {
  final int tabId;
  final List<ReceiveVehicleData> data;
  final Function() onRefresh;

  ReceiveVehiclesScreen(
      {super.key,
      required this.tabId,
      required this.onRefresh,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => ReceiveVehiclesItem(
        tabId: tabId,
        data: data[index],
        onRefresh: onRefresh,
      ),
    );
  }
}
