import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/buttons/row_small_button.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/material_text_field.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../salarydefinitionrequest/requests/widgets/warning_widget.dart';

class RejectViolationDialog extends BaseStatelessWidget {
  final Function(String reason) onReject;
  final String warningText;

  RejectViolationDialog(
      {Key? key, required this.onReject, required this.warningText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _descriptionController = TextEditingController();
    return Container(
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            strings.rejection_reason,
            style: kTextSemiBold.copyWith(color: kGreen_2, fontSize: 22),
          ),
          const SizedBox(height: 10),
          MaterialTextField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.multiline,
            inputDecoration: kTextFieldDecorationLessRadius.copyWith(
              hintText: strings.write_rejection_reason,
              hintStyle: kTextSemiBold.copyWith(
                color: kGreen_2.withOpacity(0.6),
                fontSize: 18,
              ),
            ),
            maxLines: 2,
            controller: _descriptionController,
          ),
          WarningWidget(
            warningText: warningText,
            color: kGreen_2,
              margin: const EdgeInsets.only(top: 20),
          ),
          const SizedBox(height: 20),
          RowSmallButton(
            onCancel: () {
              Navigator.pop(context);
            },
            onSave: () {
              onReject(_descriptionController.text);
            }

          ),
        ],
      ),
    );
  }
}
