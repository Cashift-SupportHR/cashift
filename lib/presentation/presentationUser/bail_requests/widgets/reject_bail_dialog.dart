import 'package:flutter/material.dart';

import '../../../../utils/app_icons.dart';
import '../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/image_builder.dart';
import '../../../../common/components/outlint_button.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';

class RejectBailDialog extends BaseStatelessWidget {
  final Function(String reason) onReject;

  RejectBailDialog(
      {Key? key, required this.onReject})
      : super(key: key);


  TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kLoadSvgInCirclePath(
            AppIcons.reject,
          ),
          const SizedBox(height: 10),
          Text(
            strings.request_has_been_rejected,
            style: kTextSemiBold.copyWith(color: kGreen_2, fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            strings.request_has_been_rejected_message,
            style: kTextMedium.copyWith(
                color: kGrey_50.withOpacity(0.7),
                fontSize: 12,
            ),
          ),
          const SizedBox(height: 20),
          BuildTextFieldItem(
            title: strings.reason_refuse,
            hintText: strings.write_rejection_reason,
            controller: _descriptionController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SizedBox(
                height: 28,
                width: 105,
                child: AppOutlineButton(
                  child: Text(
                    strings.cancel,
                    style: kTextBoldSmall.copyWith(color: kRed, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  strokeColor: kRed,
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 105,
                height: 28,
                child: AppCupertinoButton(
                  text: strings.save_button,
                  textStyle: kTextBoldSmall.copyWith(
                      color: kPrimaryLight, fontSize: 10),
                  radius: BorderRadius.circular(8),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      onReject(_descriptionController.text);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
