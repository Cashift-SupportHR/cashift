import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

class MaterialAppDialog {
  final BuildContext context ;
  final Widget content ;
  final bool cancelable;
  MaterialAppDialog({required this.context,required this.content ,this.cancelable = false});

  bool isShow = false;
  void show(){
    if(!isShow) {
      isShow = true;
      showDialog(
          barrierColor: kPrimaryDark.withOpacity(0.7),
          barrierDismissible: cancelable,
          useSafeArea: true,
          context: context,
          builder: (_) => content);
    }
  }

  void dismiss(){
    if(isShow) {
      isShow = false;
      Navigator.pop(context);
    }
    }

}

abstract class BaseDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 16),
            child: Center(
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: buildWidget(context),
              ),
            )));
  }

  @protected
  Widget buildWidget(BuildContext context);
}
