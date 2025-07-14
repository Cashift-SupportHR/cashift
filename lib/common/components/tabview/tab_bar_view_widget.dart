import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../decorations/decorations.dart';

class TabBarViewWidget extends StatefulWidget {
  final List<String> tabs;
  final List<Widget>? children;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? marginTabs;
  final bool? isSeparate;
  final bool isScrollable;
  final Widget? pageWidget;
  final Function(int index)? onTap;
  final EdgeInsetsGeometry? labelPadding;

  TabBarViewWidget(
      {Key? key, required this.tabs, this.children, this.margin, this.isSeparate = false, this.padding, this.marginTabs, this.pageWidget, this.onTap, this.isScrollable = false, this.labelPadding})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBarViewWidgetState();
  }
}

class _TabBarViewWidgetState extends State<TabBarViewWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: widget.tabs.length, vsync: this);

    return Container(
      margin: widget.margin ?? const EdgeInsets.only(bottom: 16),
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
                isScrollable: widget.isScrollable,
                controller: tabController,
                indicator: Decorations.decorationIndicator,
                indicatorColor: kWhite,
                labelColor: kGreen_2,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                unselectedLabelColor: kGreen_2,
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: widget.isScrollable ? TabAlignment.start : TabAlignment.fill,
                labelPadding: widget.labelPadding ?? (widget.isScrollable ? EdgeInsets.symmetric(horizontal: 10) : const EdgeInsets.only(bottom: 0)),
                onTap: (index) {
                  if (widget.onTap != null) {
                    widget.onTap!(index);
                  }
                },
                tabs: widget.tabs
                    .map((e) => Tab(
                          child: FittedBox(
                            child: Text(
                              e,
                            ),
                          ),
                        ))
                    .toList(),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
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
    );
  }
}
