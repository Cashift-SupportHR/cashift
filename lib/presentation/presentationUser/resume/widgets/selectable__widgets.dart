import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../common/domain/entities/resume/index.dart';
import '../../resources/constants.dart';
import '../pages/favoritejobs/widgets/favorite_job_item.dart';

class SelectableListWidget extends StatefulWidget {
  final Function(int) onSelect;
  final List<String> items;
  final int? initIndex;
  final bool hasCheckBox;
  final bool? isVertically;
  final bool flowStyle;

  final ScrollController? controller;

  final Widget Function(BuildContext context, int index)? itemBuilder;

  SelectableListWidget(
      {required this.onSelect,
      required this.items,
      this.initIndex,
      this.itemBuilder,
      this.hasCheckBox = true,
      this.flowStyle = false,
      this.controller,
      this.isVertically = true});

  @override
  _SelectableListWidget createState() {
    return _SelectableListWidget();
  }
}

class _SelectableListWidget extends State<SelectableListWidget> {
  int selectedIndex = -1;
  Color textColor = kGreyishBrown;
  Color selectedColor = kPrimaryDark;
  Color unselectedColor = kBackgroundColor;
  Color currentFillColor = kPrimaryDark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('addPostFrameCallback select new ${widget.initIndex}');
      if (widget.initIndex != null && widget.initIndex != -1) {
        widget.onSelect(widget.initIndex!);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildItem(String shift, int index, bool isSelected) {
    currentFillColor = isSelected ? selectedColor : unselectedColor;
    textColor = isSelected ? Colors.white : kFontDark;

    return RawMaterialButton(
      textStyle: kTextMedium.copyWith(color: textColor),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      elevation: 2,
      disabledElevation: 0,
      fillColor: currentFillColor,
      onPressed: () {
        if (selectedIndex == index) {
          selectedIndex = index;
        } else {
          selectedIndex = index;
        }
        setState(() {});
        widget.onSelect(selectedIndex);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: widget.hasCheckBox
          ? Row(
              children: [
                Expanded(child: Text(shift.toString())),
                Checkbox(
                  value: selectedIndex == index,
                  onChanged: (s) {},
                  activeColor: kOrange,
                ),
              ],
            )
          : Text(shift.toString()),
    );
  }

  Widget buildItemCheckBox(String shift, int index, bool isSelected) {
    currentFillColor = isSelected ? selectedColor : unselectedColor;
    textColor = isSelected ? Colors.white : kFontDark;
    return RadioListTile(
        dense: true,
        contentPadding: EdgeInsets.all(0),
        activeColor: kPrimary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        value: index,
        title: Text(
          shift,
          style: kTextMediumPrimary.copyWith(fontSize: 12),
        ),
        groupValue: selectedIndex,
        onChanged: (s) {
          if (selectedIndex == index) {
            selectedIndex = index;
          } else {
            selectedIndex = index;
          }
          setState(() {});
          widget.onSelect(selectedIndex);
        });
  }

  List<Widget> buildShiftList() {
    List<Widget> widgets = [];
    widget.items.asMap().forEach((key, e) {
      final item = buildItem(e, key, key == selectedIndex);
      widgets.add(item);
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == -1 && widget.initIndex != null) {
      selectedIndex = widget.initIndex!;
    }
    double _crossAxisSpacing = 0, _mainAxisSpacing = 2, _aspectRatio = 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.flowStyle
            ? Wrap(
                spacing: 4,
                runSpacing: 4,
                children: buildShiftList(),
              )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: widget.isVertically == true
                    ? Axis.vertical
                    : Axis.horizontal,
                addAutomaticKeepAlives: true,
                controller: widget.controller,
                itemCount: widget.items.length,
                itemBuilder: (c, i) {
                  return widget.itemBuilder != null
                      ? widget.itemBuilder!(c, i)
                      : widget.hasCheckBox
                          ? buildItemCheckBox(
                              widget.items[i], i, i == selectedIndex)
                          : buildItem(widget.items[i], i, i == selectedIndex);
                })
        /*     GridView.builder(
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: _crossAxisSpacing,
              mainAxisSpacing: _mainAxisSpacing,
              childAspectRatio: _aspectRatio,
            ),
            itemCount: widget.items.length,
            itemBuilder: (c, i) {
              return widget.itemBuilder !=null ? widget.itemBuilder!(c,i) : Padding(
                padding: const EdgeInsets.all(4.0),
                child: widget.hasCheckBox ? buildItemCheckBox(widget.items[i], i, i == selectedIndex):buildItem(widget.items[i], i, i == selectedIndex),
              );
            })*/
      ],
    );
  }
}

class MultiSelectableListWidget extends StatefulWidget {
  final Function(List<int> items) onSelect;
  final List<JobItem> items;
  final List<int>? initIndexes;
  final bool hasCheckBox;
  final bool flowStyle;
  final ScrollController? controller;
  final int? maxDays;

  final Widget Function(BuildContext context, int index)? itemBuilder;

  MultiSelectableListWidget(
      {required this.onSelect,
      this.maxDays,
      required this.items,
      this.initIndexes,
      this.itemBuilder,
      this.hasCheckBox = false,
      this.flowStyle = false,
      this.controller});

