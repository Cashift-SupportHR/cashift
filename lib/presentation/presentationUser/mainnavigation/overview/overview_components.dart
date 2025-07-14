import 'package:shiftapp/common/domain/entities/shift/index_shift.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

class OverviewComponents {
  final StreamState<List<JobOfferDto>> offers;
  final StreamState<List<AppliedOffer>> appliedOffers;
  final StreamState<AppliedOffer> currentShift;
  OverviewComponents(this.offers, this.appliedOffers,
      {required this.currentShift});
}
