import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

class TabItemModel{
  final String label ;
  final Widget page ;
  TabItemModel({required this.label ,required this.page});
  Tab builder(){
    return TabWidgetItemBuilder(this);
  }
}

class TabWidgetItemBuilder extends Tab{
  TabWidgetItemBuilder(TabItemModel model, {Key? key}):super(key: key, text: model.label);
}

class TabBarWidget  extends StatelessWidget{

  final List<TabItemModel> tabs ;
  const TabBarWidget({Key? key ,required this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: kBackground,
        appBar:   PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            decoration: BoxDecoration(
              color: kBackground,
              border: Border.all(
                  color: kSilver,
                  width: 0.5,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(30)),
            child: TabBar(
              indicatorColor: kPrimary,
              unselectedLabelStyle: kTextLabel,
              labelStyle: kTextRegular.copyWith(fontSize: 11),
              labelColor: Colors.white,
              unselectedLabelColor:kSilverTwo ,
              indicator: const BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(21))
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: tabs.map((e) => e.builder()).toList(),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: tabs.map((e) => e.page).toList(),
        ),
      ),
    );
  }

}
