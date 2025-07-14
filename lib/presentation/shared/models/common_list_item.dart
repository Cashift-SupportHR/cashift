
import '../../../common/components/dropdown/dropdown_filed.dart';
import '../../../common/components/index.dart';
import '../../../common/components/tabview/dynamic_tab_bar_view.dart';
import 'common_list_item_dto.dart';

class CommonListItem{
  int? id;
  int? employeeId;
  String? name;
  String? icon;
  String? code;
  bool? isShowActionButton;

  CommonListItem({this.id, this.employeeId, this.name, this.icon, this.code, this.isShowActionButton});

   factory CommonListItem.fromDto(CommonListItemDto json) {
    return CommonListItem(
      id: json.id,
      employeeId: json.employeeId,
      name: json.name,
      icon: json.icon,
      code: json.code,
      isShowActionButton: json.isShowActionButton,
    );
   }

  static fromDtoList(List<CommonListItemDto> json) {
    return json.map((e) => CommonListItem.fromDto(e)).toList();
  }

  static toItemsListPicker(List<CommonListItem> json) {
    return json.map((e) => Item(
       index: e.id ?? e.employeeId ?? 0,
      value: e.name!,
    )).toList();
  }

  static toDynamicItemsList(List<CommonListItem> list){
    return list.map((e) => DynamicItem(
      id: e.id ?? e.employeeId ?? 0,
      name: e.name ?? '',
      code: e.code,
    )).toList();
  }

  static CommonListItem getShowActionButton(int id, List<CommonListItem> list) {
    final item = list.firstWhere((element) => element.id == id, orElse: () => CommonListItem());
    return item;
  }
}

