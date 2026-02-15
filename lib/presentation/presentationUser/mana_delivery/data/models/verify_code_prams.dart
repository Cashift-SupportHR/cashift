import 'package:json_annotation/json_annotation.dart';

part 'verify_code_prams.g.dart';

@JsonSerializable()
class VerifyCodePrams {
  @JsonKey(name: "orderId")
  final int? orderId;
  @JsonKey(name: "code")
  final String? code;

  VerifyCodePrams ({
    this.orderId,
    this.code,
  });

  factory VerifyCodePrams.fromJson(Map<String, dynamic> json) {
    return _$VerifyCodePramsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyCodePramsToJson(this);
  }
}


