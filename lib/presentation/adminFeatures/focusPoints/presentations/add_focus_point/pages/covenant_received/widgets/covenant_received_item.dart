import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/buttons/row_small_button.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../../../shared/components/image_builder.dart';
import '../../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';
import 'focus_point_covenant_types_picker.dart';

///  Created by harbey on 5/16/2023.
class CovenantReceivedItem extends BaseStatelessWidget {
  final List<Covenant> covenantTypes;
  final AddCovenantFocusPointParams item;
  final void Function(AddCovenantFocusPointParams)? onSave;
  final int focusPointId;
  final void Function()? onTapDelete;

  CovenantReceivedItem({Key? key, required this.focusPointId, required this.item, this.onSave, this.onTapDelete, required this.covenantTypes}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AddCovenantFocusPointParams newItem = item;
    TextEditingController pointNameController = TextEditingController(text: newItem.name ?? '');
    TextEditingController covenantNumberController = TextEditingController(text: newItem.deviceNumber ?? '');
    TextEditingController deviceIdController = TextEditingController(text: newItem.deviceNumber ?? '');
    StreamStateInitial<String> namePointStream = StreamStateInitial<String>();

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsetsDirectional.only(bottom: 16),
      decoration: Decorations.decorationWithGradientNotSpreadRadius(
        offset: const Offset(1, 0),
      ),
      child: Form(
        key: formKey,
        child: ExpansionTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                  initialData: item.name,
                stream: namePointStream.stream,
                builder: (context, snapshot) {
                  return Checkbox(
                    value: (snapshot.data == null || snapshot.data!.isEmpty) ? false : true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    activeColor: kYellow_00,
                    side: const BorderSide(color: kYellow_00, width: 2),
                    onChanged: (value) {},
                  );
                }
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: StreamBuilder<String>(
                  initialData: item.name,
                  stream: namePointStream.stream,
                  builder: (context, snapshot) {
                    return Text(
                      (snapshot.data == null || snapshot.data!.isEmpty) ? strings.covenant_data : snapshot.data ?? '',
                      style: kTextBoldTitle.copyWith(fontSize: 15, color: kYellow_00),
                    );
                  }
                ),
              ),
            ],
          ),
          trailing:  InkWell(
            onTap: onTapDelete,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, top: 2),
              child: kLoadSvgInCirclePath(AppIcons.deleteOutline,
                  color: kRed_1E, height: 20, width: 20),
            ),
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 8),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            FocusPointCovenantTypesPicker(
              initValue: item.deviceTypeName,
              items: covenantTypes,
              controller: deviceIdController,
              onSelectItem: (items) {
                print('items: ${items.index}');
                newItem.deviceId = items.index;
                deviceIdController.text = items.value;
              },
            ),
            BuildTextFieldItem(
              title: strings.covenant_name,
              hintText: strings.write_covenant_name,
              keyboardType: TextInputType.text,
              controller: pointNameController,
            ),
            BuildTextFieldItem(
              title: strings.covenant_number,
              hintText: strings.determine_covenant_number,
              controller: covenantNumberController,
            ),
            RowSmallButton(
              onCancel: (){
                pointNameController.clear();
                covenantNumberController.clear();
                namePointStream.setData('');
              },
              onSave: () {
               if (formKey.currentState!.validate()) {
                 newItem.focusPointId = focusPointId;
                 newItem.name = pointNameController.text;
                 newItem.deviceNumber = covenantNumberController.text;
                 print('newItem: ${newItem.toJson()}');
                 namePointStream.setData(pointNameController.text);
                 onSave?.call(newItem);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
