import 'package:json_annotation/json_annotation.dart'; 

part 'bail_request_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class BailRequestDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'freelanceName')
  String? freelanceName;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'descriptionRequest')
  String? descriptionRequest;
  @JsonKey(name: 'totalMoney')
  int? totalMoney;
  @JsonKey(name: 'totalInstallment')
  int? totalInstallment;
  @JsonKey(name: 'statusName')
  String? statusName;
  @JsonKey(name: 'descriptionReject')
  String? descriptionReject;

  BailRequestDto({this.id, this.freelanceName, this.phoneNumber, this.descriptionRequest, this.totalMoney, this.totalInstallment, this.statusName, this.descriptionReject});

   factory BailRequestDto.fromJson(Map<String, dynamic> json) => _$BailRequestDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BailRequestDtoToJson(this);
}

