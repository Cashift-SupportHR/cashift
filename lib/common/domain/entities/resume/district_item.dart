import 'package:json_annotation/json_annotation.dart';

import '../../../../presentation/shared/components/index.dart';


part 'district_item.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class DistrictItem {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'cityId')
  int? cityId;
  @JsonKey(name: 'name')
  String? name;

  DistrictItem({this.id, this.cityId, this.name});

   factory DistrictItem.fromJson(Map<String, dynamic> json) => _$DistrictItemFromJson(json);

   Map<String, dynamic> toJson() => _$DistrictItemToJson(this);

  static List<Item> toListItem(List<DistrictItem> list) {
    return list.map((e) => Item(index: e.id!, value: e.name!)).toList();
  }
}

