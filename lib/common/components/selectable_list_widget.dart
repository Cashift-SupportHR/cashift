import 'package:flutter/material.dart';

class SelectableBuilderWidget extends StatefulWidget {
  final Function(int) onSelect;
  final int count;
  final int? initIndex;
  final ScrollController? scrollController;
  final bool isVertical;
  final EdgeInsetsGeometry? padding;

  final Widget Function(int index, bool isSelected) itemBuilder;

  SelectableBuilderWidget(
      {this.scrollController,
      required this.onSelect,
      required this.count,
      this.padding,
      this.initIndex,
      required this.itemBuilder,
      this.isVertical = false});

  @override
  _SelectableListWidget createState() {
    return _SelectableListWidget();
  }
}

class _SelectableListWidget extends State<SelectableBuilderWidget> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onSelect(int index) {
    if (selectedIndex == index) {
      selectedIndex = index;
    } else {
      selectedIndex = index;
    }
    setState(() {});
    widget.onSelect(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == -1 && widget.initIndex != null) {
      selectedIndex = widget.initIndex!;
    }
    return ListView.builder(
        itemCount: widget.count,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        controller: widget.scrollController,
        scrollDirection: widget.isVertical ? Axis.vertical : Axis.horizontal,
        itemBuilder: (c, i) {
          final isSelected = i == selectedIndex;
          return Padding(
            padding: widget.padding != null
                ? widget.padding!
                : const EdgeInsetsDirectional.only(end: 16),
            child: InkWell(
              onTap: () {
                onSelect(i);
              },
              child: widget.itemBuilder(i, isSelected),
            ),
          );
        });
  }
}
