import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/adminToggle/screen/admin_toggle_builder.dart';

import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../../components/base_widget_bloc.dart';
import '../../components/decorations/decorations.dart';
import '../bloc/services_cubit.dart';
import 'services_screen.dart';

class ServicesPage extends BaseBlocWidget<Initialized, ServicesCubit> {
  ServicesPage({Key? key}) : super(key: key);
  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAppService();
  }
  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  List<Widget>? appBarActions(BuildContext context) {
    String data =bloc.getAccessToken();

    return [
      Padding(
        padding: const EdgeInsetsDirectional.only(top: 20, end: 16),
        child: Column(
          children: [
            (data == null || data == "")
                ? SizedBox()
                : Container(
                    color: kBackground,
                    height: 30,
                    width: 80,
                    child: AdminToggleBuilder()),
          ],
        ),
      )
    ];
  }

  @override
  String? title(BuildContext context) {
    return strings.services;
  }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return SlideAnimationWidget(
  //     child: Scaffold(
  //       appBar: kAppBar(context,rounded: true,isMain:false,),
  //       body: buildConsumer(context),
  //     ),
  //   );
  // }

  Widget titleWidget() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: kTextTabBarHeight,
      decoration: Decorations.createRectangleDecorationOnlyBottom(),
      child: Text(
        strings.services,
        style: kTextBold.copyWith(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, Initialized state) {
    return ServicesScreen(services: state.data);
  }
}
