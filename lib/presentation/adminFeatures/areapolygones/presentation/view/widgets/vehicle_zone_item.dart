import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/icons/icon_text.dart';
import '../../../../../../common/components/options_menu_button.dart';
import '../../../../../../common/components/texts/icon_double_text.dart';
import '../../../data/models/DrawPolygonWithMarkersArgs.dart';
import '../../../data/models/add_vehicle_zone_params.dart';
import '../../../data/models/edit_vehicle_zone_lat_lng_params.dart';
import '../../../domain/entities/vehicle_zone.dart';

class VehicleZoneItem extends BaseStatelessWidget {
  final VehicleZone item;
  final Function(EditVehicleZoneLatLngParams) onEdit;
  final Function() onRefresh;
  final Function(int) onDelete;

  VehicleZoneItem({
    Key? key,
    required this.item,
    required this.onEdit,
    required this.onRefresh,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      // padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Image.asset(
                  Assets.vehiclesZone,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: Text(
                  item.name ?? "",
                  style: kTextBold.copyWith(fontSize: 16),
                ),
              ),
              _OptionsMenuButton(
                onRefresh: onRefresh,
                onEdit: onEdit,
                item: item,
                onDelete: () {
                  onDelete(item.id ?? 0);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildIconDoubleText(
                  icon: AppIcons.buildingsOutline,
                  title: strings.company_name,
                  value: item.companyName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.projectName,
                  title: strings.project_name,
                  value: item.projectName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.workingPeriodOutline,
                  title: strings.shift_name,
                  value: item.shiftName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.vehicle,
                  title: strings.vehicle,
                  value: item.plateNumber ?? '',
                ),
                detailsButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildIconDoubleText(
      {required String icon,
      required String title,
      required String value,
      Color? colorText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconDoubleText(
        icon: icon,
        name: title + ' :',
        value: value,
        nameStyle: kTextRegular.copyWith(fontSize: 14, color: kPrimary),
        valueStyle: kTextMedium.copyWith(fontSize: 14, color: colorText),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  GestureDetector detailsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.drawPolygonWithMarkersPage,
          arguments: DrawPolygonWithMarkersArgs(
            latlngs: VehicleZoneLatLng.toLatLngList(item.latlngs ?? []),
            isOnlyView: true,
          ),
        );
      },
      child: IconText(
        icon: AppIcons.hazard_details,
        text: strings.show_details,
        textStyle: kTextRegular.copyWith(fontSize: 14, color: kOrange00),
        crossAxisAlignment: CrossAxisAlignment.start,
        isIconLift: true,
        iconSize: 20,
        padding: EdgeInsets.only(top: 5),
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final VehicleZone item;
  final Function(EditVehicleZoneLatLngParams) onEdit;
  final Function() onRefresh;
  final Function() onDelete;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.onEdit,
    required this.onRefresh,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(
      padding: EdgeInsets.all(16),
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit_map,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.edit_data,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.delete_area,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          onEditMap(context);
        } else if (value == 1) {
          onEditData(context);
        } else if (value == 2) {
          onDelete();
        }
      },
    );
  }

  onEditMap(BuildContext context) async {
    List<LatLng> latlngs = VehicleZoneLatLng.toLatLngList(item.latlngs ?? []);
    print('latlngs: $latlngs');
    final data = await Navigator.pushNamed(
      context,
      Routes.drawPolygonWithMarkersPage,
      arguments: DrawPolygonWithMarkersArgs(
        latlngs: latlngs,
      ),
    );
    if (data != null && data is List<LatLng>) {
      data.add(data.first);
      EditVehicleZoneLatLngParams params = EditVehicleZoneLatLngParams(
        id: item.id,
        latlngs: VehicleZoneLatLng.fromLatLngList(data),
      );
      onEdit(params);
    }
  }

  onEditData(BuildContext context) async {
    final isRefresh = await Navigator.pushNamed(
        context, Routes.addInfoVehicleZonePage,
        arguments: item);
    if (isRefresh == true) {
      onRefresh();
    }
  }

}
