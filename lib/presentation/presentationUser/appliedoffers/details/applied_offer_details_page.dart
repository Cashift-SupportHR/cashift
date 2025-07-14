import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/widgets/shift_base_widget.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import '../../../../common/domain/entities/appliedOffers/index.dart';
import 'applied_offer_details_screen_v2.dart';

class AppliedOfferDetailsPage extends ShiftBaseWidget<UnInitState> {

  String endDateTime(AppliedOffer appliedOffer) {
    return appliedOffer.finishedDateTimeString();
  }
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }
  @override
  Widget buildWidget(BuildContext context, state) {
      final AppliedOffer appliedOffers = getArguments(context);

      return AppliedOfferDetailsScreenV2(appliedOffers: appliedOffers,
        performAttendance: (appliedOffers)=> performAttendance(appliedOffers),
        cancelShift: (id)=> cancelShift(id),
      );
  }
  @override
  String? title(BuildContext context) {
    return  strings.working_details;
  }
  @override
  void onChangeStatus() {
    Navigator.pop(context, true);
  }


  @override
  void onSuccessDismissed() {
    Navigator.pop(context, true);
  }
}
