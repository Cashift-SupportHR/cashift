import 'package:json_annotation/json_annotation.dart';

part 'my_order_prams.g.dart';

@JsonSerializable()
class MyOrderPrams {

  @JsonKey(name: "key",includeIfNull: false)
    String? key;
  @JsonKey(name: "page",includeIfNull: false)
    int? page;
  @JsonKey(name: "pageSize",includeIfNull: false)
    int? pageSize;

  MyOrderPrams({
    this.key,
    this.page,
    this.pageSize,
  });

  factory MyOrderPrams.fromJson(Map<String, dynamic> json) => _$MyOrderPramsFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderPramsToJson(this);
}
