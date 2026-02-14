import 'package:json_annotation/json_annotation.dart';

part 'cashifter_code_dto.g.dart';

@JsonSerializable()
class CashifterCodeDto {
  @JsonKey(name: "header")
  final String? header;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "description")
  final String? description;

  CashifterCodeDto ({
    this.header,
    this.code,
    this.description,
  });

  factory CashifterCodeDto.fromJson(Map<String, dynamic> json) {
    return _$CashifterCodeDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CashifterCodeDtoToJson(this);
  }
}


