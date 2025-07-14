import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shiftapp/presentation/adminFeatures/reviewShifts/data/models/job_evaluations_dto.dart';
import 'package:shiftapp/presentation/adminFeatures/reviewShifts/data/models/confirm_shift_payment_request.dart';
import 'package:shiftapp/presentation/adminFeatures/reviewShifts/presentation/shiftPaymentRequest/bloc/shift_payment_request_state.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/models/value_item.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../presentationUser/resume/widgets/selectable__widgets.dart';
import '../../../../../../common/components/dialogs_manager.dart';
import '../../../../../../common/components/material_text_field.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../domain/entities/status_types.dart';

class ShiftPaymentRequestBody extends BaseStatelessWidget {
  final ShiftPaymentRequestState requestState;
  final Function(ConfirmShiftPaymentRequest params) onSubmit;
  ShiftPaymentRequestBody({required this.requestState, required this.onSubmit});

  final ScrollController scrollController = ScrollController();
  double dataRating = 0;
  final Map<int, JobEvaluationsDto> newEvaluation = {};
  final _formKey = GlobalKey<FormState>();
  bool? accepted;
  ValueItem? selectedBanCase;
  TextEditingController notes = TextEditingController();
  TextEditingController rejectController = TextEditingController();
  StreamStateInitial<bool> isReject = StreamStateInitial();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      rateListWidget(context),
                      Text(
                        strings.blocking_status,
                        style: kTextSemiBold.copyWith(
                            fontSize: 18.sp, color: kPrimary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      dropdownBanCases(context),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        strings.notes,
                        style: kTextSemiBold.copyWith(
                            fontSize: 18.sp, color: kPrimary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      noteTextField(),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        strings.status,
                        style: kTextSemiBold.copyWith(
                            fontSize: 18.sp, color: kPrimary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      radioGroupStatus(context),
                      const SizedBox(
                        height: 24,
                      ),
                      rejectTextField(),
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: saveButton(context),
          ),
        ],
      ),
    );
  }

  Widget rateListWidget(BuildContext context) {
    final evaluationItems = requestState.evaluations;
    return evaluationItems != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: AlignmentDirectional.center,
                  child: ListView.builder(
                      itemCount: evaluationItems.length,
                      controller: scrollController,
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        final item = evaluationItems[position];
                        newEvaluation[item.id!] = item;
                        return rateItem(item,
                            onRatingUpdate: (JobEvaluationsDto rate) {
                          newEvaluation[item.id!] = rate;
                        });
                      })),
              const Divider(
                thickness: 1,
                color: kGrey_EB,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          )
        : Container();
  }

  Widget saveButton(BuildContext context) {
    return AppCupertinoButton(
      onPressed: () async {
        if (validate()) {
          FocusScope.of(context).unfocus();
          DialogsManager.showConfirmationDialog(
            context,
            message: strings.confairm_data,
            onClickOk: () {
              onSubmit(createRequestParams());
            },
          );
        }
      },
      margin: const EdgeInsets.only(top: 16),
      text: strings.save_button,
    );
  }

  ConfirmShiftPaymentRequest createRequestParams() {
    return ConfirmShiftPaymentRequest(
        blockTypeId: selectedBanCase?.value,
        id: requestState.freelancerId,
        evaluations: newEvaluation.values.toList(),
        statusId: approveStatus(),
        descriptionForBlock: rejectController.text,
        description: notes.text);
  }

  int approveStatus() {
    return accepted == true
        ? PaymentRequestStatusTypes.kApprovedOpportunitiesStatus
        : PaymentRequestStatusTypes.kRejectedOpportunitiesStatus;
  }

  Widget rateItem(JobEvaluationsDto item,
      {required Function(
        JobEvaluationsDto rate,
      ) onRatingUpdate}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.circle, color: kRateBarIconColor, size: 5),
          const SizedBox(
            width: 10,
          ),
          Text(
            item.title!,
            style: kTextRegular.copyWith(fontSize: 12, color: kBattleShipGrey2),
          ),
          Spacer(),
          RatingBar(
            initialRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 20,
            wrapAlignment: WrapAlignment.end,
            ratingWidget: RatingWidget(
              full: Image.asset(
                'images/star_rate.png',
                scale: 0.8,
                color: kRateBarIconColor,
              ),
              half: Image.asset(
                'images/star_rate.png',
                scale: 0.8,
                color: kRateBarIconColor,
              ),
              empty: const Icon(
                Icons.star_outline_rounded,
                color: kRateBarIconColor,
              ),
            ),
            itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            onRatingUpdate: (rating) {
              print(rating);
              item.value = (rating * 2).round();
              dataRating = rating;
              onRatingUpdate(item);
            },
          ),
        ],
      ),
    );
  }

  Widget dropdownBanCases(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: DropdownButtonFormField2(
        decoration: const InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
        ),
        isDense: true,
        isExpanded: true,
        hint: Text(
          strings.choose_blocking_state,
          style: kTextRegular.copyWith(color: kBattleShipGrey2, fontSize: 12),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: kPrimary,
          ),
          iconSize: 30,
        ),
        selectedItemBuilder: (item) {
          return requestState.blocCases
              .map((item) => Text(
                    item.name ?? '',
                    style: kTextRegular.copyWith(
                        color: kBattleShipGrey2, fontSize: 12),
                  ))
              .toList();
        },
        buttonStyleData: ButtonStyleData(
          height: 48,
          padding: const EdgeInsetsDirectional.only(end: 20, start: 10),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: Decorations.boxDecorationShaded(),
        ),
        items: requestState.blocCases
            .map((item) => DropdownMenuItem<ValueItem>(
                  value: item,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        item.name ?? '',
                        style: kTextRegular.copyWith(
                            color: kBattleShipGrey2, fontSize: 12),
                      ),
                      const Divider(
                        thickness: 1,
                        color: kGrey_EB,
                      )
                    ],
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return strings.choose_blocking_state;
          }
          return null;
        },
        onChanged: (value) {
          print('onChangedselectedBanCase $value');
          if (value is ValueItem) {
            selectedBanCase = value;
          }
          //Do something when changing the item if you want.
        },
      ),
    );
  }

  Widget radioGroupStatus(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: kPaleGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.white,
      child: SelectableListWidget(
        onSelect: (index) {
          accepted = index == 0;
          FocusScope.of(context).unfocus();
          isReject.setData(accepted ?? true);
        },
        items: [
          strings.payment_accepted,
          strings.payment_refused,
        ],
      ),
    );
  }

  Widget noteTextField() {
    return Material(
      elevation: 6,
      shadowColor: kPaleGray,
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: MaterialTextField(
        maxLines: 3,
        inputDecoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 16, right: 16, top: 16)),
      ),
    );
  }

  Widget rejectTextField() {
    return StreamBuilder<bool>(
        stream: isReject.stream,
        builder: (context, snapshot) {
          return snapshot.data == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      strings.reject_reason,
                      style: kTextSemiBold.copyWith(
                          fontSize: 17.sp, color: kPrimary),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Material(
                      elevation: 6,
                      shadowColor: kPaleGray,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      child: MaterialTextField(
                        maxLines: 2,
                        controller: rejectController,
                        inputDecoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 16, right: 16, top: 16)),
                      ),
                    ),
                  ],
                )
              : SizedBox();
        });
  }

  bool validate() {
    print(newEvaluation);
    print("newEvaluation");
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    if (accepted == null) {
      showErrorDialog(strings.confairm_status_order, _formKey.currentContext!);
      return false;
    }
    if (dataRating == 0) {
      showErrorDialog(strings.rating_confairm, _formKey.currentContext!);
      return false;
    }
    return true;
  }
}
