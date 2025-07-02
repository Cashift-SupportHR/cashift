import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/core/utils/app_icons.dart';
import '../../../../domain/entities/index.dart';
import '../intent/vehicle_cameras_intents.dart';

class VehicleCameraItem extends BaseStatelessWidget {
  final VehicleCamera item;
  final Function(VehicleCamerasIntents) onActionIntent;

  VehicleCameraItem({
    Key? key,
    required this.item,
    required this.onActionIntent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: Decorations.shapeDecorationShadow(),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          _OptionsMenuButton(
            item: item,
            onActionIntent: onActionIntent,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListRowTextsIconsV2(
                  items: item.items(strings),
                  paddingItem: EdgeInsets.only(bottom: 10),
                  isMark: true,
                  padding: EdgeInsets.only(bottom: 15),
                  isExpanded: false,
                ),
                RowButtons(
                  textSaveButton: strings.start_video,
                  textCancelButton: strings.live_feed,
                  margin: EdgeInsets.zero,
                  strokeColor: kRed_00,
                  cancelColor: kRed_00,
                  onSave: () {
                    onActionIntent(
                      SearchVehicleCamera(
                        isVideoStream: false,
                        item: item,
                      ),
                    );
                  },
                  onCancel: () {
                    onActionIntent(
                      SearchVehicleCamera(
                        isVideoStream: true,
                        item: item,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final VehicleCamera item;
  final Function(VehicleCamerasIntents) onActionIntent;

  _OptionsMenuButton({
    required this.item,
    required this.onActionIntent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 20;

    return OptionsMenuButton(

      options: [
        BuildPopupMenuItemContent(
          title: strings.edit_camera,
          iconPath: AppIcons.edit,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.delete_camera,
          iconPath: AppIcons.deleteOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          onActionIntent(EditVehicleCamera(item));
        } else if (value == 1) {
          onActionIntent(DeleteVehicleCamera(item.id ?? 0));
        }
      },
    );
  }
}
