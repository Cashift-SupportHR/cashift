import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/material_text_field.dart';
import 'package:shiftapp/common/components/outlint_button.dart';
import 'package:shiftapp/common/components/underline_widget.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/base/base_widget_bloc.dart';
import '../opportunities/bloc/available _opportunities_cubit.dart';

class CancelOpportunityWidgetBuilder extends BaseBlocWidget<UnInitState, AvailableOpportunitiesCubit> {
  final int opportunityId;
  final Function() onRefresh;
  final bool? isOpportunityDetailsPage;

  CancelOpportunityWidgetBuilder({Key? key, required this.opportunityId, required this.onRefresh, this.isOpportunityDetailsPage = false}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    TextEditingController _descriptionController = TextEditingController();
    // show the dialog

    return Container(
      color: kWhite,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.cancel_opportunity,
              style: kTextBoldTitle.copyWith(color: kPrimary),
            ),
            const UnderlineWidget(),
            Text(
              strings.cancel_message_opportunity,
              style: kTextRegular.copyWith(color: kPrimary, fontSize: 14),
            ),
            const SizedBox(height: 20),
            MaterialTextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
              inputDecoration: kTextFieldDecorationLessRadius,
              maxLines: 2,
              controller: _descriptionController,
            ),
            const SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                SizedBox(
                  height: 35,
                  width: 105,
                  child: AppOutlineButton(
                    height: 35,
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
                  height: 35,
                  child: AppCupertinoButton(
                    text: strings.save_button,
                    textStyle: kTextBoldSmall.copyWith(color: kPrimaryLight, fontSize: 10),
                    radius: BorderRadius.circular(8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    onPressed: () => bloc.cancelOpportunityAvailableByDescription(opportunityId, _descriptionController.text),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onRequestSuccess(String? message) {
    Navigator.pop(context);
    // if user cancel opportunity from opportunity details page then pop twice
    // to go back to available opportunities page
    if (isOpportunityDetailsPage!) {
      Navigator.pop(context);
    }
    onRefresh();
    super.onRequestSuccess(message);
  }
}

showDialogCancelOpportunity(BuildContext context, {required int opportunityId, required Function() onRefresh, bool isOpportunityDetailsPage = false}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
      insetPadding: const EdgeInsets.all(18),
      backgroundColor: Colors.white,
      content: SizedBox(
          height: 230,
          width: 500,
          child: CancelOpportunityWidgetBuilder(
            opportunityId: opportunityId,
            onRefresh: onRefresh,
            isOpportunityDetailsPage: isOpportunityDetailsPage,
          )),
    ),
  );
}
