import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../common/domain/entities/bail_requests/index.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../../common/components/buttons/row_small_button.dart';
import '../../resources/constants.dart';

class BailTermsAndConditions extends BaseStatelessWidget {
  final List<BailTermAndCondition> termsAndConditions;
  final Function() onAccept;
  final Function() onReject;

  BailTermsAndConditions(
      {Key? key,
      required this.termsAndConditions,
      required this.onAccept,
      required this.onReject,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<bool> isApprovalStream = StreamStateInitial();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: kGrey_DF,
          thickness: 1,
          endIndent: 18,
          height: 15,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Text(strings.view_terms_conditions,
              style: kTextMedium.copyWith(fontSize: 13, color: kRed_3B)),
        ),
        Column(
          children: termsAndConditions
              .map((e) => TermAndConditionItem(text: e.conditionName ?? ''))
              .toList(),
        ),
        TermsAndConditionsCheckBox(
          onChecked: (value) {
            isApprovalStream.setData(value);
          },
        ),
        StreamBuilder<bool>(
            stream: isApprovalStream.stream,
            builder: (context, snapshot) {
              return RowSmallButton(
                textCancel: strings.refusal,
                textSave: strings.approval,
                onCancel: onReject,
                onSave: (snapshot.data ?? false)
                    ? onAccept
                    : null,
              );
            }),
      ],
    );
  }
}

class TermAndConditionItem extends StatelessWidget {
  final String text;

  const TermAndConditionItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 18, top: 10, end: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.circle,
              color: kGreen_2,
              size: 3,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              text,
              style: kTextSemiBold.copyWith(
                fontSize: 14,
                color: kBlack.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TermsAndConditionsCheckBox extends BaseStatelessWidget {
  final Function(bool) onChecked;

  TermsAndConditionsCheckBox({
    Key? key,
    required this.onChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isApproval = false;
    return Row(
      children: [
        StatefulBuilder(builder: (context, seState) {
          return Checkbox(
            value: isApproval,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            side: const BorderSide(
              color: kBlack,
              width: 1.5,
            ),
            onChanged: (value) {
              isApproval = value ?? false;
              onChecked(isApproval);
              seState(() {});
            },
          );
        }),
        Text(strings.i_agree_to_all_terms,
            style: kTextMedium.copyWith(fontSize: 14, color: kBlack)),
      ],
    );
  }
}
