import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/details/applied_offer_details_screen_v2.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/widgets/shift_base_widget.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/slide_animation.dart';

class CurrentShiftPage extends ShiftBaseWidget<Initialized<AppliedOffer>> {
   bool registered = false;

  fetchCurrentShift() async {

    bloc.fetchCurrentShift();
  }

  @override
  void loadInitialData(BuildContext context) {
    fetchCurrentShift();
  }

  @override
  String? title(BuildContext context) {
    return strings.current_shift;
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  @override
  Widget buildWidget(BuildContext context, state) {
    return AppliedOfferDetailsScreenV2(
        appliedOffers: state.data,
        performAttendance: (shift) {
          performAttendance(shift);
        },
        cancelShift: (id) {
          cancelShift(id);
        });
  }

  @override
  void onRequestSuccess(String? message) {
    registered = true;
    super.onRequestSuccess(message);
  }

  @override
  void onBackPress() {
    Navigator.pop(context, registered);
  }
}
