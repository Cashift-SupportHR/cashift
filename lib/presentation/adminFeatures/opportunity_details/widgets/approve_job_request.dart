import 'package:flutter/material.dart';

import '../../../../core/utils/validate.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../../../presentationUser/resume/widgets/selectable__widgets.dart';
import '../../../shared/components/app_cupertino_button.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/material_text_field.dart';
import '../../../shared/components/outlint_button.dart';
import '../../../shared/components/texts/row_rich_texts.dart';
import '../../../shared/components/underline_widget.dart';
import '../../shared/data/models/approve_job_request_params.dart';
import '../../shared/domain/entities/opportunities/opportunity_details.dart';

class ApproveJobRequest extends BaseStatelessWidget {
  final MenuEmployees menuEmployees;
  final int opportunityId;
  final String jopName;
  final Function(ApproveJobRequestParams)? onApproveJobRequest;
  ApproveJobRequest( {Key? key,
    required this.menuEmployees,
    required this.opportunityId,
    required this.jopName,
    required this.onApproveJobRequest,
  })
      : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    bool? isAccept;
    TextEditingController _descriptionController = TextEditingController();
    return  Container(
      color: kWhite,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.approval_job_application,
              style: kTextBoldTitle.copyWith(color: kPrimary),
            ),
            const UnderlineWidget(),
            RowRichTexts(
              child: _CustomRichText(
                title: strings.job,
                subTitle: jopName ?? '',
              ),
              subChild: _CustomRichText(
                title: strings.employee,
                subTitle: menuEmployees.employeeName ?? '',
              ),
            ),
            StatefulBuilder(builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 6,
                    shadowColor: kPaleGray,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    child: SelectableListWidget(
                      onSelect: (index) {
                        isAccept = index == 0 ? true : false;
                        setState(() {});
                      },
                      items: [strings.accept, strings.reject],
                    ),
                  ),
                  const SizedBox(height: 10),
                  (isAccept ?? false)
                      ? const SizedBox(height: 99)
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          strings.reason_refuse,
                          style: kTextMediumPrimary,
                        ),
                      ),
                      Card(
                        elevation: 6,
                        shadowColor: kPaleGray,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.white,
                        child: MaterialTextField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          inputDecoration:
                          kTextFieldDecorationLessRadius,
                          maxLines: 2,
                          controller: _descriptionController,
                          validator: (value) =>
                              Validate.validateRequired(value,
                                  strings.required_reason_refuse),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
            const Spacer(),
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
                      style: kTextBoldSmall.copyWith(
                          color: kRed, fontSize: 10),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          isAccept != null) {
                        onApproveJobRequest!(ApproveJobRequestParams(
                          id: menuEmployees.id,
                          approve: isAccept,
                          description: _descriptionController.text,
                        ));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _CustomRichText extends StatelessWidget {
  final String title;
  final String subTitle;

  const _CustomRichText(
      {Key? key,
        required this.title,
        required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 12, bottom: 12),
      child: CustomRichText(
        title: title,
        subTitle: subTitle,
        titleStyle:
        kTextSemiBold.copyWith(
          fontSize: 18,
          color: kPrimary,
        ),
        subTitleStyle:
        kTextRegular.copyWith(
          fontSize: 12,
          color: kBattleShipGrey,
        ),
      ),
    );
  }
}