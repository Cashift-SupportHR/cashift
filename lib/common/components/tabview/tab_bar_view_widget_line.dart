import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../decorations/decorations.dart';

class TabBarViewWidgetLine extends StatefulWidget {
  final List<TabLineModel> tabs;
  final List<Widget>? children;
  final EdgeInsetsGeometry? margin;
  final int initialIndex;
  final Function(int index,int id)? onTabChange;
  final Widget? pageWidget;
  final bool isShowCounter;
  final TextStyle? textStyle;

  const TabBarViewWidgetLine({
    Key? key,
    required this.tabs,
    this.children,
    this.margin,
    this.initialIndex = 0,
    this.onTabChange,
    this.pageWidget,
    this.isShowCounter = true,
    this.textStyle
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBarViewWidgetLineState();
  }
}

class _TabBarViewWidgetLineState extends State<TabBarViewWidgetLine>
    with TickerProviderStateMixin {
  TabController? tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(
        initialIndex: widget.initialIndex,
        length: widget.tabs.length,
        vsync: this,
        animationDuration: const Duration(milliseconds: 500));
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: kToolbarHeight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StatefulBuilder(builder: (context, setState) {
              return DecoratedBox(
                decoration: Decorations.decorationBottomBorder(),
                child: TabBar(
                  controller: tabController,
                  isScrollable: widget.tabs.length > 3,
                  labelStyle: kTextSemiBold.copyWith(fontSize: 18),
                  padding: EdgeInsets.zero,
                  indicatorColor: kPrimary,
                  labelPadding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsetsDirectional.only(end: _selectedIndex == widget.tabs.length - 1 ? 0 : 20),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabAlignment: widget.tabs.length > 3 ? TabAlignment.start : TabAlignment.fill,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                      tabController!.animateTo(index);
                      if (widget.onTabChange != null) {
                        widget.onTabChange!(index, widget.tabs[index].id);
                      }
                    });
                  },
                  tabs: widget.tabs
                      .map(
                        (e) => FittedBox(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(end: 20),
                            child: Column(
                              children: [
                                Text(
                                  e.text,
                                  style: widget.textStyle ?? kTextMedium.copyWith(
                                      fontSize: 12,
                                      color: _selectedIndex ==
                                              widget.tabs.indexOf(e)
                                          ? kPrimary
                                          : kGray_CD),
                                ),
                                if(widget.isShowCounter)
                                ...[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                  e.count.toString(),
                                  style: kTextBold.copyWith(
                                    fontSize: 14,
                                    color:
                                        _selectedIndex == widget.tabs.indexOf(e)
                                            ? kRateBarIconColor
                                            : kGray_CD,
                                  ),
                                ),]
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: widget.pageWidget ??
                TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: widget.children
                      ?.map(
                        (e) => e,
                      )
                      .toList() ??
                      [],
                  controller: tabController,
                ),
          )
        ]);
  }
}

class TabLineModel {
  final int id;
  final String text;
  int count;

  TabLineModel({required this.id, required this.text, this.count = 0});
}
