import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/projects/project.dart';
import 'package:shiftapp/presentation/presentationUser/favoriteprojects/widgets/project_item_widget.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateful_widget.dart';

import '../../resources/constants.dart';

class SelectableListProjectsWidget extends StatefulWidget {
  final Function(List<int> items) onSelect;
  final List<Project> items;
  final List<int>? initIndexes;
  final ScrollController? controller;

  final Widget Function(BuildContext context, int index)? itemBuilder;

  SelectableListProjectsWidget(
      {required this.onSelect,
      required this.items,
      this.initIndexes,
      this.itemBuilder,
      this.controller});

  @override
  _SelectableListProjectsWidget createState() {
    return _SelectableListProjectsWidget();
  }
}

class _SelectableListProjectsWidget
    extends BaseState<SelectableListProjectsWidget> {
  List<int> selectedIds = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  addSelectItem(int index) {
    print(
        'buildItemCheckBox addSelectItem $index selected ${selectedIds.length} => ${selectedIds.contains(index)} = ${selectedIds.length < (widget.items.length)}');
    if (selectedIds.contains(index)) {
      selectedIds.remove(index);
      setState(() {});
    } else {
      selectedIds.add(index);
      setState(() {});
    }
  }

  Widget buildItem(Project shift, bool isSelected) {
    print('buildItemCheckBox ${shift.id} ');
    return InkWell(
        onTap: () {
          addSelectItem(shift.id);
        },
        child: ProjectItemWidget(
          project: shift,
          isSelected: isSelected,
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (selectedIds.isEmpty && widget.initIndexes != null) {
      selectedIds = widget.initIndexes!;
    }
    double _crossAxisSpacing = 30, _mainAxisSpacing = 0, _aspectRatio = 1.1;

    return Column(
      children: [
        CheckboxListTile(
          value: selectedIds.length == widget.items.length,
          onChanged: (bool? value) {

            setState(() {
              print('CheckboxListTile $value');
              if(value==true){
                selectedIds.clear();
                selectedIds.addAll(widget.items.map((e) => e.id).toList());
              }else{
                selectedIds.clear();
              }
            });
          },
          dense: true,
          contentPadding: EdgeInsets.only(left: 16,right: 16),
          title: Text(
            strings.select_all,
            style: kTextRegular,
          ),
        ),
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: _crossAxisSpacing,
                mainAxisSpacing: _mainAxisSpacing,
                childAspectRatio: _aspectRatio,
              ),
              itemCount: widget.items.length,
              itemBuilder: (c, i) {
                final item = widget.items[i];
                return widget.itemBuilder != null
                    ? widget.itemBuilder!(c, i)
                    : Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildItem(item, selectedIds.contains(item.id)),
                      );
              }),
        ),
        AppCupertinoButton(
          onPressed: selectedIds.isNotEmpty
              ? () {
                  widget.onSelect(selectedIds);
                }
              : null,
          text: strings.save_button,
        )
      ],
    );
  }
}
