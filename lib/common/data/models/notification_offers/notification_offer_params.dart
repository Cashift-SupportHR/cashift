import 'package:json_annotation/json_annotation.dart'; 

part 'notification_offer_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class NotificationOfferParams {
  @JsonKey(name: 'companyId')
  String? companyId;
  @JsonKey(name: 'projectId')
  String? projectId;
  @JsonKey(name: 'oppId')
  String? oppId;

  NotificationOfferParams({this.companyId, this.projectId, this.oppId});

   factory NotificationOfferParams.fromJson(Map<String, dynamic> json) => _$NotificationOfferParamsFromJson(json);

   Map<String, dynamic> toJson() => _$NotificationOfferParamsToJson(this);
}

