 import '../../data/models/confirm_reservation_warning_prams.dart';

abstract class ManaDeliveryIntents {}


class CancelReservation extends ManaDeliveryIntents {
  final int orderId;
  CancelReservation({required this.orderId});

}

class SubmitReservation extends ManaDeliveryIntents {
  final ConfirmReservationWarningPrams  confirmReservationWarningPrams;



  SubmitReservation({required this.confirmReservationWarningPrams,   });
}
