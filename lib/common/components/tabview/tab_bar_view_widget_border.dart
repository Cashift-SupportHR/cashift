import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/common/common_state.dart';
import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

class TabBarViewWidgetBorder extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  final int initialIndex;
  final StreamStateInitial<int> initialIndexStream;

  const TabBarViewWidgetBorder(
      {Key? key, required this.tabs, required this.children, this.margin, this.initialIndex = 0, required this.initialIndexStream})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBarViewWidgetBorderState();
  }
}

class _TabBarViewWidgetBorderState extends State<TabBarViewWidgetBorder>
    with TickerProviderStateMixin {
  TabController? tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController =
        TabController(initialIndex: widget.initialIndex,
            length: widget.tabs.length, vsync: this, animationDuration: const Duration(milliseconds: 500));
    _selectedIndex = widget.initialIndex;
  }
  @override
  Widget build(BuildContext context) {
    print('TabBarViewWidgetBorder build${widget.initialIndex}');
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: kToolbarHeight - 20,
            child: StatefulBuilder(
                builder: (context, setState) {
                  return TabBar(
                    controller: tabController,
                    isScrollable: true,
                    labelColor: kPrimary,
                    unselectedLabelColor: kSteal,
                    labelStyle: kTextSemiBold.copyWith(fontSize: 18),
                    labelPadding: EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    indicator: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    splashBorderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    tabs: widget.tabs
                        .map(
                          (e) => Container(
                        decoration: const BoxDecoration(
                          color:  kGrey_EE,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),// BorderRadius

                        ),//
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: _selectedIndex !=  widget.tabs.indexOf(e) ? const EdgeInsets.only(
                            bottom: 2,
                          ) : const EdgeInsets.only(
                            bottom: 0,
                            top: 2,
                            left: 2,
                            right: 2,
                          ),
                          decoration:  const BoxDecoration(
                            color: kBackground,

                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13.0),
                              topRight: Radius.circular(13.0),
                            ),// BorderRadius

                          ) ,// BoxDecoration
                          child: Tab(
                            child: Text(
                              e,
                            ),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  );
                }
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),

              children: widget.children
                  .map(
                    (e) => e,
              )
                  .toList(),
              controller: tabController,
            ),
          )
        ]);
  }
}
