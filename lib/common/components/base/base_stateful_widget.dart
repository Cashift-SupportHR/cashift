import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/common/components/progress/progress_dialog.dart';
import '../dialogs_manager.dart';
/*
abstract class BaseStatefulWidget extends StatefulWidget {
  final strings = Get.context!.getStrings();
  final local = Get.locale?.languageCode ?? 'en';
  final CustomProgressDialog progress =
      DialogsManager.createProgress(Get.context!);

  bool isRtl() => local == 'ar';

  BaseStatefulWidget({Key? key}) : super(key: key);

  T? getArguments<T>(BuildContext context ){
    return context.getArguments();
  }
}*/
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final strings = Get.context!.getStrings();
  final local = Get.locale?.languageCode ?? 'en';
  final CustomProgressDialog progress =
  DialogsManager.createProgress(Get.context!);

  bool isRtl() => local == 'ar';
  void showErrorDialog(String error, BuildContext context) {
    DialogsManager.showErrorDialog(context, error);
  }

}
