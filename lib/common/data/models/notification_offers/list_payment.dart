import 'package:json_annotation/json_annotation.dart';


part 'list_payment.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ListPayment {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'logo')
  String? logo;

  ListPayment({this.name, this.logo});

   factory ListPayment.fromJson(Map<String, dynamic> json) => _$ListPaymentFromJson(json);

   Map<String, dynamic> toJson() => _$ListPaymentToJson(this);
}

