import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../../../core/services/routes.dart';
import '../../../../../../../presentationUser/map_picker/widgets/map_picker_item.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/buttons/app_icon_button.dart';
import '../../../../../../../shared/components/map/map_picker.dart';
import '../../../../../../../shared/components/options_menu_button.dart';
import '../../../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../../../data/models/location_project_params.dart';

class LocationItemPicker extends StatelessWidget {
  final LocationProjectParams item;
  final Function(LocationProjectParams) onEdit;
  final Function() onDelete;

  const LocationItemPicker(
      {Key? key,
      required this.item,
      required this.onEdit,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kLoadSvgInCirclePath(AppIcons.location, width: 25, height: 25),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              item.description ?? '',
              style: kTextRegular.copyWith(color: kGreen_63, fontSize: 14),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          _OptionsMenuButton(
            onEdit: () {
              onEditPressed(context);
            },
            onDelete: () => onDelete,
          )
          // AppIconButton(
          //   icon: AppIcons.editPenOutline,
          //   iconSize: 18,
          //   onTap: () => onEditPressed(context),
          // ),
          // SizedBox(
          //   width: 14,
          // ),
          // AppIconButton(
          //   icon: AppIcons.deleteOutline,
          //   iconSize: 18,
          //   onTap: onDelete,
          // ),
        ],
      ),
    );
  }

  onEditPressed(BuildContext context) async {
    MapPickerItem result = await navigatorMapPicker(
      context,
      displayLocation: LatLng(
        double.parse(item.latitude ?? '0.0'),
        double.parse(item.longtude ?? '0.0'),
      ),
    );
    final params = LocationProjectParams(
      description: result.formattedAddress ?? '',
      latitude: result.geometry?.location?.lng?.toString() ?? '0.0',
      longtude: result.geometry?.location?.lat?.toString() ?? '0.0',
      projectId: 0,
      id: 0,
    );
    onEdit(params);
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final Function() onEdit;
  final Function() onDelete;
  _OptionsMenuButton({
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 18;
    return OptionsMenuButton(
      title: Padding(
        padding: const EdgeInsetsDirectional.only(
            end: 10, top: 10, start: 40, bottom: 40),
        child: kLoadSvgInCirclePath(
          AppIcons.menu,
          height: 6,
          width: 6,
        ),
      ),
      options: [
        BuildPopupMenuItemContent(
          title: strings.delete,
          iconPath: AppIcons.deleteOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.edit_additional_sites,
          iconPath: AppIcons.edit,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        // BuildPopupMenuItemContent(
        //   title: strings.print_qr_code,
        //   iconPath: AppIcons.qrProject,
        //   titleStyle: titleStyle,
        //   iconSize: iconSize,
        // ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          onDelete();
        } else if (value == 1) {
          onEdit();
        }
        // else if (value == 2) {
        //   Navigator.pushNamed(
        //     context,
        //     Routes.showQrCodePage,
        //   );
        // }
      },
    );
  }
}
