import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/shared/components/text_field/build_text_field_item.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/checkbox/custom_check_box.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../common/domain/entities/appliedOffers/index.dart';
import '../../common/common_state.dart';

class OpportunityApologizingWidget extends BaseStatelessWidget {
  final CancelOpportunityApologizing data;
  final Function(String reason) onConfirm;

  OpportunityApologizingWidget({required this.onConfirm, required this.data});

  final _formKey = GlobalKey<FormState>();
  StreamStateInitial<bool> isAgreeStream = StreamStateInitial<bool>();
  TextEditingController controller = TextEditingController();

  String reason = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    kBuildImage(
                      data.icon ?? '',
                      size: 60,
                      fit: BoxFit.cover,
                      border: 0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      child: Text(
                        data.title ?? '',
                        textAlign: TextAlign.start,
                        style: kTextSemiBold.copyWith(
                            fontSize: 22, color: kPrimary),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BuildTextFieldItem(
                      title: strings.whats_reason_apologizing,
                      hintText: strings.type_reason_apologizing,
                      minLines: 3,
                      controller: controller,
                      keyboardType: TextInputType.multiline,
                    ),
                  ],
                ),
                if (data.attentionMessageStatus ?? false)
                  WarningWidget(
                    margin: EdgeInsetsDirectional.zero,
                    warningText: data.attentionMessage ?? '',
                    color: kRed_04,
                  ),
                Divider(
                  color: kGray_DE,
                  height: 40,
                  thickness: 0.5,
                ),
                listTerms(),
                CustomCheckBox(
                  title: strings.terms_and_conditions_message,
                  checkColor: kOrange00,
                  color: kOrange00,
                  onChanged: (value) {
                    isAgreeStream.setData(value ?? false);
                  },
                ),
                confirmButton(),
              ],
            )),
      ),
    );
  }

  Widget listTerms(){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.terms?.length ?? 0,
      itemBuilder: (context, index) {
        return     Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kBuildImage(
                data.terms?[index].icon ?? '',
                size: 25,
                fit: BoxFit.cover,
                border: 0,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  data.terms?[index].text ?? '',
                  style: kTextMedium.copyWith(
                      fontSize: 14, color: kBlack_3C),
                ),
              ),
            ],
          ),
        );
      }
    );

  }
  Widget confirmButton() {
    return StreamBuilder<bool>(
        stream: isAgreeStream.stream,
        builder: (context, snapshot) {
          return AppCupertinoButton(
            text: strings.confirm_button,
            radius: BorderRadius.circular(0),
            margin: EdgeInsets.only(top: 15),
            onPressed: snapshot.data == true
                ? () {
                    if (_formKey.currentState?.validate() == true) {
                      onConfirm(reason);
                    }
                  }
                : null,
          );
        });
  }
}
