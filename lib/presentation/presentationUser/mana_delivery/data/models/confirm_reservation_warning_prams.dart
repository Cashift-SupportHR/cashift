import 'package:json_annotation/json_annotation.dart';

part 'confirm_reservation_warning_prams.g.dart';

@JsonSerializable()
class ConfirmReservationWarningPrams {
  @JsonKey(name: "orderId")
  final int? orderId;
  @JsonKey(name: "warehouseId")
  final int? warehouseId;
  @JsonKey(name: "acknowledgedPenalty")
  final bool? acknowledgedPenalty;

  ConfirmReservationWarningPrams ({
    this.orderId,
    this.warehouseId,
    this.acknowledgedPenalty,
  });

  factory ConfirmReservationWarningPrams.fromJson(Map<String, dynamic> json) {
    return _$ConfirmReservationWarningPramsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfirmReservationWarningPramsToJson(this);
  }
}


