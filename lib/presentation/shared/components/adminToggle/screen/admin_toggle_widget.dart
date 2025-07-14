import 'package:flutter/material.dart';
 import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

 import '../../../../../common/domain/entities/account/user.dart';
import '../../../../../main_index.dart';
import '../../base_stateless_widget.dart';

class AdminToggleWidget extends BaseStatelessWidget {
  final Function() onAction;
  final Function(bool) setEnableAdmin;
  String image;
  bool isAdmin;
  bool adminEnable;
  bool isAllowFaceRecognition;
  User user;
  AdminToggleWidget(
      {required this.user,
      required this.setEnableAdmin,
      required this.isAllowFaceRecognition,
      required this.adminEnable,
      required this.onAction,
      required this.image,
      required this.isAdmin});

  final tabs = ['ادمن', 'موظف'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return adminEnable == true
        ? Container(
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kGreen_6E, width: 1)),
            child: InkWell(
              onTap: () async {
                if (image == "") {
                  isAllowFaceRecognition == true
                      ? await Navigator.pushNamed(
                          context, Routes.faceRecognitionPage,
                          arguments: user)
                      : onToggle(isAdmin, context);
                } else {
                  isAllowFaceRecognition == true
                      ? onAction()
                      : onToggle(isAdmin, context);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  selectedItemContainer(
                      selected: isAdmin,
                      icon: Icons.admin_panel_settings,
                      label: strings.admin),
                  selectedItemContainer(
                      selected: !isAdmin,
                      icon: Icons.person,
                      label: strings.employee),
                ],
              ),
            ),
          )
        : SizedBox.shrink();
  }

  Widget selectedItemContainer(
      {required bool selected, required String label, required IconData icon}) {
    return selected
        ? Container(
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryDark,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 4, start: 2),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(
                    label,
                    style: kTextRegular.copyWith(
                        color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          )
        : Container(
            child: Icon(
              icon,
              size: 20,
              color: kPrimaryDark,
            ),
          );
  }

  void onToggle(bool isAdmin, context) {
    setEnableAdmin(!isAdmin);
    Navigator.pushReplacementNamed(context, Routes.home);
  }
}