  @override
  _MultiSelectableListWidget createState() {
    return _MultiSelectableListWidget();
  }
}

class _MultiSelectableListWidget extends State<MultiSelectableListWidget> {
  List<int> selectedIndex = [];
  Color textColor = kGreyishBrown;
  Color subtextColor = kBattleShipGrey;
  Color selectedColor = kPrimaryDark;
  Color unselectedColor = Colors.white;

  Color selectedIconColor = Colors.white ;
  Color unselectedIconColor = kPrimaryDark.withOpacity(0.10);

  Color currentIconColor = Colors.white;
  Color currentFillColor = kPrimaryDark;

  @override
  void initState() {
    print('initState addSelectItem ${selectedIndex}');
    super.initState();
    setState(() {

    });
    selectedIndex =[];
  }

  @override
  void dispose() {
    super.dispose();
    print('initState dispose');


  }

  addSelectItem(int index) {
    if (selectedIndex.contains(index)) {
      selectedIndex.remove(index);
      setState(() {});
      widget.onSelect(selectedIndex);
    } else if (selectedIndex.length < (widget.maxDays ?? widget.items.length)) {
      selectedIndex.add(index);
      print('buildItemCheckBox onADD ${index}');
      setState(() {});
      widget.onSelect(selectedIndex);
    }
  }

  Widget buildItem(JobItem jobItem, int index, bool isSelected) {
    currentFillColor = isSelected ? selectedColor : unselectedColor;
    textColor = isSelected ? Colors.white : kAlmostBlack;
    subtextColor = isSelected ? Colors.white : kBattleShipGrey;
    currentIconColor = isSelected ? selectedIconColor : unselectedIconColor;
    print('buildItemCheckBox ${jobItem.jobName} $index $selectedIndex');
    return InkWell(
      onTap: () {
        print(
            'buildItemCheckBox onChanged bb ${jobItem.jobName} ${selectedIndex.contains(index)}');

        addSelectItem(index);
        print(
            'buildItemCheckBox onChanged ${jobItem.jobName} ${selectedIndex.contains(index)}');
      },
      child: FavoriteJobItem(
        jobItem: jobItem,
        textColor: textColor,
        currentFillColor: currentFillColor,
        currentIconColor: currentIconColor,
      ),
    );
  }

  Widget buildItemCheckBox(JobItem jobItem, int index, bool isSelected) {
    currentFillColor = isSelected ? selectedColor : unselectedColor;
    textColor = isSelected ? Colors.white : kFontDark;
    print('buildItemCheckBox ${jobItem.jobName} $index');
    return Row(
      children: [
        Checkbox(
            activeColor: kPrimary,
            splashRadius: 2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            value: selectedIndex.contains(index),
            onChanged: (s) {
              print(
                  'buildItemCheckBox onChanged bb ${jobItem.jobName} ${selectedIndex.contains(index)}');

              addSelectItem(index);
              print(
                  'buildItemCheckBox onChanged ${jobItem.jobName} ${selectedIndex.contains(index)}');
            }),
        Expanded(
          child: Text(
            jobItem.jobName ?? '',
            textAlign: TextAlign.center,
            style: kTextMedium.copyWith(fontSize: 12),
          ),
        )
      ],
    );
  }

/*Text(
         shift,
          style: kTextMedium.copyWith(fontSize: 12),
        )*/
  List<Widget> buildShiftList() {
    List<Widget> widgets = [];
    widget.items.asMap().forEach((key, e) {
      final item = buildItem(e, key, key == selectedIndex);
      widgets.add(item);
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    if (selectedIndex.isEmpty && widget.initIndexes != null) {
      selectedIndex = widget.initIndexes!;
    }
    double _crossAxisSpacing = 20, _mainAxisSpacing = 8, _aspectRatio = 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.flowStyle
            ? Wrap(
                spacing: 4,
                runSpacing: 4,
                children: buildShiftList(),
              )
            :

            // ListView.builder(
            //     shrinkWrap: true,
            //     addAutomaticKeepAlives: true,
            //     controller: widget.controller,
            //     itemCount: widget.items.length,
            //     itemBuilder: (c, i) {
            //       return widget.itemBuilder !=null ? widget.itemBuilder!(c,i) : widget.hasCheckBox ? buildItemCheckBox(widget.items[i], i, selectedIndex.contains(i)):buildItem(widget.items[i], i, selectedIndex.contains(i));
            //     })
            GridView.builder(
                shrinkWrap: true,
                addAutomaticKeepAlives: true,
                scrollDirection: Axis.vertical,
                controller: widget.controller,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: _crossAxisSpacing,
                  mainAxisSpacing: _mainAxisSpacing,
                  childAspectRatio: _aspectRatio,
                ),
                itemCount: widget.items.length,
                itemBuilder: (c, i) {
                  return widget.itemBuilder != null
                      ? widget.itemBuilder!(c, i)
                      : Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: widget.hasCheckBox
                              ? buildItemCheckBox(
                                  widget.items[i], i, selectedIndex.contains(i))
                              : buildItem(widget.items[i], i,
                                  selectedIndex.contains(i)),
                        );
                })
      ],
    );
  }
}
