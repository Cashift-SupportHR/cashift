import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../data/models/edit_vehicle_zone_lat_lng_params.dart';
import '../../../domain/entities/vehicle_zone.dart';
import '../widgets/vehicle_zone_item.dart';

class VehiclesZoneScreen extends BaseStatelessWidget {
  final List<VehicleZone> data;
  final Function(EditVehicleZoneLatLngParams) onEdit;
  final Function() onRefresh;
  final Function(int) onDelete;

  VehiclesZoneScreen({Key? key, required this.data, required this.onRefresh, required this.onEdit, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 6, bottom: 16, left: 16, right: 16),
      itemBuilder: (context, index) {
        return VehicleZoneItem(
          item: data[index],
          onEdit: onEdit,
          onRefresh: () {
            onRefresh();
          },
          onDelete: onDelete,
        );
      },
    );
  }
}
