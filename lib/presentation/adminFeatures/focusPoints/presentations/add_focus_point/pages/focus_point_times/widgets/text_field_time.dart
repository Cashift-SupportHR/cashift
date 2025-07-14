import 'package:flutter/material.dart';

import '../../../../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/image_builder.dart';
import '../../../../../../../../common/components/material_text_field.dart';

///  Created by harbey on 5/16/2023.
class TextFieldTime extends BaseStatelessWidget {
  final String title;
  final String? initialValue;
  final Function(String) onSelectTime;

  TextFieldTime(
      {Key? key, required this.title, required this.initialValue, required this.onSelectTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController( text: initialValue ?? '');
    return Row(
      children: [
        Text(
          title + ':',
          style: kTextRegular.copyWith(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: MaterialTextField(
            controller: controller,
            readOnly: true,
            inputDecoration: kTextFieldDecorationLessRadiusForTime.copyWith(
              constraints: const BoxConstraints(
                minHeight: 20,
                maxHeight: 100,
              ),
              contentPadding: const EdgeInsetsDirectional.only(
                start: 5,
                end: 5,
              ),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 20,
                maxHeight: 36,
              ),
              prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 5,
                    end: 5,
                  ),
                  child: kLoadSvgInCirclePath(AppIcons.timeOutline,
                      color: kBlack.withOpacity(0.3))),
            ),
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                if (value != null) {
                  print(value.toString());
                  String time = '${value.hour}:${value.minute}';
                  onSelectTime(time);
                  controller.text = DateFormatter.repairApiTimeUI(time);
                }
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return strings.this_field_is_required;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
