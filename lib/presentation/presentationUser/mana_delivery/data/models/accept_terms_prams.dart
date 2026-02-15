import 'package:json_annotation/json_annotation.dart';

part 'accept_terms_prams.g.dart';

@JsonSerializable()
class AcceptTermsPrams {
  @JsonKey(name: "orderId")
  final int? orderId;


  AcceptTermsPrams ({
    this.orderId,

  });

  factory AcceptTermsPrams.fromJson(Map<String, dynamic> json) {
    return _$AcceptTermsPramsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AcceptTermsPramsToJson(this);
  }
}


