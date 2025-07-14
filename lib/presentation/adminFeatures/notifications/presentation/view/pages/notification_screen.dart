import 'package:flutter/material.dart';
 import '../../../../../../common/components/base/base_stateless_widget.dart';
 import '../../../domain/entities/vehicle_notifications.dart';
 import '../widget/notification_item.dart';


class VehicleNotificationScreen extends BaseStatelessWidget {
 final String code;
  final List<VehicleNotification> data;
  final Function(VehicleNotification) onAction;

 VehicleNotificationScreen(
      {Key? key,
      required this.code,
      required this.data,
       required this.onAction
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount:data.length,
        itemBuilder: (context, index) {
          return VehicleNotificationItem(
            code: code,
            item: data[index],
            onAction: () => onAction(data[index]),
          );
        },
      ),
    );
  }
}
