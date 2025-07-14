import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../decorations/decorations.dart';

class DynamicTabBarView extends StatefulWidget {
  final int? initialIndex;
  final List<DynamicItem> tabs;
  final List<Widget>? children;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry? marginTabs;
  final bool? isSeparate;
  final Widget? pageWidget;
  final Function(int)? onTap;
  final bool isScrollable;

  DynamicTabBarView({Key? key, required this.tabs, this.children, this.margin, this.isSeparate = false, this.padding, this.labelPadding, this.marginTabs, this.pageWidget, this.onTap, this.initialIndex, this.isScrollable = false})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DynamicTabBarViewState();
  }
}

class _DynamicTabBarViewState extends State<DynamicTabBarView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: widget.tabs.length, vsync: this, initialIndex: widget.initialIndex ?? 0);

    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Container(
        margin: widget.margin ?? EdgeInsets.zero,
        decoration: widget.isSeparate! ? BoxDecoration(color: kBackground) : Decorations.decorationTabBarView(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          Container(
            clipBehavior: Clip.hardEdge,
            margin: widget.marginTabs ?? EdgeInsets.zero,
            decoration: widget.isSeparate! ? Decorations.decorationTabs : Decorations.decorationTabsOnlyTop(),
            child: PreferredSize(
                preferredSize: const Size.fromHeight(100.0),
                child: TabBar(
                  labelStyle: kTextBodyBold.copyWith(
                    color: kGreen_2,
                    fontSize: 12,
                  ),
                  controller: tabController,
                  indicator: Decorations.decorationIndicator,
                  indicatorColor: kWhite,
                  labelColor: kGreen_2,
                  padding: EdgeInsets.zero,
                  isScrollable: widget.isScrollable,
                  indicatorPadding: EdgeInsets.zero,
                  unselectedLabelColor: kGreen_2,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: widget.labelPadding ?? const EdgeInsets.only(bottom: 0),
                  tabAlignment:  widget.isScrollable ? TabAlignment.start : null,
                  onTap: (idTap) {
                    if (widget.onTap != null) {
                      widget.onTap?.call(widget.tabs[idTap].id);
                    }
                  },
                  tabs: widget.tabs
                      .map((e) => Tab(
                            child: FittedBox(
                              child: Text(
                                e.name,
                              ),
                            ),
                          ))
                      .toList(),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          if (widget.pageWidget != null || widget.children != null)
          Expanded(
            child: widget.pageWidget ??
                TabBarView(
                    children: widget.children
                            ?.map(
                              (e) => e,
                            )
                            .toList() ??
                        [],
                    controller: tabController),
          )
        ]),
      ),
    );
  }
}

class DynamicItem {
  DynamicItem({
    required this.id,
    required this.name,
    this.code,
  });

  int id;
  String name;
  String? code;
}
