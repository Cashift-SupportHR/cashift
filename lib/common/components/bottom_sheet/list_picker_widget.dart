import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../base/base_stateless_widget.dart';
import '../checkbox/custom_check_box.dart';
import '../checkbox/multiple_choice_checkbox.dart';
import '../dropdown/dropdown_filed.dart';
import '../helper_widgets.dart';

class ListPickerWidget extends BaseStatelessWidget {
  static showPicker({
    required BuildContext context,
    bool? setSearch,
    required String title,
    required List<Item> items,
    final Widget Function(BuildContext context, Item item)? itemBuilder,
    searchHint,
    bool isScrollControlled = true,
    Function(Item position)? onSelectItem,
    final bool? isMultiChoice,
    final Function(List<CheckboxItem>)? onMultiSelectItem,
    final List<CheckboxItem>? itemsSelected,
    final bool isSelectAll = false,
    final bool isSelectAllCheckBox = false,
  }) {
    showAppModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        child: ListPickerWidget(
          items: items,
          onSelectItem: onSelectItem,
          searchHint: searchHint,
          itemBuilder: itemBuilder,
          setSearch: setSearch,
          isMultiChoice: isMultiChoice,
          onMultiSelectItem: onMultiSelectItem,
          itemsSelected: itemsSelected,
          isSelectAll: isSelectAll,
          isSelectAllCheckBox: isSelectAllCheckBox,
        ),
        title: title);
  }

  final List<Item> items;
  final Function(Item position)? onSelectItem;
  final bool? isMultiChoice;
  final Function(List<CheckboxItem>)? onMultiSelectItem;
  final List<CheckboxItem>? itemsSelected;
  final String? searchHint;
  final bool? setSearch;
  final Widget Function(BuildContext context, Item item)? itemBuilder;
  final bool isSelectAll;
  final bool isSelectAllCheckBox;

  StreamState<List<Item>> searchStream = StreamStateInitial();

  //List<Item> _items;

  ListPickerWidget({
    Key? key,
    this.setSearch,
    required this.items,
    this.itemBuilder,
    this.onSelectItem,
    this.isMultiChoice,
    this.onMultiSelectItem,
    this.itemsSelected,
    this.searchHint,
    this.isSelectAll = false,
    this.isSelectAllCheckBox = false,
  }) : super(key: key);

  findCityByName(String text) {
    final filter = items
        .where((element) =>
            element.value.toLowerCase().contains(text.toLowerCase()) == true)
        .toList();
    searchStream.setData(filter);
  }

  List<CheckboxItem> itemsSelect = [];

  @override
  Widget build(BuildContext context) {
    itemsSelect = itemsSelected ?? [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        setSearch == true
            ? buildSearchWidget(
                onChange: (String text) {
                  findCityByName(text);
                },
                hint: searchHint ?? strings.search)
            : Container(),
        if (isSelectAllCheckBox) checkAllBox(),
        Expanded(
          child: StreamBuilder<List<Item>>(
              stream: searchStream.stream,
              initialData: items,
              builder: (context, snapshot) {
                final data = snapshot.requireData;
                return isMultiChoice == true
                    ? selectMultiItems(data)
                    : selectSingleItemList(context, data);
              }),
        ),
      ],
    );
  }

  ListView selectSingleItemList(BuildContext context, List<Item> data) {
    return ListView.builder(
        itemCount: data.length,
        addAutomaticKeepAlives: true,
        // padding: EdgeInsets.only(top: 10),
        itemBuilder: (_, position) {
          final item = data[position];
          if (itemBuilder != null) {
            return TextButton(
              onPressed: () async {
                print('position field ${position} ${data[position]}');
                await onSelectItem?.call(item);
                Navigator.pop(context);
              },
              child: itemBuilder!(context, item),
              style: ButtonStyle(
                alignment: AlignmentDirectional
                    .centerStart, // <-- had to set alignment
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.zero, // <-- had to set padding to zero
                ),
              ),
            );
          }
          return Container(
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    onSelectItem!(item);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    alignment: AlignmentDirectional
                        .centerStart, // <-- had to set alignment
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero, // <-- had to set padding to zero
                    ),
                  ),
                  child: Text(
                    item.value,
                    textAlign: TextAlign.start,
                    style: kTextRegular.copyWith(
                        fontSize: 12, decoration: TextDecoration.none),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: kSilverThree,
                )
              ],
            ),
          );
        });
  }

  StreamStateInitial<bool> isSelectAllStream = StreamStateInitial();

  Widget selectMultiItems(List<Item> data) {
    print('itemsSelect length: ${itemsSelect.length}');
    return MultipleChoiceCheckbox(
      items: data.map((e) => CheckboxItem(id: e.index, text: e.value, checked: false)).toList(),
      selectedItems: itemsSelect,
      isDivider: true,
      onChanged: (items) async {
        itemsSelect = items;
        onMultiSelectItem!(items);
        isSelectAllStream.setData(items.length == data.length);
      },
    );
  }

  Widget checkAllBox() {
    return Container(
      width: 100,
      alignment: AlignmentDirectional.centerEnd,
      child: StreamBuilder<bool>(
          initialData: this.items.length == itemsSelected?.length,
          stream: isSelectAllStream.stream,
          builder: (context, snapshot) {
            return CustomCheckBox(
              value: snapshot.data ?? false,
              title: strings.select_all,
              onChanged: (value) {
                if (value == true) {
                  print('value: $value');
                  selectAllAction();
                } else {
                  itemsSelect = [];
                  searchStream.setData(this.items);
                  onMultiSelectItem?.call(itemsSelect);
                }
              },
            );
          }),
    );
  }

  selectAllAction() {
    itemsSelect = [];
    for (var item in this.items) {
      itemsSelect
          .add(CheckboxItem(id: item.index, text: item.value, checked: true));
    }
    // for update the list
    searchStream.setData(this.items);
    onMultiSelectItem!(itemsSelect);
  }
}
