import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/pages/profile_page.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../data/repositories/user/user_repository.dart';
import '../../../utils/app_utils.dart';
import '../../../presentation/adminFeatures/di/injector.dart';
import '../adminToggle/screen/admin_toggle_builder.dart';
import '../adminToggle/screen/admin_toggle_widget.dart';

class HomeToolbarWidget extends BaseStatelessWidget {
  final Function? onToggleAdmin;
  final bool? isAdmin;
  final bool? haveAdminPrivilege;
  final EdgeInsets? padding;
  HomeToolbarWidget(
      {Key? key,
      this.onToggleAdmin,
      this.isAdmin,
      this.haveAdminPrivilege,
      this.padding});

  Widget profileIcon(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: kSilverTwo)),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.profileScreen);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                Assets.imagesProfile,
                color: kPrimary,
                height: 24,
              ),
            )));
  }

  final _userRepository = getIt.get<UserRepository>();

  @override
  Widget build(BuildContext context) {
    String data = _userRepository.getAccessToken();

    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              getCurrentDate(),
              style: kTextRegular.copyWith(fontSize: 20, color: Colors.black),
            ),
          ),
          haveAdminPrivilege == true
              ? (data == null || data == "")
                  ? SizedBox()
                  : Container(
                      color: kBackground,
                      height: 30,
                      width: 80,
                      child: AdminToggleBuilder())
              : SizedBox(),
        ],
      ),
    );
  }
}
