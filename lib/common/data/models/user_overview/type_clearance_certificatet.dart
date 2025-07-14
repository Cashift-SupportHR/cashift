import 'package:json_annotation/json_annotation.dart'; 

part 'type_clearance_certificatet.g.dart';



@JsonSerializable(ignoreUnannotated: true)
class TypeClearanceCertificate {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'text')
  String? text;

  TypeClearanceCertificate({this.id, this.text});

   factory TypeClearanceCertificate.fromJson(Map<String, dynamic> json) => _$TypeClearanceCertificateFromJson(json);

   Map<String, dynamic> toJson() => _$TypeClearanceCertificateToJson(this);
}

