import 'package:flutter/material.dart';
import 'package:shiftapp/data/models/workerWorkPlaces/index.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/presentation/shared/components/icons/icon_text.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

 import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/decorations/decorations.dart';
import '../../common/common_state.dart';

class DeliveryAndReceiptItem extends BaseStatelessWidget {
  final ListDevice device;
  final Function(int) onAddNotes;

  DeliveryAndReceiptItem(
      {Key? key,
      required this.device,
      required this.onAddNotes,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<bool> isNotNotesStream = StreamStateInitial();
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      margin: const EdgeInsetsDirectional.only(bottom: 16),
      decoration: Decorations.boxDecorationShadowBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(device.deviceName != null)
          IconText(
            text: '${device.deviceName} : ${device.deviceNumber}',
            icon: (device.typeDevice == 1) ? AppIcons.deviceOutline : AppIcons.carOutline,
            textStyle: kTextSemiBold.copyWith(color: kPrimary, fontSize: 22),
              padding: EdgeInsetsDirectional.only(start: (device.typeDevice == 1) ? 6:2),
          ),
          const SizedBox(height: 12),
          IconText(
            text: strings.receipt_status,
            icon: (device.typeDevice == 1) ? AppIcons.devicePopupOutline : AppIcons.carPopupOutline,
            textStyle: kTextSemiBold.copyWith(color: kPrimary, fontSize: 22),
          ),
          RadioListButtons(
            onChanged: (value) {
              print(value);
              isNotNotesStream.setData(value != strings.there_are_notes);
              onAddNotes(value == strings.there_are_notes ? 1 : 2);
            },
            items: [
              strings.there_are_notes,
              strings.there_are_no_notes,
            ],
          ),
          StreamBuilder<bool>(
            stream: isNotNotesStream.stream,
            builder: (context, snapshot) {
              return (snapshot.data ?? false) ?
                WarningWidget(
                warningText: device.alertMessage ?? '',
                color: kPrimary,
                margin: EdgeInsetsDirectional.zero,
              ) : const SizedBox();
            }
          ),
        ],
      ),
    );
  }

}

class RadioListButtons extends StatelessWidget {
  final List<String> items;
  final Function(String)? onChanged;
  const RadioListButtons({Key? key, required this.items, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selected = '';
    return SizedBox(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Row(
            children: items
                .map(
                  (e) => Row(
                    children: [
                      Radio(
                        value: e,
                        groupValue: selected,
                        onChanged: (value) {
                          setState(() {});
                          selected = value as String;
                          onChanged?.call(value);
                        },
                      ),
                      Text(items[items.indexOf(e)], style: kTextMedium.copyWith(fontSize: 14, color: kPrimary),),
                    ],
                  ),
                )
                .toList(),
          );
        }
      ),
    );
  }
}

