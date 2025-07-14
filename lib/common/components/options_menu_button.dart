import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../utils/app_icons.dart';
import '../../presentation/presentationUser/resources/colors.dart';
import 'base/base_stateless_widget.dart';
import 'image_builder.dart';

class OptionsMenuButton extends BaseStatelessWidget {
  final List<Widget>? options;
  final List<String>? optionsString;
  final Widget? title;
  final Widget? icon;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? padding;
  final Function(int index) onSelect;
  OptionsMenuButton(
      {this.options,
        required this.onSelect,
        this.title,
        this.icon,
        this.optionsString,
        this.padding,
        this.shape
      })
      : assert(options == null || optionsString == null,
  'Cannot provide both a optionsString and a options');
  @override
  Widget build(BuildContext context) {
    return buildOptions();
  }

  Widget buildOptions() {
    return PopupMenuButton(

        child: icon != null ? null : (title ?? defaultIcon()),
        icon: icon,

        position: PopupMenuPosition.under,
        itemBuilder: (_) =>
        options != null ? optionItems() : optionItemsBuildWidget(),
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onSelected: (value) {
          print(value);
          print("jkjkjkjkjk");
          onSelect(int.parse(value.toString()));
        });
  }

  List<PopupMenuItem> optionItemsBuildWidget() {
    final items = <PopupMenuItem>[];
    for (int i = 0; i < optionsString!.length; i++) {
      items.add(menuItem(menuItemWidget(optionsString![i]), i));
    }
    return items;
  }

  List<PopupMenuItem> optionItems() {
    final items = <PopupMenuItem>[];
    for (int i = 0; i < options!.length; i++) {
      items.add(menuItem(options![i], i));
    }
    return items;
  }

  PopupMenuItem menuItem(Widget child, int value) {
    return PopupMenuItem<int>(child: child, value: value);
  }

  Widget menuItemWidget(String name) {
    return Text(name,
        style: kTextRegular.copyWith(fontSize: 16, color: kGreyishBrown));
  }

  Widget defaultIcon() {
    return Padding(
      padding: padding ?? const EdgeInsetsDirectional.only(end: 30, top: 20, start: 40, bottom: 18),
      child: kLoadSvgInCirclePath(
        AppIcons.menu,
        height: 6,
        width: 6,
      ),
    );
  }
}