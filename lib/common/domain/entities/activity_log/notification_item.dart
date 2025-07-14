import 'package:json_annotation/json_annotation.dart'; 


@JsonSerializable(ignoreUnannotated: true,checked: false)
class NotificationItem {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'message')
  final  String? message;
  @JsonKey(name: 'title')
  final  String? title;
  @JsonKey(name: 'notificationType')
  final  String? notificationType;

  NotificationItem( {this.id, this.message, this.notificationType,this.title,});

  factory NotificationItem.fromJson(Map<String, dynamic> json) => NotificationItem(
    id: int.parse(json['id'].toString()),
    message: json['message'] as String?,
    notificationType: json['notificationType'] as String?,
    title: json['title'] as String?,
  );

  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);



  Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
      <String, dynamic>{
        'id': instance.id.toString(),
        'message': instance.message,
        'title': instance.title,
        'notificationType': instance.notificationType,
      };

}

