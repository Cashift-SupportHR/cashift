import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

class CustomTabsDynamic extends StatelessWidget {
  final List<CustomTabsModel> tabs;
  final Function(int)? onTabSelected;
  final Widget page;
  final int initialIndex;

  CustomTabsDynamic({
    Key? key,
    required this.tabs,
    required this.page,
    this.onTabSelected,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(width: 1, color: kWhiteE4),
              ),
              child: TabBar(
                  isScrollable: true,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [
                          kPrimary,
                          kCoolTeal2,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.23, 13.2],
                      )),
                  splashBorderRadius: BorderRadius.circular(6),
                  labelColor: Colors.white,
                  onTap: (index) {
                    if (onTabSelected != null) onTabSelected!(tabs[index].id);
                  },
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: kTextRegular.copyWith(fontSize: 15),
                  unselectedLabelColor: kSilver,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  tabs: tabs
                      .map((e) => Tab(
                            text: e.text,
                          ))
                      .toList()),
            ),
          ),
          Expanded(child: page)
        ],
      ),
    );
  }
}

class CustomTabsModel {
  final String text;
  final int id;

  CustomTabsModel({required this.text, required this.id});
}

class CustomTabs extends StatelessWidget {
  final List<String> tabs;
  final Function(int)? onTabSelected;
  final List<Widget> children;
  final int initialIndex;

  CustomTabs({
    Key? key,
    required this.tabs,
    required this.children,
    this.onTabSelected,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: kWhiteE4),
              ),
              child: TabBar(
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        colors: [
                          kPrimary,
                          kCoolTeal2,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.23, 13.2],
                      )),
                  splashBorderRadius: BorderRadius.circular(16),
                  labelColor: Colors.white,
                  onTap: (index) {
                    if (onTabSelected != null) onTabSelected!(index);
                  },
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: kTextRegular.copyWith(fontSize: 12),
                  unselectedLabelColor: kSilver,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  tabs: tabs
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList()),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
