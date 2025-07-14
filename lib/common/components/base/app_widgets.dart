import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../custom_app_bar.dart';

// final kScreenWidth =  MediaQuery.of(Get.context!).size.width;

class AppWidgets {}

AppBar kAppBar(BuildContext context,
    {String title = 'Cashift',
    bool hasDrawerMenu = true,
    Function? onClickMenu,
    bool isMain = false,
    bool rounded = true}) {
  // final isMain  = routeName == MainPage.routeName ;
  return AppBar(
    leading: hasDrawerMenu
        ? isMain
            ? IconButton(
                onPressed: () {
                  if (onClickMenu != null) {
                    onClickMenu();
                  }
                },
                icon: const Icon(Icons.menu))
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: Colors.white,
              )
        : Container(),
    elevation: 0,
    toolbarHeight: 60,
    centerTitle: true,
    shape: rounded ? kAppBarShape : null,
    title: Text(
      title,
      style: kTextMedium.copyWith(color: Colors.white),
    ),
    backgroundColor: kPrimary,
  );
}

AppBar kAppBarCountPages(BuildContext context,
    {String title = '',
    String subtitle = '',
    Widget? endWidget,
    bool rounded = true}) {
  // final isMain  = routeName == MainPage.routeName ;
  return AppBar(
    leading: Container(),
    elevation: 0,
    actions: [
      Container(
        padding: EdgeInsetsDirectional.only(end: 16),
        child: Center(child: endWidget!),
      )
    ],
    flexibleSpace: SafeArea(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kTextMedium.copyWith(color: Colors.white),
                ),
                Text(
                  subtitle,
                  style: kTextLabelWhite.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    toolbarHeight: 60,
    centerTitle: false,
    shape: rounded ? kAppBarShape : null,
    backgroundColor: kPrimary,
  );
}

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Color? barColor;
  final Color? background;
  final bool canBak;
  final Function? onClickBack;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? leading;
  final bool isDivider;
  final bool resizeToAvoidBottomInset;

  const AppScaffold({
    Key? key,
    this.title,
    required this.body,
    this.barColor,
    this.onClickBack,
    this.background,
    this.canBak = true,
    this.actions,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.leading,
    this.isDivider = true,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ?? kBackground,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: title != null
              ? kAppBarWhite(
                  context,
                  title: title!,

                  color: barColor ?? kAppBarColor,
                  setBack: canBak,
                  onClickBack: onClickBack,
                  leading: leading,
                  actions: actions,
                  isDivider: isDivider,
                )
              : null,
          body: body,
          floatingActionButton: floatingActionButton,
          backgroundColor: background ?? kBackground,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
