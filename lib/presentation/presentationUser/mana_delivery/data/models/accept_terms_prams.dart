import 'package:json_annotation/json_annotation.dart';

part 'accept_terms_prams.g.dart';

@JsonSerializable()
class AcceptTermsPrams {
  @JsonKey(name: "orderId")
  final int? orderId;
  @JsonKey(name: "termsType")
  final int? termsType;
  @JsonKey(name: "termsVersion")
  final String? termsVersion;

  AcceptTermsPrams ({
    this.orderId,
    this.termsType,
    this.termsVersion,
  });

  factory AcceptTermsPrams.fromJson(Map<String, dynamic> json) {
    return _$AcceptTermsPramsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AcceptTermsPramsToJson(this);
  }
}


