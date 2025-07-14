import 'package:json_annotation/json_annotation.dart'; 

part 'cancel_opportunity_apologizing_dto.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class CancelOpportunityApologizingDto {
  @JsonKey(name: 'icon')
  String? icon;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'attentionMessage')
  String? attentionMessage;
  @JsonKey(name: 'attentionMessageStatus')
  bool? attentionMessageStatus;
  @JsonKey(name: 'terms')
  List<Term>? terms;

  CancelOpportunityApologizingDto({this.icon, this.title, this.attentionMessage, this.attentionMessageStatus, this.terms});

   factory CancelOpportunityApologizingDto.fromJson(Map<String, dynamic> json) => _$CancelOpportunityApologizingDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CancelOpportunityApologizingDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: true)
class Term {
  @JsonKey(name: 'icon')
  String? icon;
  @JsonKey(name: 'text')
  String? text;

  Term({this.icon, this.text});

   factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

   Map<String, dynamic> toJson() => _$TermToJson(this);
}

