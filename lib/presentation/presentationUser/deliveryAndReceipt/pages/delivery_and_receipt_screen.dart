import 'package:flutter/material.dart';
import 'package:shiftapp/data/models/workerWorkPlaces/index.dart';
import 'package:shiftapp/domain/entities/workerWorkPlaces/index.dart';
 import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:shiftapp/presentation/shared/components/icons/icon_text.dart';

import '../../../../data/models/workerWorkPlaces/add_focus_points_received_devices_params.dart';
  import '../../../../core/utils/app_icons.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/buttons/row_buttons.dart';
import '../../../shared/components/checkbox/warning_check_box_widget.dart';
import '../../../shared/components/divider/divider_vertical.dart';
import '../../../shared/components/texts/underline_text.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../widgets/add_notes_for_device_sheet.dart';
import '../widgets/delivery_and_receipt_item.dart';

class DeliveryAndReceiptScreen extends BaseStatelessWidget {
  final int id;
  final DeviceByFocusPoint deviceByFocusPoint;
  final DeviceSettingFocusPoint deviceSettingFocusPoint;
  final Function(List<AddFocusPointsReceivedDevicesParams>) onAddNotes;

  DeliveryAndReceiptScreen({
    Key? key,
    required this.id,
    required this.deviceByFocusPoint,
    required this.deviceSettingFocusPoint,
    required this.onAddNotes,
  }) : super(key: key);


  List<AddFocusPointsReceivedDevicesParams> devicesParams = [];
  @override
  Widget build(BuildContext context) {
    StreamStateInitial<bool> isAcceptBoxStream = StreamStateInitial();
    return Scaffold(
      bottomNavigationBar: StreamBuilder<bool>(
        stream: isAcceptBoxStream.stream,
        builder: (context, snapshot) {
          return RowButtons(
            onSave: ((snapshot.data ?? false) && devicesParams.isNotEmpty) ? () {
              onAddNotes(devicesParams);
            } : null,
            onCancel: () {
              Navigator.pop(context);
            },
          );
        }
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderDeliveryAndReceipt(
              deviceByFocusPoint: deviceByFocusPoint,
              warningText: deviceSettingFocusPoint.alertSetting ?? '',
            ),
            const SizedBox(height: 16),
            ListView.builder(
              itemCount: deviceByFocusPoint.listDevices!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DeliveryAndReceiptItem(
                    device: deviceByFocusPoint.listDevices![index],
                    onAddNotes: (haveNotes){
                      onSheetAction(context, haveNotes: haveNotes, index: index);
                      isAcceptBoxStream.setData(devicesParams.isEmpty);
                    });
              },
            ),
            WarningCheckBoxWidget(
              text: deviceSettingFocusPoint.dangerSetting ?? '',
              activeColor: kRed_12,
              onChanged: (value) {
                isAcceptBoxStream.setData(value ?? false);
              },
            ),
          ],
        ),
      ),
    );
  }

  showAddNotesSheet(BuildContext context,
      {required String successSetting,
      required Function(AddFocusPointsReceivedDevicesParams) onAddNotes}) {
    return showAppModalBottomSheet(
        context: context,
        isDivider: false,
        child: AddNotesForDeviceSheet(
          onAddNotes: onAddNotes,
          warningText: successSetting,
        ));
  }
  onSheetAction(BuildContext context, {required int haveNotes, required int index}){
    if(haveNotes == 1){
      return showAddNotesSheet(
        context,
        successSetting:
        deviceSettingFocusPoint.successSetting ?? '',
        onAddNotes: (data) {
          onAddNotesAction(data, haveNotes: (haveNotes), index: index);
        },
      );
    } else {
      onAddNotesAction(AddFocusPointsReceivedDevicesParams(
        freeLanceApplyFocusPointsId: id,
        focusPointsDeviceSettingId:
        deviceByFocusPoint.listDevices![index].id,
        description: '',
        attachmentFile: null,
        descriptionAttachment: '',
        haveComment: haveNotes,
      ), haveNotes: (haveNotes), index: index);
    }

  }
  onAddNotesAction(AddFocusPointsReceivedDevicesParams data,
      {required int haveNotes, required int index}) {
    devicesParams.removeWhere((element) => element.focusPointsDeviceSettingId == deviceByFocusPoint.listDevices![index].id);
    AddFocusPointsReceivedDevicesParams params =
    AddFocusPointsReceivedDevicesParams(
      freeLanceApplyFocusPointsId: id,
      focusPointsDeviceSettingId:
      deviceByFocusPoint.listDevices![index].id,
      description: data.description,
      attachmentFile: data.attachmentFile,
      descriptionAttachment: data.descriptionAttachment,
      haveComment: haveNotes,
    );
    devicesParams.add(params);
  }
}

class _HeaderDeliveryAndReceipt extends BaseStatelessWidget {
  final DeviceByFocusPoint deviceByFocusPoint;
  final String warningText;

  _HeaderDeliveryAndReceipt(
      {Key? key, required this.deviceByFocusPoint, required this.warningText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UnderlineText(
          text: strings.notice_receipt_delivery,
          fontSize: 16,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            IconText(
              text: warningText,
              icon: AppIcons.warning,
              iconColor: kYellow_00,
              textStyle: kTextMedium.copyWith(
                color: kYellow_00,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            IconText(
              text: deviceByFocusPoint.countDevice?.toString() ?? '',
              icon: AppIcons.deviceOutline,
              iconSize: 15,
              textStyle: kTextMedium.copyWith(
                color: kGreen_6F,
                fontSize: 12,
              ),
            ),
            DividerVertical(
              space: 8,
              width: 1,
              color: kBlack.withOpacity(0.3),
              height: 25,
            ),
            IconText(
              text: deviceByFocusPoint.countCar?.toString() ?? '',
              icon: AppIcons.carOutline,
              iconSize: 15,
              textStyle: kTextMedium.copyWith(
                color: kGreen_6F,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
