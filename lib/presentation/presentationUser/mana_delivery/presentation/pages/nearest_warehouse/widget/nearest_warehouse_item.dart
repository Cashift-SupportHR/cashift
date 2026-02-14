import 'package:flutter/material.dart';
import 'package:shiftapp/utils/app_utils.dart';

import '../../../../../../../utils/app_icons.dart';
import '../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../domain/entities/nearby_warehouses.dart';

class NearestWarehouseItem extends BaseStatelessWidget {
  final int index;
  final int selectedIndex;
  final Function(NearbyWarehousesEntity) onSelect;
  final NearbyWarehousesEntity data;

  NearestWarehouseItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onSelect,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = data.id == selectedIndex;

    return GestureDetector(
      onTap: () => onSelect(data),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: Decorations.createRectangleDecoration() ,
        padding: const EdgeInsets.all(7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name ?? "",
                    style: kTextRegular.copyWith(
                      fontSize: 14,
                      color: isSelected ? kPrimary : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    " ${strings.distance} ${data.distanceKm??0} ${strings.km} ",
                    style: kTextRegular.copyWith(
                      color: kGreen_85,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.fullAddress ?? "",
                    style: kTextRegular.copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      AppUtils.openMap(
                        data.latitude ?? 0,
                        data.longitude ?? 0,
                      );
                    },
                    child: Row(
                      children: [
                        kSvgIcon(image: AppIcons.location_map),
                        const SizedBox(width: 5),
                        Text(
                          strings.open_map,
                          style: kTextBold.copyWith(
                            fontSize: 14,
                            color: kOrange00,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            /// ✅ Radio (تم الإصلاح)
            Radio<int>(
              value: data.id ?? 0, // ✔ ID
              groupValue: selectedIndex,
              activeColor: Colors.teal,
              onChanged: (_) => onSelect(data),
            ),
          ],
        ),
      ),
    );
  }
}
