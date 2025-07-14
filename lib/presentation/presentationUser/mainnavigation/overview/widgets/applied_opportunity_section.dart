import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import 'current_shift_widget.dart';

class AppliedOpportunitSection extends BaseStatelessWidget{
  final Stream<AppliedOffer> stream ;
  final Function onRefresh ;
  AppliedOpportunitSection({required this.onRefresh, required this.stream});
  @override
  Widget build(BuildContext context) {
    return buildAppliedOfferSection();
  }
  Widget buildAppliedOfferSection() {
    return StreamBuilder<AppliedOffer>(
        stream: stream,
        builder: (context, snapshot) {
          final currentShift = snapshot.data;
          return snapshot.hasError == true || snapshot.data == null
              ? Container()
              : snapshot.data != null &&
              currentShift?.remainingTimeFinish() != null
              ? CurrentShiftWidget(
            currentShift!,
            onRefresh: () {
              onRefresh();
            },
          )
              : CurrentShiftWidget(
            currentShift!,
            onRefresh: () {
              onRefresh();
            },
          );
        });
  }

}