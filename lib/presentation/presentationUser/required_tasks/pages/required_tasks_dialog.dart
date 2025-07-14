import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../common/data/models/user_overview/disclosure_required_task_dto.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/checkbox/multiple_choice_checkbox.dart';
import '../../../shared/components/checkbox/single_choice_checkbox.dart';

///  Created by harbey on 6/20/2023.
class RequiredTasksDialog extends BaseStatelessWidget {
  final DisclosureRequiredTaskDto requiredTaskDto;
  final Function(int) onConfirm;
  RequiredTasksDialog({Key? key, required this.requiredTaskDto, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('RequiredTasksDialog ${requiredTaskDto.toJson()}');
    int typeId = 0;
    StreamStateInitial<int> onConfirmStream = StreamStateInitial();
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.only(bottom: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kBuildImage(
            requiredTaskDto.logo ?? '',
              border: 0,
            size: 80,
          ),
          SizedBox(height: 10),
          Text(
            requiredTaskDto.mainText ?? '',
            style: kTextSemiBold.copyWith(fontSize: 24, color: kBlack_3C),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            requiredTaskDto.description ?? '',
            style: kTextMedium.copyWith(fontSize: 14, color: kBlack_4D),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          SingleChoiceCheckbox(
            items: requiredTaskDto.typeClearanceCertificate?.map((e) => CheckboxItem(id: e.id, text: e.text, checked: false)).toList() ?? [],
            onChanged: (CheckboxItem item) {
              print(item.id);
              typeId = item.id ?? 0;
              onConfirmStream.setData(typeId);
            },
          ),
        ],
      ),
      actions: [
        StreamBuilder<int>(
          stream: onConfirmStream.stream,
          builder: (context, snapshot) {
            return AppCupertinoButton(
              text: strings.confirm_button,
              radius: BorderRadius.circular(4),
              padding: EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 60),
              onPressed: snapshot.data == null ? null :
                  () {
                onConfirm(typeId);
              },
            );
          }
        ),
      ],
    );
  }
}


