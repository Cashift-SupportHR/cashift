import 'package:json_annotation/json_annotation.dart';

import '../../../components/index.dart';

part 'city_item.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CityItem {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'nameEn')
  final String? nameEn;
  @JsonKey(name: 'nameAr')
  final String? nameAr;

  CityItem({this.id, this.name, this.nameEn, this.nameAr});

  factory CityItem.fromJson(Map<String, dynamic> json) =>
      _$CityItemFromJson(json);

  Map<String, dynamic> toJson() => _$CityItemToJson(this);

  String toLocal(bool isRtl) {
    return isRtl ? nameAr ?? nameEn ?? '' : nameEn ?? nameAr ?? '';
  }

  static List<Item> toItems(List<CityItem> list, bool isRtl) {
    return list.map((e) => Item(index: e.id ?? 0, value: e.toLocal(isRtl) ?? '')).toList();
  }
}
